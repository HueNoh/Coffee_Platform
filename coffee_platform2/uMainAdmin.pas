unit uMainAdmin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.RibbonLunaStyleActnCtrls,
  Vcl.Ribbon, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.ToolWin, Vcl.ActnMan,
  Vcl.ActnCtrls, Vcl.PlatformDefaultStyleActnCtrls, System.Actions, Vcl.ActnList,
  Vcl.StdCtrls, System.ImageList, Vcl.ImgList, Vcl.Menus, Vcl.Buttons,
  Vcl.CategoryButtons, Vcl.WinXCtrls;

type
  TFrmMainAdmin = class(TForm)
    pnlLayout: TPanel;
    ActionList1: TActionList;
    Intro: TAction;
    Reserve: TAction;
    SplitView2: TSplitView;
    catMenuItems: TCategoryButtons;
    Notify: TAction;
    Users: TAction;
    imlIcons: TImageList;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N3: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    StyleMenu: TMenuItem;
    procedure IntroExecute(Sender: TObject);
    procedure ReserveExecute(Sender: TObject);
    procedure NotifyExecute(Sender: TObject);
    procedure UsersExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure StyleClick(Sender: TObject);
  public
    { Public declarations }
  end;

var
  FrmMainAdmin: TFrmMainAdmin;

implementation

{$R *.dfm}

uses dmAdmin, uAdminClass, uAdminSelProd, uStoreInfo, uRegResv, uRegNotify,
  uMgmtUsers, Vcl.Themes, Vcl.Styles{style};

procedure TFrmMainAdmin.FormCreate(Sender: TObject);
var
  Style: string;
  Item: TMenuItem;
begin
  IntroExecute(FrmStoreInfo);   // 초기화면
  for Style in TStyleManager.StyleNames do   //스타일 적용
  begin
    Item := TMenuItem.Create(StyleMenu);
    Item.Caption := Style;
    Item.OnClick := StyleClick;
    if TStyleManager.ActiveStyle.Name = Style then
      Item.Checked := True;
    StyleMenu.Add(Item);
  end;
end;

procedure TFrmMainAdmin.IntroExecute(Sender: TObject);
begin
  if not Assigned(FrmStoreInfo) then
    FrmStoreInfo := TFrmStoreInfo.Create(Self);
  FrmStoreInfo.Parent := pnlLayout;
  FrmStoreInfo.BorderStyle := bsNone;
  FrmStoreInfo.Align := alClient;
  FrmStoreInfo.Show;
end;

procedure TFrmMainAdmin.ReserveExecute(Sender: TObject);
begin
  if not Assigned(FrmRegResv) then
    FrmRegResv := TFrmRegResv.Create(Self);
  FrmRegResv.Parent := pnlLayout;
  FrmRegResv.BorderStyle := bsNone;
  FrmRegResv.Align := alClient;
  FrmRegResv.Show;
end;

procedure TFrmMainAdmin.StyleClick(Sender: TObject);
var
  StyleName: string;
  i: Integer;
begin
  StyleName := StringReplace(TMenuItem(Sender).Caption, '&', '',
    [rfReplaceAll, rfIgnoreCase]);
  TStyleManager.SetStyle(StyleName);
  (Sender as TMenuItem).Checked := True;

  for I := 0 to StyleMenu.Count -1 do
  begin
    if not StyleMenu.Items[i].Equals(Sender) then
      StyleMenu.Items[i].Checked := False;
  end;

end;

procedure TFrmMainAdmin.NotifyExecute(Sender: TObject);
begin
  if not Assigned(FrmRegNotify) then
    FrmRegNotify := TFrmRegNotify.Create(Self);
  FrmRegNotify.Parent := pnlLayout;
  FrmRegNotify.BorderStyle := bsNone;
  FrmRegNotify.Align := alClient;
  FrmRegNotify.Show;
end;

procedure TFrmMainAdmin.UsersExecute(Sender: TObject);
begin
  if not Assigned(FrmMgmtUsers) then
    FrmMgmtUsers := TFrmMgmtUsers.Create(Self);
  FrmMgmtUsers.Parent := pnlLayout;
  FrmMgmtUsers.BorderStyle := bsNone;
  FrmMgmtUsers.Align := alClient;
  FrmMgmtUsers.Show;
end;

end.


