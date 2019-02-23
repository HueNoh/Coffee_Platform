unit dmClient;

interface

uses
  System.SysUtils, System.Classes, uClientClass, Data.DBXDataSnap,
  Data.DBXCommon, IPPeerClient, Data.DB, Datasnap.DBClient, Datasnap.DSConnect,
  Data.SqlExpr, Datasnap.DSCommon;

type
  TdmClientAccess = class(TDataModule)
    DSProviderConnection1: TDSProviderConnection;
    BizQuery: TClientDataSet;
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
    ResvWaitQuerySTATUS: TStringField;
    ResvWaitQueryED_DATE: TSQLTimeStampField;
    ClientDataSet1: TClientDataSet;
    ClientDataSet2: TClientDataSet;
    UserJoin: TClientDataSet;
    NotiQuery: TClientDataSet;
    ProdQuery: TClientDataSet;
    ResvWaitQueryPRD_NM: TStringField;
    ResvWaitQueryBIZ_NM: TStringField;
    ProdQueryPRD_CODE: TIntegerField;
    ProdQueryBIZ_CODE: TIntegerField;
    ProdQueryTITLE: TWideStringField;
    ProdQueryCONTENT: TWideStringField;
    ProdQueryIMG: TBlobField;
    ProdQueryPRICE: TIntegerField;
    ProdQuerySTOCK: TIntegerField;
    ResvWaitQueryPRD_CONTENT: TStringField;
    ResvWaitQueryPRD_IMG: TStringField;
    ResvWaitJoin: TClientDataSet;
    ResvWaitJoinST_DATE: TSQLTimeStampField;
    ResvWaitJoinPRD_CODE: TIntegerField;
    ResvWaitJoinBIZ_CODE: TIntegerField;
    ResvWaitJoinSALESCNT: TIntegerField;
    ResvWaitJoinCNT: TIntegerField;
    ResvWaitJoinSTATUS: TStringField;
    ResvWaitJoinED_DATE: TSQLTimeStampField;
    ResvWaitJoinTITLE: TWideStringField;
    ResvWaitJoinCONTENT: TWideStringField;
    ResvWaitJoinIMG: TBlobField;
    ResvWaitJoinPRICE: TIntegerField;
    ResvWaitJoinSTOCK: TIntegerField;
    ResvJoin: TClientDataSet;
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
    ChannelManager1: TDSClientCallbackChannelManager;
    SQLConnection1: TSQLConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    FPrdCode: Integer;
    FBizCode: Integer;
    FUsrCode: Integer;
    FClient: TServerMethods1Client;
    function GetClient: TServerMethods1Client;
//    callbackid:string;
  public
    { Public declarations }
    property BizCode: Integer read FBizCode write FBizCode;
    property PrdCode: Integer read FPrdCode write FPrdCode;
    property UsrCode: Integer read FUsrCode write FUsrCode;
    property Client: TServerMethods1Client read GetClient;
  end;

var
  Dm: TdmClientAccess;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

procedure TdmClientAccess.DataModuleCreate(Sender: TObject);
begin
  if not SqlConnection1.Connected then
    SqlConnection1.Connected := True;
//  ChannelManager1.RegisterCallback(CallBackId, Tmemocallback.create);
end;

function TdmClientAccess.GetClient: TServerMethods1Client;
begin
  if not Assigned(FClient) then
    FClient := TServerMethods1Client.Create(SQLConnection1.DBXConnection);
  Result := FClient;
end;

end.


