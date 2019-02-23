unit uRegNotify;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Ucheckgrid, Vcl.StdCtrls;

type
  TFrmRegNotify = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BtnNoti: TButton;
    DBGrid1: TDBGrid;
    BtnDelNoti: TButton;
    EditNoti: TEdit;
    NotiSource: TDataSource;
    procedure BtnNotiClick(Sender: TObject);
    procedure BtnDelNotiClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRegNotify: TFrmRegNotify;

implementation

{$R *.dfm}

uses dmAdmin;

procedure TFrmRegNotify.BtnDelNotiClick(Sender: TObject);
begin
  Dm.NotiQuery.Delete;
  dbgrid1.SelectedRows.Clear;
end;

procedure TFrmRegNotify.BtnNotiClick(Sender: TObject);
var
  Today: TDateTime;
begin
  Today := Now;
  Dm.NotiQuery.Insert;
  Dm.NotiQuery.FieldByName('CONTENT').AsString := EditNoti.Text;
  Dm.NotiQuery.FieldByName('BIZ_CODE').AsInteger := Dm.BizCode;
  Dm.NotiQuery.FieldByName('REG_DATE').AsDateTime := Today;
  Dm.NotiQuery.Post;
  Dm.NotiQuery.ApplyUpdates(-1);

  EditNoti.Clear;


end;

end.
