unit uRegResv;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Ucheckgrid, Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls, Vcl.WinXPickers,
  Vcl.Samples.Spin;

type
  TFrmRegResv = class(TForm)
    DatePicker1: TDatePicker;
    TimePicker1: TTimePicker;
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    SpinEdit1: TSpinEdit;
    Insert_button: TButton;
    Select_Button: TButton;
    Apply_button: TButton;
    ResvWaitSource: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    DataSource1: TDataSource;
    Panel3: TPanel;
    BtnRelease: TButton;
    BtnRefresh: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Insert_buttonClick(Sender: TObject);
    procedure Select_ButtonClick(Sender: TObject);
    procedure ResvWaitSourceDataChange(Sender: TObject; Field: TField);
    procedure FormActivate(Sender: TObject);
    procedure ResvWaitSourceUpdateData(Sender: TObject);
    procedure Apply_buttonClick(Sender: TObject);
    procedure BtnReleaseClick(Sender: TObject);
    procedure BtnRefreshClick(Sender: TObject);
    procedure DatePicker1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRegResv: TFrmRegResv;

implementation

{$R *.dfm}

uses CommonFunctions, dmAdmin, uAdminClass, uSelProd;

procedure TFrmRegResv.Apply_buttonClick(Sender: TObject);
begin
  Dm.ResvWaitQuery.ApplyUpdates(0);
  ShowMessage('저장 완료');
end;

procedure TFrmRegResv.BtnRefreshClick(Sender: TObject);
begin
  Dm.ResvWaitQuery.Refresh;
end;

procedure TFrmRegResv.BtnReleaseClick(Sender: TObject);
var
  sum: double;
  Cnt, Chk, PrdCode, I: integer;
  StDate: TDateTime;

begin
  StDate := Dm.ResvWaitQuery.FieldByName('ST_DATE').AsDateTime;
  PrdCode := Dm.ResvWaitQuery.FieldByName('PRD_CODE').AsInteger;
  Cnt := Dm.ResvWaitQuery.FieldByName('CNT').AsInteger;
  Chk := Dm.Client.ResApply(Cnt, 2, PrdCode, StDate);
  Dm.ResvWaitQuery.Refresh;
//  if DBGrid1.SelectedRows.Count > 0 then
//  begin
//    sum := 0;
//    with DBGrid1.DataSource.DataSet do
//    begin
//      DisableControls;
//      try
//        for I := 0 to DBGrid1.SelectedRows.Count-1 do
//        begin
//          // i 번째 선택된 레코드로 이동
//          GotoBookmark(DBGrid1.SelectedRows.Items[I]);
//          Dm.ResvWaitQuery.revertRecord;
//        end;
//      finally
//        EnableControls;
//      end;
//    end;
//    dbgrid1.SelectedRows.Clear;
//    select_button.Enabled := false;
//  end;
end;

procedure TFrmRegResv.DatePicker1Change(Sender: TObject);
var
  Date: TDate;
begin
  Date := Now;

  if DatePicker1.Date < Date-1 then
  begin
    DatePicker1.Date := Date;
    ShowMessage('이전 날짜는 선택할 수 없습니다.');
  end;

end;

procedure TFrmRegResv.FormActivate(Sender: TObject);
begin
  ResvWaitSourceUpdateData(ResvWaitSource);
end;

procedure TFrmRegResv.FormCreate(Sender: TObject);
var
  Date: TDate;
begin
  Date := Now;
  DatePicker1.Date := Date;
end;

procedure TFrmRegResv.Insert_buttonClick(Sender: TObject);
var
  SelDate, SelTime, SelDateTime: string;
  I, PrdCode, Salescnt: integer;

begin
  if VarIsNull(dblookupcombobox1.KeyValue) then
  begin
    ShowMessage('상품을 선택해 주세요.');
    Exit;
  end;
  SelDate := DateToStr(DatePicker1.Date);
  SelTime := TimeToStr(TimePicker1.Time);
  SelDateTime := Concat(SelDate, ' ', SelTime);   //판매일자
  SalesCnt := SpinEdit1.Value;     //판매수량

  PrdCode := VarToStr(dblookupcombobox1.KeyValue).ToInteger; //상품코드
  Dm.ResvWaitQuery.First;
  while not Dm.ResvWaitQuery.Eof do
  begin
    if (Dm.ResvWaitQuery.FieldByName('ST_DATE').AsDateTime = StrToDateTime(SelDateTime))
      and (Dm.ResvWaitQuery.FieldByName('PRD_CODE').AsInteger = PrdCode) then
    begin
      ShowMessage('해당 판매일자와 상품이 이미 등록되어 있습니다.');
      Exit;
    end;
    Dm.ResvWaitQuery.Next;
  end;
//  Dm.ResvWaitQuery.First;
//  while Dm.ResvWaitQuery.Eof do
//  begin
//    ShowMessage('ee');
//    Dm.ResvWaitQuery.Next;
//  end;
//    ShowMessage(Dm.ResvWaitQuery.FieldByName('ST_DATE').ToString);

//  for I := 0 to Dm.ResvWaitQuery.RecordCount-1 do
//  begin
//    dm.ResvWaitQuery.
//  end;



  ResvWaitSource.DataSet.Insert;
  ResvWaitSource.DataSet.FieldByName('ST_DATE').AsDateTime := StrToDateTime(SelDateTime);
  ResvWaitSource.DataSet.FieldByName('PRD_CODE').AsInteger := PrdCode;
  ResvWaitSource.DataSet.FieldByName('BIZ_CODE').AsInteger := Dm.BizCode;
  ResvWaitSource.DataSet.FieldByName('SALESCNT').AsInteger := SalesCnt;
  ResvWaitSource.DataSet.FieldByName('CNT').AsInteger := 0;
  ResvWaitSource.DataSet.Post;

end;

procedure TFrmRegResv.ResvWaitSourceDataChange(Sender: TObject;
  Field: TField);
begin
    case Dm.ResvWaitQuery.UpdateStatus of
    usUnmodified:begin
                   insert_button.Enabled := true;
   //                load_button.Enabled := true;
   //                save_button.Enabled := false;
                   select_button.Enabled := false;
                   apply_button.Enabled := False;
                 end;
    usInserted:  begin
                   apply_button.Enabled := true;
   //                save_button.Enabled := true;
   //                load_button.Enabled := false;
                   select_button.Enabled := true;
                 end;
    usDeleted: begin
   //                load_button.Enabled := false;
                   apply_button.Enabled := true;
   //                save_button.Enabled := true;
                   select_button.Enabled := true;
                end;
    usModified: begin
                  insert_button.Enabled := False;
                  select_button.Enabled := False;
                  apply_button.Enabled := True;
                end;
  end; // case
end;

procedure TFrmRegResv.ResvWaitSourceUpdateData(Sender: TObject);
begin
  case Dm.ResvWaitQuery.UpdateStatus of
    usUnmodified:begin
                   insert_button.Enabled := true;
   //                load_button.Enabled := true;
   //                save_button.Enabled := false;
                   select_button.Enabled := false;
                   apply_button.Enabled := false;
                 end;
    usInserted:  begin
                   apply_button.Enabled := true;
   //                save_button.Enabled := true;
   //                load_button.Enabled := false;
                   select_button.Enabled := true;
                 end;
    usDeleted: begin
   //                load_button.Enabled := false;
                   apply_button.Enabled := true;
   //                save_button.Enabled := true;
                   select_button.Enabled := true;
                end;
  end; // case
end;

procedure TFrmRegResv.Select_ButtonClick(Sender: TObject);
var
  sum: double;
  I: integer;
begin
  if DBGrid1.SelectedRows.Count > 0 then
  begin
    sum := 0;
    with DBGrid1.DataSource.DataSet do
    begin
      DisableControls;
      try
        for I := 0 to DBGrid1.SelectedRows.Count-1 do
        begin
          // i 번째 선택된 레코드로 이동
          GotoBookmark(DBGrid1.SelectedRows.Items[I]);
          Dm.ResvWaitQuery.revertRecord;
        end;
      finally
        EnableControls;
      end;
    end;
    dbgrid1.SelectedRows.Clear;
    select_button.Enabled := false;
  end;
end;

end.
