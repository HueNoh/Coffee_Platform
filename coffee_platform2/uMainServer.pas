unit uMainServer;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls,
  System.json; {CallBack ������ ����}

type
  TForm1 = class(TForm)
    procedure testcall(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses ServerContainerUnit1;

{ TForm1 }

procedure TForm1.testcall(Sender: TObject);
var
  value:TJSONString;
begin
  value := TJSONString.Create('���� ������ �����Ǿ����ϴ�.');
  ServerContainer1.DSserver1.BroadCastMessage('MemoChannel', value);
end;

end.

