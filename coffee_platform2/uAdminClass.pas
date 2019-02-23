//
// Created by the DataSnap proxy generator.
// 2019-02-21 ¿ÀÈÄ 5:07:29
//

unit uAdminClass;

interface

uses System.JSON, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TServerMethods1Client = class(TDSAdminClient)
  private
    FNotiQueryNewRecordCommand: TDBXCommand;
    FEchoStringCommand: TDBXCommand;
    FReverseStringCommand: TDBXCommand;
    FUserChargeCommand: TDBXCommand;
    FSignUpCommand: TDBXCommand;
    FSignInCommand: TDBXCommand;
    FSignUpUserCommand: TDBXCommand;
    FSignInUserCommand: TDBXCommand;
    FInsResvWaitCommand: TDBXCommand;
    FResReqCommand: TDBXCommand;
    FResCnclCommand: TDBXCommand;
    FResApplyCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure NotiQueryNewRecord(DataSet: TDataSet);
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    procedure UserCharge(ABizCode: Integer; AUsrCode: Integer; AVal: Integer; AValType: Integer);
    function SignUp(ABizNum: string; APw: string; AStoreNm: string; AAddr: string): Boolean;
    function SignIn(ABizNum: string; APw: string): Integer;
    function SignUpUser(AEmail: string; APw: string; APhone: string): Boolean;
    function SignInUser(AEmail: string; APW: string): Integer;
    function InsResvWait(APrdCode: Integer; ABizCode: Integer; ASalesCnt: Integer): Boolean;
    function ResReq(AUsrCode: Integer; ABizCode: Integer; APrdCode: Integer; ACnt: Integer; AKeyDate: TDateTime): Integer;
    function ResCncl(APrdCode: Integer; ACnt: Integer; AResDate: TDateTime; AKeyDate: TDateTime): Integer;
    function ResApply(ACnt: Integer; ABizCode: Integer; APrdCode: Integer; ADateTime: TDateTime): Integer;
  end;

implementation

procedure TServerMethods1Client.NotiQueryNewRecord(DataSet: TDataSet);
begin
  if FNotiQueryNewRecordCommand = nil then
  begin
    FNotiQueryNewRecordCommand := FDBXConnection.CreateCommand;
    FNotiQueryNewRecordCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FNotiQueryNewRecordCommand.Text := 'TServerMethods1.NotiQueryNewRecord';
    FNotiQueryNewRecordCommand.Prepare;
  end;
  FNotiQueryNewRecordCommand.Parameters[0].Value.SetDBXReader(TDBXDataSetReader.Create(DataSet, FInstanceOwner), True);
  FNotiQueryNewRecordCommand.ExecuteUpdate;
end;

function TServerMethods1Client.EchoString(Value: string): string;
begin
  if FEchoStringCommand = nil then
  begin
    FEchoStringCommand := FDBXConnection.CreateCommand;
    FEchoStringCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FEchoStringCommand.Text := 'TServerMethods1.EchoString';
    FEchoStringCommand.Prepare;
  end;
  FEchoStringCommand.Parameters[0].Value.SetWideString(Value);
  FEchoStringCommand.ExecuteUpdate;
  Result := FEchoStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethods1Client.ReverseString(Value: string): string;
begin
  if FReverseStringCommand = nil then
  begin
    FReverseStringCommand := FDBXConnection.CreateCommand;
    FReverseStringCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FReverseStringCommand.Text := 'TServerMethods1.ReverseString';
    FReverseStringCommand.Prepare;
  end;
  FReverseStringCommand.Parameters[0].Value.SetWideString(Value);
  FReverseStringCommand.ExecuteUpdate;
  Result := FReverseStringCommand.Parameters[1].Value.GetWideString;
end;

procedure TServerMethods1Client.UserCharge(ABizCode: Integer; AUsrCode: Integer; AVal: Integer; AValType: Integer);
begin
  if FUserChargeCommand = nil then
  begin
    FUserChargeCommand := FDBXConnection.CreateCommand;
    FUserChargeCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FUserChargeCommand.Text := 'TServerMethods1.UserCharge';
    FUserChargeCommand.Prepare;
  end;
  FUserChargeCommand.Parameters[0].Value.SetInt32(ABizCode);
  FUserChargeCommand.Parameters[1].Value.SetInt32(AUsrCode);
  FUserChargeCommand.Parameters[2].Value.SetInt32(AVal);
  FUserChargeCommand.Parameters[3].Value.SetInt32(AValType);
  FUserChargeCommand.ExecuteUpdate;
end;

function TServerMethods1Client.SignUp(ABizNum: string; APw: string; AStoreNm: string; AAddr: string): Boolean;
begin
  if FSignUpCommand = nil then
  begin
    FSignUpCommand := FDBXConnection.CreateCommand;
    FSignUpCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FSignUpCommand.Text := 'TServerMethods1.SignUp';
    FSignUpCommand.Prepare;
  end;
  FSignUpCommand.Parameters[0].Value.SetWideString(ABizNum);
  FSignUpCommand.Parameters[1].Value.SetWideString(APw);
  FSignUpCommand.Parameters[2].Value.SetWideString(AStoreNm);
  FSignUpCommand.Parameters[3].Value.SetWideString(AAddr);
  FSignUpCommand.ExecuteUpdate;
  Result := FSignUpCommand.Parameters[4].Value.GetBoolean;
end;

function TServerMethods1Client.SignIn(ABizNum: string; APw: string): Integer;
begin
  if FSignInCommand = nil then
  begin
    FSignInCommand := FDBXConnection.CreateCommand;
    FSignInCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FSignInCommand.Text := 'TServerMethods1.SignIn';
    FSignInCommand.Prepare;
  end;
  FSignInCommand.Parameters[0].Value.SetWideString(ABizNum);
  FSignInCommand.Parameters[1].Value.SetWideString(APw);
  FSignInCommand.ExecuteUpdate;
  Result := FSignInCommand.Parameters[2].Value.GetInt32;
end;

function TServerMethods1Client.SignUpUser(AEmail: string; APw: string; APhone: string): Boolean;
begin
  if FSignUpUserCommand = nil then
  begin
    FSignUpUserCommand := FDBXConnection.CreateCommand;
    FSignUpUserCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FSignUpUserCommand.Text := 'TServerMethods1.SignUpUser';
    FSignUpUserCommand.Prepare;
  end;
  FSignUpUserCommand.Parameters[0].Value.SetWideString(AEmail);
  FSignUpUserCommand.Parameters[1].Value.SetWideString(APw);
  FSignUpUserCommand.Parameters[2].Value.SetWideString(APhone);
  FSignUpUserCommand.ExecuteUpdate;
  Result := FSignUpUserCommand.Parameters[3].Value.GetBoolean;
end;

function TServerMethods1Client.SignInUser(AEmail: string; APW: string): Integer;
begin
  if FSignInUserCommand = nil then
  begin
    FSignInUserCommand := FDBXConnection.CreateCommand;
    FSignInUserCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FSignInUserCommand.Text := 'TServerMethods1.SignInUser';
    FSignInUserCommand.Prepare;
  end;
  FSignInUserCommand.Parameters[0].Value.SetWideString(AEmail);
  FSignInUserCommand.Parameters[1].Value.SetWideString(APW);
  FSignInUserCommand.ExecuteUpdate;
  Result := FSignInUserCommand.Parameters[2].Value.GetInt32;
end;

function TServerMethods1Client.InsResvWait(APrdCode: Integer; ABizCode: Integer; ASalesCnt: Integer): Boolean;
begin
  if FInsResvWaitCommand = nil then
  begin
    FInsResvWaitCommand := FDBXConnection.CreateCommand;
    FInsResvWaitCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FInsResvWaitCommand.Text := 'TServerMethods1.InsResvWait';
    FInsResvWaitCommand.Prepare;
  end;
  FInsResvWaitCommand.Parameters[0].Value.SetInt32(APrdCode);
  FInsResvWaitCommand.Parameters[1].Value.SetInt32(ABizCode);
  FInsResvWaitCommand.Parameters[2].Value.SetInt32(ASalesCnt);
  FInsResvWaitCommand.ExecuteUpdate;
  Result := FInsResvWaitCommand.Parameters[3].Value.GetBoolean;
end;

function TServerMethods1Client.ResReq(AUsrCode: Integer; ABizCode: Integer; APrdCode: Integer; ACnt: Integer; AKeyDate: TDateTime): Integer;
begin
  if FResReqCommand = nil then
  begin
    FResReqCommand := FDBXConnection.CreateCommand;
    FResReqCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FResReqCommand.Text := 'TServerMethods1.ResReq';
    FResReqCommand.Prepare;
  end;
  FResReqCommand.Parameters[0].Value.SetInt32(AUsrCode);
  FResReqCommand.Parameters[1].Value.SetInt32(ABizCode);
  FResReqCommand.Parameters[2].Value.SetInt32(APrdCode);
  FResReqCommand.Parameters[3].Value.SetInt32(ACnt);
  FResReqCommand.Parameters[4].Value.AsDateTime := AKeyDate;
  FResReqCommand.ExecuteUpdate;
  Result := FResReqCommand.Parameters[5].Value.GetInt32;
end;

function TServerMethods1Client.ResCncl(APrdCode: Integer; ACnt: Integer; AResDate: TDateTime; AKeyDate: TDateTime): Integer;
begin
  if FResCnclCommand = nil then
  begin
    FResCnclCommand := FDBXConnection.CreateCommand;
    FResCnclCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FResCnclCommand.Text := 'TServerMethods1.ResCncl';
    FResCnclCommand.Prepare;
  end;
  FResCnclCommand.Parameters[0].Value.SetInt32(APrdCode);
  FResCnclCommand.Parameters[1].Value.SetInt32(ACnt);
  FResCnclCommand.Parameters[2].Value.AsDateTime := AResDate;
  FResCnclCommand.Parameters[3].Value.AsDateTime := AKeyDate;
  FResCnclCommand.ExecuteUpdate;
  Result := FResCnclCommand.Parameters[4].Value.GetInt32;
end;

function TServerMethods1Client.ResApply(ACnt: Integer; ABizCode: Integer; APrdCode: Integer; ADateTime: TDateTime): Integer;
begin
  if FResApplyCommand = nil then
  begin
    FResApplyCommand := FDBXConnection.CreateCommand;
    FResApplyCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FResApplyCommand.Text := 'TServerMethods1.ResApply';
    FResApplyCommand.Prepare;
  end;
  FResApplyCommand.Parameters[0].Value.SetInt32(ACnt);
  FResApplyCommand.Parameters[1].Value.SetInt32(ABizCode);
  FResApplyCommand.Parameters[2].Value.SetInt32(APrdCode);
  FResApplyCommand.Parameters[3].Value.AsDateTime := ADateTime;
  FResApplyCommand.ExecuteUpdate;
  Result := FResApplyCommand.Parameters[4].Value.GetInt32;
end;

constructor TServerMethods1Client.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;

constructor TServerMethods1Client.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;

destructor TServerMethods1Client.Destroy;
begin
  FNotiQueryNewRecordCommand.DisposeOf;
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  FUserChargeCommand.DisposeOf;
  FSignUpCommand.DisposeOf;
  FSignInCommand.DisposeOf;
  FSignUpUserCommand.DisposeOf;
  FSignInUserCommand.DisposeOf;
  FInsResvWaitCommand.DisposeOf;
  FResReqCommand.DisposeOf;
  FResCnclCommand.DisposeOf;
  FResApplyCommand.DisposeOf;
  inherited;
end;

end.

