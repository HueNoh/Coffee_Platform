unit uAdminSelProd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask;

type
  TFrmSelProd = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    Image1: TImage;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    DBMemo1: TDBMemo;
    DBEdit1: TDBEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    FSelPrdCode: integer;
  public
    { Public declarations }
    property SelPrdCode: Integer read FSelPrdCode;
  end;

var
  FrmSelProd: TFrmSelProd;

implementation

{$R *.dfm}

uses dmAdmin;

procedure TFrmSelProd.Button1Click(Sender: TObject);
begin
//  FrmSelProd.ModalResult := mrOk;
  FSelPrdCode := Dm.ProdQuery.FieldByName('PRD_CODE').AsInteger;
end;

end.
