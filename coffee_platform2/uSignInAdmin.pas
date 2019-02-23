unit uSignInAdmin;

interface

uses
  dmAdmin, uAdminClass,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Mask,
  Vcl.ExtCtrls;

type
  TFrmSignAdmin = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    BtnSignIn: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BtnBack: TButton;
    BtnSignUp: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    LabelToSignUp: TLabel;
    procedure BtnSignInClick(Sender: TObject);
    procedure BtnBackClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnSignUpClick(Sender: TObject);
    procedure LabelToSignUpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function Execute: boolean;

  end;

var
  FrmSignAdmin: TFrmSignAdmin;

implementation

{$R *.dfm}


procedure TFrmSignAdmin.BtnBackClick(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet1;
end;

procedure TFrmSignAdmin.BtnSignInClick(Sender: TObject);
var
  ABizNum, APw: string;
  Chk: Integer;
begin
//  ModalResult := mrOK;
  ABizNum := Edit1.Text;
  APw := Edit2.Text;
//  Edit2.im
//  ABizNum := '111';
//  APw := '111';
  Chk := Dm.Client.SignIn(ABizNum, APw);
  case Chk of
    -999: begin
//      ModalResult := mrRetry;
      ShowMessage('로그인 실패1');
      Exit;
    end;
    -998: begin
      //ModalResult := mrAbort
      ShowMessage('로그인 실패2');
      Exit;
    end;
  else
    begin
      Dm.BizCode :=  Chk;      // 공유속성에 코드 저장
      ShowMessage('로그인 성공');
      ModalResult := mrOK;

    end;
  end;

end;

procedure TFrmSignAdmin.BtnSignUpClick(Sender: TObject);
var
  Chk: boolean;
  ABizNum, APw, AStoreNm, AAddr: string;
begin
  ABizNum := Edit3.Text;
  APw := Edit4.Text;
  AStoreNm := Edit5.Text;
  AAddr := Edit6.Text;
  if (Edit3.Text = '') or (Edit4.Text = '') or
    (Edit5.Text = '') or (Edit6.Text = '') then
  begin
    ShowMessage('모든 항목을 입력해 주세요.');
    Exit;
  end;

  Chk := Dm.Client.SignUp(ABizNum, APw, AStoreNm, AAddr);
  case Chk of
    True: ShowMessage('등록 완료');
    False: ShowMessage('등록 실패');
  end;
end;

class function TFrmSignAdmin.Execute: boolean;

begin
  Result := False;
  FrmSignAdmin := TFrmSignAdmin.Create(Application);
  try
    Result := FrmSignAdmin.ShowModal = mrOK;

  finally
//     FrmSignAdmin.Free;   // ?? 왜 프리 안해야 동작?
//     FrmSignAdmin := nil;
//    FreeAndNil(FrmSignAdmin);
    if not Result then
      FreeAndNil(Dm);
  end;
end;

procedure TFrmSignAdmin.FormCreate(Sender: TObject);
var
  page: integer;
begin
  PageControl1.ActivePage := TabSheet1;
  // 탭 숨김
  for page := 0 to PageControl1.PageCount - 1 do
  begin
    PageControl1.Pages[page].TabVisible := false;
  end;
  PageControl1.ActivePageIndex := 0;
end;

procedure TFrmSignAdmin.LabelToSignUpClick(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet2;
end;

end.
