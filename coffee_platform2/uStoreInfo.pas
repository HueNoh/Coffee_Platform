unit uStoreInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.DBCtrls, Data.DB, Vcl.DBGrids, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, Data.Bind.EngExt, Vcl.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope, Vcl.Imaging.pngimage, Vcl.Grids;

type
  TFrmStoreInfo = class(TForm)
    Panel1: TPanel;
    dlgLoadImage: TOpenDialog;
    GroupBox1: TGroupBox;
    Img_Sig: TImage;
    Img_1: TImage;
    Img_2: TImage;
    Img_4: TImage;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
    Img_3: TImage;
    LinkControlToField4: TLinkControlToField;
    Panel2: TPanel;
    BtnSave: TSpeedButton;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    Label1: TLabel;
    BizSource: TDataSource;
    LinkControlToField1: TLinkControlToField;
    procedure Img_SigClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure BizSourceDataChange(Sender: TObject; Field: TField);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmStoreInfo: TFrmStoreInfo;

implementation

{$R *.dfm}

uses dmAdmin, CommonFunctions;

procedure TFrmStoreInfo.BizSourceDataChange(Sender: TObject; Field: TField);
begin
  if Dm.BizQuery.State = dsBrowse then
  begin
    BtnSave.Enabled := false;
//    BtnEdit.Enabled := True;
  end
  else
  begin
    BtnSave.Enabled := True;
//    BtnEdit.Enabled := False;
    Dm.BizQuery.Edit;
  end;
end;

procedure TFrmStoreInfo.BtnSaveClick(Sender: TObject);
begin
  if BizSource.State = dsEdit then
  begin
    Dm.BizQuery.Post;
    Dm.BizQuery.ApplyUpdates(-1);
    Dm.BizQuery.Refresh;
    ShowMessage('저장되었습니다.');
  end;
end;

procedure TFrmStoreInfo.Img_SigClick(Sender: TObject);
var
  Field: TField;
begin
  if dlgLoadImage.Execute then
  begin
//    LoadImageFromFile(ImgSig, dlgLoadImage.FileName);
//
//    Field := Dm.BizQuery.FieldByName('IMG_SIG');
//    SaveImageToBlobField(ImgSig, Field as TBlobField);
    LoadImageFromFile((Sender as TImage), dlgLoadImage.FileName);

    Field := Dm.BizQuery.FieldByName((Sender as TImage).Name);
    SaveImageToBlobField((Sender as TImage), Field as TBlobField);
  end;
end;
end.


