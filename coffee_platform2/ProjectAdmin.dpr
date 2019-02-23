program ProjectAdmin;

uses
  Vcl.Forms,
  uMainAdmin in 'uMainAdmin.pas' {FrmMainAdmin},
  uSignInAdmin in 'uSignInAdmin.pas' {FrmSignAdmin},
  dmAdmin in 'dmAdmin.pas' {dmAdminAccess: TDataModule},
  uAdminClass in 'uAdminClass.pas',
  uStoreInfo in 'uStoreInfo.pas' {FrmStoreInfo},
  uRegResv in 'uRegResv.pas' {FrmRegResv},
  uRegNotify in 'uRegNotify.pas' {FrmRegNotify},
  uMgmtUsers in 'uMgmtUsers.pas' {FrmMgmtUsers},
  CommonFunctions in 'CommonFunctions.pas',
  Vcl.Themes,
  Vcl.Styles,
  Ucheckgrid in 'Ucheckgrid.pas';

{$R *.res}


begin
  Application.Initialize;
  Application.CreateForm(TdmAdminAccess, Dm);
  if TFrmSignAdmin.Execute then
  begin
    Application.MainFormOnTaskbar := True;
    Application.CreateForm(TFrmMainAdmin, FrmMainAdmin);
    Application.Run;
  end
  else
  begin
    Application.MessageBox('프로그램 시작을 위해서 인증이 필요합니다. ', '알림') ;
  end;
end.
