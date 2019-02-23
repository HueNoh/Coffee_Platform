program ProjectClient;

uses
  System.StartUpCopy,
  FMX.Forms,
  uMainClient in 'uMainClient.pas' {FrmMainClient},
  dmClient in 'dmClient.pas' {dmClientAccess: TDataModule},
  uClientClass in 'uClientClass.pas',
  Unit2 in 'Unit2.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmClientAccess, Dm);
  Application.CreateForm(TFrmMainClient, FrmMainClient);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
