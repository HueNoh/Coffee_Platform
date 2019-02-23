unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.IB, FireDAC.Phys.IBDef,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, Datasnap.Provider, FireDAC.Phys.IBBase, FireDAC.Comp.UI;

type
  TServerMethods1 = class(TDSServerModule)
    FDConnection1: TFDConnection;
    ResvQuery: TFDQuery;
    InsResvWaitQuery: TFDQuery;
    SignUpQuery: TFDQuery;
    ResvWaitQuery: TFDQuery;
    SignInQuery: TFDQuery;
    ResReq1_I: TFDQuery;
    ResReq2_U: TFDQuery;
    ResApply1_U: TFDQuery;
    ResCncl1_D: TFDQuery;
    ResApply2_I: TFDQuery;
    ResCncl2_U: TFDQuery;
    ResApply3_D: TFDQuery;
    ResApply4_U: TFDQuery;
    SignUpUserQuery: TFDQuery;
    SignInUserQuery: TFDQuery;
    SignInQueryProvider: TDataSetProvider;
    ProdQueryProvider: TDataSetProvider;
    ProdQuery: TFDQuery;
    RestWaitProvider: TDataSetProvider;
    BizQueryProvider: TDataSetProvider;
    NotiQueryProvider: TDataSetProvider;
    ResvWaitQueryProvider: TDataSetProvider;
    BizQuery: TFDQuery;
    NotiQuery: TFDQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    UserTable: TFDTable;
    UserTableUSR_CODE: TIntegerField;
    UserTableEMAIL: TWideStringField;
    UserTablePW: TWideStringField;
    UserTablePHONE: TWideStringField;
    UserTableREG_DATE: TSQLTimeStampField;
    UserTableOUT_DATE: TSQLTimeStampField;
    ResvWaitJoin: TFDQuery;
    ResvWaitJoinProvider: TDataSetProvider;
    UserTableProvider: TDataSetProvider;
    UserJoin: TFDQuery;
    UserJoinProvider: TDataSetProvider;
    ResvJoin: TFDQuery;
    ResvJoinProvider: TDataSetProvider;
    ResvJoinRES_DATE: TSQLTimeStampField;
    ResvJoinBIZ_CODE: TIntegerField;
    ResvJoinPRD_CODE: TIntegerField;
    ResvJoinUSR_CODE: TIntegerField;
    ResvJoinCNT: TIntegerField;
    ResvJoinTITLE: TWideStringField;
    ResvJoinCONTENT: TWideStringField;
    ResvJoinIMG: TBlobField;
    ResvJoinPRICE: TIntegerField;
    ResvJoinSTOCK: TIntegerField;
    ResvJoinKEY_DATE: TSQLTimeStampField;
    ResvJoinPHONE: TWideStringField;
    UserJoinUSR_CODE: TIntegerField;
    UserJoinEMAIL: TWideStringField;
    UserJoinPW: TWideStringField;
    UserJoinPHONE: TWideStringField;
    UserJoinREG_DATE: TSQLTimeStampField;
    UserJoinOUT_DATE: TSQLTimeStampField;
    UserJoinUSR_CODE_1: TIntegerField;
    UserJoinBIZ_CODE: TIntegerField;
    UserJoinCHARGE: TIntegerField;
    UserJoinCPNCNT: TIntegerField;
    FDQuery1: TFDQuery;
    IntegerField1: TIntegerField;
    WideStringField1: TWideStringField;
    WideStringField2: TWideStringField;
    WideStringField3: TWideStringField;
    SQLTimeStampField1: TSQLTimeStampField;
    SQLTimeStampField2: TSQLTimeStampField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    usUserJoin: TFDUpdateSQL;
    UserJoinUpdate1: TFDQuery;
    UserJoinUpdate2: TFDQuery;
    procedure NotiQueryNewRecord(DataSet: TDataSet);
  private
//    function GetStatus(;
    { Private declarations }
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    // 쿠폰, 충전
    procedure UserCharge(ABizCode, AUsrCode, AVal, AValType: Integer);

    // 사업자 회원가입(사업자번호, 비밀번호, 매장이름, 주소)
    function SignUp(ABizNum, APw, AStoreNm, AAddr: string):boolean;
    // 사업자 로그인(사업자번호, 비밀번호)
    function SignIn(ABizNum, APw: string):Integer;
    // 사용자 회원가입(이메일주소, 비밀번호, 전화번호)
    function SignUpUser(AEmail, APw, APhone: string): boolean;
    // 사용자 로그인(이메일, 비밀번호)
    function SignInUser(AEmail, APW: string): Integer;
    // 사용자 예약내역 조회
    // 관리자/사용자 예약대기열 조회(매장코드, status<>'y')
    // 1. 관리자 예약판매대기열 등록(상품, 매장, 판매예정수량): 성공여부
    function InsResvWait(APrdCode, ABizCode, ASalesCnt: Integer): boolean;
    // 2-1. 사용자 예약 요청(사용자, 매장, 상품, 예약수량): 성공여부
    function ResReq(AUsrCode, ABizCode, APrdCode, ACnt: Integer; AKeyDate: TDateTime): integer;
    // 2-2. 사용자 예약 취소(사용자, 매장, 상품): 성공여부
    function ResCncl(APrdCode, ACnt: integer; AResDate, AKeyDate: TDateTime): Integer;
    // 3. 관리자 예약 확정/출고(매장, 상품)
//    function ResApply(ABizCode, APrdCode): boolean;
    function ResApply(ACnt, ABizCode, APrdCode: integer; ADateTime: TDateTime): Integer;
  end;

implementation


{$R *.dfm}


uses System.StrUtils, ServerContainerUnit1;

function TServerMethods1.InsResvWait(APrdCode, ABizCode,
  ASalesCnt: integer): boolean;
begin

end;

procedure TServerMethods1.NotiQueryNewRecord(DataSet: TDataSet);

begin

end;

// 관리자 출고
function TServerMethods1.ResApply(ACnt, ABizCode, APrdCode: integer; ADateTime: TDateTime): Integer;
var
  Value: TJSONString;
begin
  Result := 0;

  ResApply1_U.Close; // 예약대기열 상태 변경
  ResApply2_I.Close; // 실적테이블 전체 적재
  ResApply3_D.Close; // 예약테이블 전체 삭제
  ResApply4_U.Close; // 상품테이블 재고 변경

  FDConnection1.StartTransaction;
  try
    try
      ResApply1_U.ParamByName('ST_DATE').AsDateTime := ADateTime;
      ResApply1_U.ParamByName('PRD_CODE').AsInteger := APrdCode;
      ResApply1_U.ExecSQL;
    except //on e:EFDDBEngineException do
      begin
         result := 1;
         raise;
      end;
    end;
    try
      ResApply2_I.ParamByName('ST_DATE').AsDateTime := ADateTime;
      ResApply2_I.ParamByName('PRD_CODE').AsInteger := APrdCode;
      ResApply2_I.ExecSQL;
    except //on e:EFDDBEngineException do
      begin
         result := 2;
         raise;
      end;
    end;
    try
      ResApply3_D.ParamByName('ST_DATE').AsDateTime := ADateTime;
      ResApply3_D.ParamByName('PRD_CODE').AsInteger := APrdCode;
      ResApply3_D.ExecSQL;
    except //on e:EFDDBEngineException do
      begin
         result := 3;
         raise;
      end;
    end;
    try
      ResApply4_U.ParamByName('CNT').AsInteger := APrdCode;
      ResApply4_U.ParamByName('PRD_CODE').AsInteger := APrdCode;
      ResApply4_U.ExecSQL;
    except //on e:EFDDBEngineException do
      begin
         result := 4;
         raise;
      end;
    end;



    FDConnection1.Commit;
  except
    FDConnection1.Rollback;
  end;


  //CallBack
  Value := TJSONString.Create('dd');
  ServerContainer1.DSserver1.BroadCastMessage('MemoChannel', Value);

end;

// 사용자 예약취소
function TServerMethods1.ResCncl(APrdCode, ACnt: integer; AResDate, AKeyDate: TDateTime): Integer;
begin
  Result := 0;

  FDConnection1.StartTransaction;
  try
    try
      ResCncl1_D.Close; // 예약테이블 레코드 삭제
      ResCncl1_D.ParamByName('RES_DATE').AsDateTime := AResDate;
      ResCncl1_D.ExecSQL;
    except //on e:EFDDBEngineException do
      begin
         result := 1;
         raise;
      end;
    end;
    try
      ResCncl2_U.Close;
      ResCncl2_U.ParamByName('KEY_DATE').AsDateTime := AKeyDate;
      ResCncl2_U.ParamByName('PRD_CODE').AsInteger := APrdCode;
      ResCncl2_U.ParamByName('CNT').AsInteger := ACnt;
      ResCncl2_U.ExecSQL; // 예약대기열 예약수 감소
    except //on e:EFDDBEngineException do
      begin
         result := 2;
         raise;
      end;
    end;
    FDConnection1.Commit;
  except
    FDConnection1.Rollback;
  end;

end;

// 사용자 예약요청
function TServerMethods1.ResReq(AUsrCode, ABizCode, APrdCode,
  ACnt: integer; AKeyDate: TDateTime): Integer;
begin
  Result := 0;

  FDConnection1.StartTransaction;
  try
    try
      ResReq1_I.Close;
      ResReq1_I.ParamByName('USR_CODE').AsInteger := AUsrCode;
      ResReq1_I.ParamByName('BIZ_CODE').AsInteger := ABizCode;
      ResReq1_I.ParamByName('PRD_CODE').AsInteger := APrdCode;
      ResReq1_I.ParamByName('CNT').AsInteger := ACnt;
      ResReq1_I.ParamByName('KEY_DATE').AsDateTime := AKeyDate;
      ResReq1_I.ExecSQL; // 예약테이블 레코드 추가
    except on e:EFDDBEngineException do
      begin
         result := 1;
         raise;
      end;
    end;
    try
      ResReq2_U.Close;
//      ResReq2_U.ParamByName('BIZ_CODE').AsInteger := ABizCode;
      ResReq2_U.ParamByName('PRD_CODE').AsInteger := APrdCode;
      ResReq2_U.ParamByName('CNT').AsInteger := ACnt;
      ResReq2_U.ParamByName('KEY_DATE').AsDateTime := AKeyDate;  // 키 임시 추가
      ResReq2_U.ExecSQL; // 예약대기열 예약수 증가
    except on e:EFDDBEngineException do
      begin
         result := 2;
         raise;
      end;
    end;
    FDConnection1.Commit;
  except
    FDConnection1.Rollback;
  end;

end;

function TServerMethods1.SignUp(ABizNum, APw, AStoreNm, AAddr: string):boolean;
begin // 관리자 회원가입
  SignUpQuery.Close;
  SignUpQuery.ParamByName('BIZ_NUM').AsString := ABizNum;
  SignUpQuery.ParamByName('PW').AsString := APw;
  SignUpQuery.ParamByName('STORENM').AsString := AStoreNm;
  SignUpQuery.ParamByName('ADDR').AsString := AAddr;
  try
    SignUpQuery.ExecSQL;
    Result := True;
  except
    Result := False;
  end;
end;

function TServerMethods1.SignUpUser(AEmail, APw, APhone: string): boolean;
begin // 사용자 회원가입
  SignUpUserQuery.Close;
  SignUpUserQuery.ParamByName('EMAIL').AsString := AEmail;
  SignUpUserQuery.ParamByName('PW').AsString := APw;
  SignUpUserQuery.ParamByName('PHONE').AsString := APhone;
  try
    SignUpUserQuery.ExecSQL;
    Result := True;
  except
    Result := False;
  end;
end;

procedure TServerMethods1.UserCharge(ABizCode, AUsrCode, AVal,
  AValType: Integer);
begin
  if AValType = 1 then      // 1: 쿠폰
  begin
    UserJoinUpdate1.Close;
    UserJoinUpdate1.ParamByName('BIZ_CODE').AsInteger := ABizCode;
    UserJoinUpdate1.ParamByName('USR_CODE').AsInteger := AUsrCode;
    UserJoinUpdate1.ParamByName('CPNCNT').AsInteger := AVal;
    UserJoinUpdate1.ExecSQL;
  end
  else                      // 2: 충전
  begin
    UserJoinUpdate2.Close;
    UserJoinUpdate2.ParamByName('BIZ_CODE').AsInteger := ABizCode;
    UserJoinUpdate2.ParamByName('USR_CODE').AsInteger := AUsrCode;
    UserJoinUpdate2.ParamByName('CHARGE').AsInteger := AVal;
    UserJoinUpdate2.ExecSQL;
  end;
end;

function TServerMethods1.SignIn(ABizNum, APw: string): Integer;
var
  BizCode: Integer;
begin // 관리자 로그인
  SignInQuery.Close;
  SignInQuery.ParamByName('BIZ_NUM').AsString := ABizNum;
  SignInQuery.ParamByName('PW').AsString := APw;
  SignInQuery.Open;



  case SignInQuery.RecordCount of
    1: begin
      BizCode := SignInQuery.FieldByName('BIZ_CODE').AsInteger;
      Result := BizCode;
    end;
    0: Result := -999;
  else
    Result := -998;
  end;

end;

function TServerMethods1.SignInUser(AEmail, APW: string): Integer;
var
  UsrCode: Integer;
begin // 사용자 로그인
  SignInUserQuery.Close;
  SignInUserQuery.ParamByName('EMAIL').AsString := AEmail;
  SignInUserQuery.ParamByName('PW').AsString := APw;
  SignInUserQuery.Open;

  case SignInUserQuery.RecordCount of
    1: begin
      UsrCode := SignInUserQuery.FieldByName('USR_CODE').AsInteger;
      Result := UsrCode;
    end;
    0: Result := -999;
  else
    Result := -998;
  end;

end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

end.

