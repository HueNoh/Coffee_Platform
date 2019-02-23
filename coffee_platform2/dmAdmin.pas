unit dmAdmin;

interface

uses
  System.SysUtils, System.Classes, Data.DBXDataSnap, Data.DBXCommon,
  IPPeerClient, Data.DB, Data.SqlExpr, Datasnap.DBClient, Datasnap.DSConnect,
  uAdminClass;

type
  TdmAdminAccess = class(TDataModule)
    SQLConnection1: TSQLConnection;
    DSProviderConnection1: TDSProviderConnection;
    ProdQuery: TClientDataSet;
    BizQuery: TClientDataSet;
    ProdQueryPRD_CODE: TIntegerField;
    ProdQueryBIZ_CODE: TIntegerField;
    ProdQueryTITLE: TWideStringField;
    ProdQueryCONTENT: TWideStringField;
    ProdQueryIMG: TBlobField;
    ProdQueryPRICE: TIntegerField;
    ProdQuerySTOCK: TIntegerField;
    ProdQuerySource: TDataSource;
    NotiQuerySource: TDataSource;
    ResvWaitQuerySource: TDataSource;
    BizQuerySource: TDataSource;
    BizQueryBIZ_CODE: TIntegerField;
    BizQuerySTORENM: TWideStringField;
    BizQueryADDR: TWideStringField;
    BizQueryTEL: TWideStringField;
    BizQueryREG_DATE: TSQLTimeStampField;
    BizQueryINTRO: TWideStringField;
    BizQueryAMENITY: TWideStringField;
    BizQueryIMG_SIG: TBlobField;
    BizQueryCONTENT: TWideStringField;
    BizQueryIMG_1: TBlobField;
    BizQueryIMG_2: TBlobField;
    BizQueryIMG_3: TBlobField;
    BizQueryIMG_4: TBlobField;
    BizQueryCPNSET: TIntegerField;
    ResvWaitQuery: TClientDataSet;
    ResvWaitQueryST_DATE: TSQLTimeStampField;
    ResvWaitQueryPRD_CODE: TIntegerField;
    ResvWaitQueryBIZ_CODE: TIntegerField;
    ResvWaitQuerySALESCNT: TIntegerField;
    ResvWaitQueryCNT: TIntegerField;
    ResvWaitQueryED_DATE: TSQLTimeStampField;
    ResvWaitQueryPRD_NAME: TStringField;
    ResvWaitQueryBIZ_NAME: TStringField;
    NotiQuery: TClientDataSet;
    ResvWaitQuerySTATUS: TStringField;
    UserJoin: TClientDataSet;
    UserJoinUSR_CODE: TIntegerField;
    UserJoinEMAIL: TWideStringField;
    UserJoinPHONE: TWideStringField;
    UserJoinBIZ_CODE: TIntegerField;
    UserJoinCHARGE: TIntegerField;
    UserJoinCPNCNT: TIntegerField;
    ResvWaitQueryRESCNT: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure ResvWaitQueryNewRecord(DataSet: TDataSet);
    procedure ResvWaitQueryCalcFields(DataSet: TDataSet);
  private
    FPrdCode: Integer;
    FBizCode: Integer;
    FClient: TServerMethods1Client;
    function GetClient: TServerMethods1Client;
    { Private declarations }
  public
    { Public declarations }
    property BizCode: Integer read FBizCode write FBizCode;
    property PrdCode: Integer read FPrdCode write FPrdCode;
    property Client: TServerMethods1Client read GetClient;
  end;

var
  Dm: TdmAdminAccess;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  Winapi.Windows;

procedure TdmAdminAccess.DataModuleCreate(Sender: TObject);
begin
//  Client := TServerMethods1Client.Create(SQLConnection1.DBXConnection);
  if not SqlConnection1.Connected then
    SqlConnection1.Connected := True;


end;

procedure TdmAdminAccess.DataModuleDestroy(Sender: TObject);
begin
//  OutputDebugString(PChar(''));   // debug
end;

function TdmAdminAccess.GetClient: TServerMethods1Client;
begin
  if not Assigned(FClient) then
    FClient := TServerMethods1Client.Create(SQLConnection1.DBXConnection);
  Result := FClient;
end;

procedure TdmAdminAccess.ResvWaitQueryCalcFields(DataSet: TDataSet);
begin
  Dm.ResvWaitQuery.FieldByName('RESCNT').AsInteger :=
    Dm.ResvWaitQuery.FieldByName('SALESCNT').AsInteger
    - Dm.ResvWaitQuery.FieldByName('CNT').AsInteger;

end;

procedure TdmAdminAccess.ResvWaitQueryNewRecord(DataSet: TDataSet);
begin
//  ResvWaitQueryST_dATE.Value := '날자입력'

end;

end.
