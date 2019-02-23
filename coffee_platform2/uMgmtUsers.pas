unit uMgmtUsers;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, dmAdmin, Vcl.StdCtrls, Vcl.Samples.Spin;

type
  TFrmMgmtUsers = class(TForm)
    Panel1: TPanel;
    UserJoinSource: TDataSource;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    BtnCpn: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    SpinEditCpn: TSpinEdit;
    EditChg: TEdit;
    BtnChg: TButton;
    procedure Edit1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpinEditCpnChange(Sender: TObject);
    procedure EditChgChange(Sender: TObject);
    procedure BtnCpnClick(Sender: TObject);
    procedure BtnChgClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMgmtUsers: TFrmMgmtUsers;

implementation

{$R *.dfm}

procedure TFrmMgmtUsers.BtnChgClick(Sender: TObject);
var
  UsrCode, BizCode, Charge: Integer;

begin
  if EditChg.Text <> '' then
  begin
    Charge := StrToInt(EditChg.Text);
    UsrCode := Dm.UserJoin.FieldByName('USR_CODE').AsInteger;
    BizCode := Dm.UserJoin.FieldByName('BIZ_CODE').AsInteger;
    Dm.Client.UserCharge(BizCode, UsrCode, Charge, 2);
    ShowMessage(Charge.ToString + '원 충전되었습니다.');
  end;
  EditChg.Clear;
  Dm.UserJoin.refresh;
end;

procedure TFrmMgmtUsers.BtnCpnClick(Sender: TObject);
var
  UsrCode, BizCode, Cpn: Integer;
begin
  if SpinEditCpn.Value <> 0 then
  begin
    Cpn := SpinEditCpn.Value;
    UsrCode := Dm.UserJoin.FieldByName('USR_CODE').AsInteger;
    BizCode := Dm.UserJoin.FieldByName('BIZ_CODE').AsInteger;
    Dm.Client.UserCharge(BizCode, UsrCode, Cpn, 1);
    ShowMessage('쿠폰 적용 완료');
  end;
  EditChg.Clear;
  Dm.UserJoin.refresh;
end;

procedure TFrmMgmtUsers.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Filter: string;
begin
  Filter := '';
  if Edit1.Text <> '' then
  begin
    if Checkbox1.Checked then
      Filter := Format('Email like ''%%%s%%''', [Edit1.Text]);
    if Checkbox2.Checked then
    begin
      if Filter <> '' then
        Filter := Filter + ' or ';
      Filter := Format('Phone like ''%%%s%%''', [Edit1.Text]);
    end;
  end;

  Dm.UserJoin.Filter := Filter;
  Dm.UserJoin.Filtered := (Filter <> '');

  if Key in [vk_down, vk_return] then
    DBGrid1.SetFocus;
end;

procedure TFrmMgmtUsers.EditChgChange(Sender: TObject);
begin
  if EditChg.Text <> '' then
    BtnChg.Enabled := True
  else
    BtnChg.Enabled := False;
end;

procedure TFrmMgmtUsers.SpinEditCpnChange(Sender: TObject);
begin
    BtnCpn.Enabled := True;
end;

end.
