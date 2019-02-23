unit uMainClient;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, FMX.Layouts, FMX.TabControl, FMX.Controls.Presentation,
  FMX.MultiView, Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components,
  Data.Bind.DBScope, FMX.ListBox, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView,
  System.Actions, FMX.ActnList, Data.DB, FMX.Edit, FMX.ComboEdit, FMX.EditBox,
  FMX.SpinBox,
  dbxjson,system.json, System.ImageList, FMX.ImgList; //callbackjson

  type
  TMemoCallBack = class(TDBXCallback)
    function execute(const arg:tjsonvalue):tjsonvalue; override;
  end;    //callback

  TFrmMainClient = class(TForm)
    SignTabControl: TTabControl;
    TabItem_SignIn: TTabItem;
    TabItem_SignUp: TTabItem;
    TabItem_Main: TTabItem;
    Layout5: TLayout;
    EditSignEmail: TEdit;
    EditSignPw: TEdit;
    BtnSignIn: TButton;
    Layout7: TLayout;
    Layout8: TLayout;
    EditEmail: TEdit;
    EditPw: TEdit;
    BtnSignUp: TButton;
    BtnSignBack: TButton;
    EditCPw: TEdit;
    EditPhone: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    PwWarn: TLabel;
    TextCall: TText;
    TextToSignUp: TText;
    Panel1: TPanel;
    Layout4: TLayout;
    Panel4: TPanel;
    Layout6: TLayout;
    MainTabControl: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    TabItem4: TTabItem;
    ToolBar2: TToolBar;
    VertScrollBox1: TVertScrollBox;
    Lbl2: TLabel;
    StyleBook1: TStyleBook;
    Panel2: TPanel;
    Img_Sig: TImage;
    GridPanelLayout1: TGridPanelLayout;
    TextIntro: TText;
    Img_1: TImage;
    Img_2: TImage;
    Img_3: TImage;
    Img_4: TImage;
    BindSource1_Biz: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkPropertyToFieldText: TLinkPropertyToField;
    LinkPropertyToFieldBitmap: TLinkPropertyToField;
    LinkPropertyToFieldBitmap2: TLinkPropertyToField;
    LinkPropertyToFieldBitmap3: TLinkPropertyToField;
    LinkPropertyToFieldBitmap4: TLinkPropertyToField;
    LinkPropertyToFieldBitmap5: TLinkPropertyToField;
    ListView1: TListView;
    BindSource2_Noti: TBindSourceDB;
    LinkListControlToField1: TLinkListControlToField;
    ListView2: TListView;
    ResvTabControl: TTabControl;
    TabItem3_1: TTabItem;
    TabItem3_2: TTabItem;
    Panel3: TPanel;
    ToolBar4: TToolBar;
    ToolBar5: TToolBar;
    BtnBack3_2: TSpeedButton;
    BindSourceDB1: TBindSourceDB;
    ActionList1: TActionList;
    BindSourceDB2: TBindSourceDB;
    LinkListControlToField2: TLinkListControlToField;
    Panel5: TPanel;
    ChangeTabAction3_1: TChangeTabAction;
    ChangeTabAction3_2: TChangeTabAction;
    ChangeTabAction4_1: TChangeTabAction;
    ChangeTabAction4_2: TChangeTabAction;
    ToolBar1: TToolBar;
    VertScrollBox2: TVertScrollBox;
    Panel6: TPanel;
    ListBox1: TListBox;
    Text1: TText;
    Text2: TText;
    Lbl3: TLabel;
    Lbl4: TLabel;
    Layout10: TLayout;
    Image1: TImage;
    Panel7: TPanel;
    BtnResv: TButton;
    SpinBox1: TSpinBox;
    Text3: TText;
    Text4: TText;
    Text8: TText;
    Text9: TText;
    LinkPropertyToFieldBitmap6: TLinkPropertyToField;
    LinkPropertyToFieldText2: TLinkPropertyToField;
    LinkPropertyToFieldText3: TLinkPropertyToField;
    BindSourceDB3: TBindSourceDB;
    TextCpn: TText;
    TextCharge: TText;

    procedure FormCreate(Sender: TObject);            //폼 생성
    procedure SignTabControlChange(Sender: TObject);  //로그인/회원가입 TabControl 전환
    procedure BtnSignUpClick(Sender: TObject);        //회원가입
    procedure EditCPwKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);                            //회원가입 비밀번호 유효성
    procedure TextToSignUpClick(Sender: TObject);     //회원가입 이동
    procedure BtnSignBackClick(Sender: TObject);      //회원가입 뒤로가기
    procedure BtnSignInClick(Sender: TObject);        //로그인
    procedure MainTabControlChange(Sender: TObject);  //주 메뉴 탭 전환
    procedure ListView2ItemClick(const Sender: TObject;
      const AItem: TListViewItem);                    //예약아이템 클릭
    procedure BtnResvClick(Sender: TObject);          //예약
    procedure BtnBack3_2Click(Sender: TObject);       //예약 뒤로가기
    procedure DoBtnResvCnclClick(Sender: TObject);    //내정보 예약취소
    procedure ListBoxItemRefresh();                   //내정보 예약목록
    procedure MyCallBack(); //CallBack 동작
  private
    callbackid:string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMainClient: TFrmMainClient;

implementation


{$R *.fmx}
{$R *.NmXhdpiPh.fmx ANDROID}

uses dmClient, uClientClass;
// ListBoxItem 위치 관련
function FindItemParent(Obj: TFmxObject; ParentClass: TClass): TFmxObject;
begin
  Result := nil;
  if Assigned(Obj.Parent) then
    if Obj.Parent.ClassType = ParentClass then
      Result := Obj.Parent
    else
      Result := FindItemParent(Obj.Parent, ParentClass);
end;

procedure TFrmMainClient.BtnBack3_2Click(Sender: TObject);
begin
  ChangeTabAction3_1.ExecuteTarget(self);
end;

procedure TFrmMainClient.ListBoxItemRefresh;
var
  Item: TListBoxItem;
  I: Integer;
begin
//  ListBox1.Clear;
  ListBox1.BeginUpdate;
  Dm.ResvJoin.First;
  for I := 0 to Dm.ResvJoin.RecordCount-1 do
  begin
    Item := TListBoxItem.Create(ListBox1);
    Item.Parent := ListBox1;
    Item.Height := 80;
    Item.StyleLookup := 'CustomItem';
    Item.StylesData['regdate'] := DateTimeToStr(Dm.ResvJoin.FieldByName('RES_DATE').AsDateTime);
    Item.StylesData['prdname'] := Dm.ResvJoin.FieldByName('TITLE').AsString;
    Item.StylesData['TextCnt'] := '예약수량: ';
    Item.StylesData['Cnt'] := IntToStr(Dm.ResvJoin.FieldByName('CNT').AsInteger);
    Item.StylesData['BtnResvCncl.OnClick'] := TValue.From<TNotifyEvent>(DoBtnResvCnclClick);
    Dm.ResvJoin.Next;
  end;
  ListBox1.EndUpdate;
end;

procedure TFrmMainClient.ListView2ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  ChangeTabAction3_2.ExecuteTarget(self);
end;

procedure TFrmMainClient.BtnResvClick(Sender: TObject);
var
  PrdCode, Chk, Cnt: Integer;
  KeyDate: tdatetime;
begin
  KeyDate := dm.ResvWaitJoin.FieldByName('ST_DATE').AsDateTime;
  PrdCode := Dm.ResvWaitJoin.FieldByName('PRD_CODE').AsInteger;

  Cnt := Spinbox1.Text.ToInteger;
  Chk := Dm.Client.ResReq(Dm.UsrCode, 2, PrdCode, Cnt, KeyDate);
  case Chk of
    0: begin
      ShowMessage('예약 완료' + #13 + '목록으로 이동합니다.');
      Spinbox1.ResetSelection;
      ResvTabControl.ActiveTab := TabItem3_1;
    end;
    1: ShowMessage('Return 1: 예약 실패');
    2: ShowMessage('Return 2: 예약 실패');
  end;
  Dm.ResvWaitJoin.Refresh;
  Dm.ResvJoin.Refresh;
end;

procedure TFrmMainClient.BtnSignBackClick(Sender: TObject);
begin
  SignTabControl.ActiveTab := TabItem_SignIn;
end;

procedure TFrmMainClient.BtnSignInClick(Sender: TObject);
var
  AUsrMail, APw: string;
  UsrCode: Integer;
//  Client: TServerMethods1Client;
begin
  if (EditSignEmail.Text.IsEmpty) then
  begin
    ShowMessage('이메일 주소를 입력해 주세요.');
    EditSignEmail.SetFocus;
    Exit;
  end;
  if (EditSignPw.Text.IsEmpty) then
  begin
    ShowMessage('비밀번호를 입력해 주세요.');
    EditSignPw.SetFocus;
    Exit;
  end;

  AUsrMail := EditSignEmail.Text;
  APw := EditSignPw.Text;
  UsrCode := DM.Client.SignInUser(AUsrMail, APw);

  case UsrCode of
    -999: ShowMessage('아이디와 비밀번호를 확인해 주세요.');
    -998: ShowMessage('관리자에게 문의해 주세요.');
  else
    begin
      Dm.UsrCode := UsrCode;
      ShowMessage('로그인 되었습니다.' + UsrCode.ToString);
      TabItem_SignIn.Visible := False;
      TabItem_SignUp.Visible := False;
      TabItem_Main.Visible := True;
      SignTabControl.ActiveTab := TabItem_Main;
      TextCall.Visible := True;
      //확인
      Dm.BizCode := 2;
      Dm.BizQuery.Close;
      Dm.BizQuery.Open;
      Dm.NotiQuery.Close;
      Dm.NotiQuery.Open;
      Dm.ProdQuery.Close;
      Dm.ProdQuery.Open;
      Dm.ResvJoin.Close;
      Dm.ResvJoin.ParamByName('USR_CODE').AsInteger := Dm.UsrCode;
      Dm.ResvJoin.Open;
      Dm.ResvWaitJoin.Close;
      Dm.ResvWaitJoin.Open;
    end;
  end;
end;

procedure TFrmMainClient.BtnSignUpClick(Sender: TObject);
var
  AUsrMail, APw, APhone: string;
  Chk: Boolean;
begin
  if EditEmail.Text.IsEmpty
    or EditPw.Text.IsEmpty or EditCPw.Text.IsEmpty
    or EditPhone.Text.IsEmpty then
  begin
    ShowMessage('모든 항목을 입력해 주세요.');
    Exit;
  end;
  AUsrMail := EditEmail.Text;
  APw := EditPw.Text;
  APhone := EditPhone.Text;

  Chk := Dm.Client.SignUpUser(AUsrMail, APw, APhone);
  if Chk then
  begin
    SignTabControl.ActiveTab := TabItem_SignIn;
    ShowMessage('등록이 완료되었습니다.');
  end
  else
    ShowMessage('이미 가입된 아이디가 존재합니다.');
end;



procedure TFrmMainClient.DoBtnResvCnclClick(Sender: TObject);
var
  Item : TListBoxItem;
  I, PrdCode, Cnt, Chk: Integer;
  ResDate, KeyDate: TDateTime;

begin
  Item := TListBoxItem(FindItemParent(Sender as TFmxObject,TListBoxItem));
  if Assigned(Item) then
  begin
//    ShowMessage(IntToStr(Item.Index) + ' listbox item');
    Dm.ResvJoin.First;
    for I := 0 to Dm.ResvJoin.RecordCount-1 do
    begin
      if Item.Index <> I then
        Dm.ResvJoin.Next
      else
      begin
        ResDate := Dm.ResvJoin.FieldByName('RES_DATE').AsDateTime;
        KeyDate := Dm.ResvJoin.FieldByName('KEY_DATE').AsDateTime;
        PrdCode := Dm.ResvWaitJoin.FieldByName('PRD_CODE').AsInteger;
        Cnt := Dm.ResvJoin.FieldByName('Cnt').AsInteger;

        Chk := Dm.Client.ResCncl(PrdCode, Cnt, ResDate, KeyDate);
        case Chk of
          0: begin
              ShowMessage('취소 완료');
              MainTabControl.ActiveTab := TabItem4;
              Dm.ResvJoin.Refresh;
              ListBoxItemRefresh;
             end;
          1: ShowMessage('Return 1: 취소 실패');
          2: ShowMessage('Return 2: 취소 실패');
        end;

      end;

    end;

  end;

end; //procedure

procedure TFrmMainClient.TextToSignUpClick(Sender: TObject);
begin
  SignTabControl.ActiveTab := TabItem_SignUp;
  EditEmail.SetFocus;
end;

procedure TFrmMainClient.EditCPwKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin

  if EditPw.Text = EditCPw.Text then
  begin
    PwWarn.Text := '';
    BtnSignUp.Enabled := True;
  end
  else
  begin
    PwWarn.Text := '비밀번호가 다릅니다.';
    BtnSignUp.Enabled := False;
  end;

end;

procedure TFrmMainClient.MainTabControlChange(Sender: TObject);
var
  LItem: TListViewItem;
  I: Integer;
  Item: TListBoxItem;
begin


  case MainTabControl.TabIndex of
    0: Dm.BizQuery.Refresh;
    1: Dm.NotiQuery.Refresh;
    2: begin
      Dm.ResvWaitJoin.Refresh;
      ResvTabControl.ActiveTab := TabItem3_1;
      if Dm.ResvWaitJoin.RecordCount = 0 then
      begin
        ListBox1.Clear;
        Text1.Text := '목록이 존재하지 않습니다.';
        Text1.Visible := True;
      end
      else
      begin
        Text1.Text := '';
        Text1.Visible := False;
      end;
    end;
    3: begin
      Dm.ResvJoin.Refresh;
      Dm.UserJoin.Refresh;
      TextCpn.Text := '쿠폰 적립 수: ' + Dm.UserJoin.FieldByName('CPNCNT').AsInteger.ToString;
      TextCharge.Text := '충전 금액: ' + Dm.UserJoin.FieldByName('CHARGE').AsInteger.ToString;
      if Dm.ResvJoin.RecordCount = 0 then
      begin
        ListBox1.Clear;
        Text2.Text := '목록이 존재하지 않습니다.';
        Text2.Visible := True;

      end
      else
      begin
        ListBox1.Clear;
        Text2.Text := '';
        Text2.Visible := False;

        // ListBoxItem 뿌림
        ListBoxItemRefresh;

      end; //if
    end; //
  end;
end;
procedure TFrmMainClient.MyCallBack;
begin
  ShowMessage('상품이 출고되었습니다.');
end;

procedure TFrmMainClient.SignTabControlChange(Sender: TObject);
begin
  if (Dm.UsrCode = 0) and (SignTabControl.ActiveTab = TabItem_Main) then
  begin
    ShowMessage('로그인 창으로 이동합니다.');
    SignTabControl.ActiveTab := TabItem_SignIn;
  end;
end;

{ TMemoCallBack }

function TMemoCallBack.execute(const arg: tjsonvalue): tjsonvalue;
var
  MessageStr:string;
begin
  result := TJSONTrue.Create;
  if arg is TJSONString then
     Messagestr := TJSONString(arg).Value;

  tthread.Synchronize(nil,
                     procedure
                     begin
//                       TextCall.text := Messagestr;
//                          FrmMainClient.TextCall.text := '상품이 출고 되었습니다.';
                        FrmMainClient.MyCallBack;
                     end );
end;

procedure TFrmMainClient.FormCreate(Sender: TObject);
begin
  SignTabControl.ActiveTab := TabItem_SignIn;  // 초기 활성화 탭
  EditSignEmail.SetFocus;
  TabItem_Main.Visible := False;

  MainTabControl.ActiveTab := TabItem1;
  ResvTabControl.ActiveTab := TabItem3_1;

  Dm.BizCode := 0;
  Dm.UsrCode := 0;
  Dm.PrdCode := 0;
  Dm.ChannelManager1.RegisterCallback(CallBackId, Tmemocallback.create);
end;

end.
