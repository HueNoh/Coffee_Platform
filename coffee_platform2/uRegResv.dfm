object FrmRegResv: TFrmRegResv
  Left = 0
  Top = 0
  Caption = #50696#50557#54032#47588' '#46321#47197
  ClientHeight = 613
  ClientWidth = 740
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 740
    Height = 41
    Align = alTop
    Caption = #50696#50557#54032#47588' '#46321#47197
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 20
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 740
    Height = 144
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 18
      Top = 72
      Width = 100
      Height = 20
      Caption = #54032#47588' '#49345#54408' '#49440#53469
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 20
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 18
      Top = 108
      Width = 90
      Height = 20
      Caption = #54032#47588#50696#51221#49688#47049
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 20
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 18
      Top = 38
      Width = 110
      Height = 20
      Caption = #50696#50557#54032#47588' '#49884#51089#51068
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 20
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DatePicker1: TDatePicker
      Left = 147
      Top = 26
      Date = 43510.000000000000000000
      DateFormat = 'yyyy/MM/dd'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      TabOrder = 0
      OnChange = DatePicker1Change
    end
    object TimePicker1: TTimePicker
      Left = 315
      Top = 26
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      TabOrder = 1
      Time = 0.500000000000000000
      TimeFormat = 'AMPM h:mm'
    end
    object SpinEdit1: TSpinEdit
      Left = 147
      Top = 98
      Width = 150
      Height = 30
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 20
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 2
      MaxValue = 50
      MinValue = 1
      ParentFont = False
      TabOrder = 2
      Value = 1
    end
    object Insert_button: TButton
      Left = 492
      Top = 26
      Width = 75
      Height = 25
      Caption = #52628#44032
      TabOrder = 3
      OnClick = Insert_buttonClick
    end
    object Select_Button: TButton
      Left = 573
      Top = 26
      Width = 75
      Height = 25
      Caption = #49440#53469#52712#49548
      TabOrder = 4
      OnClick = Select_ButtonClick
    end
    object Apply_button: TButton
      Left = 573
      Top = 57
      Width = 75
      Height = 25
      Caption = #51200#51109
      TabOrder = 5
      OnClick = Apply_buttonClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 185
    Width = 740
    Height = 328
    TabStop = False
    Align = alTop
    DataSource = ResvWaitSource
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ST_DATE'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRD_CODE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PRD_NAME'
        ReadOnly = True
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BIZ_CODE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'BIZ_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALESCNT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CNT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ED_DATE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'RESCNT'
        Title.Caption = #45224#51008#49688#47049
        Visible = True
      end>
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 147
    Top = 105
    Width = 318
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 20
    Font.Name = 'Tahoma'
    Font.Style = []
    KeyField = 'PRD_CODE'
    ListField = 'TITLE'
    ListSource = DataSource1
    ParentFont = False
    TabOrder = 3
  end
  object Panel3: TPanel
    Left = 0
    Top = 513
    Width = 740
    Height = 100
    Align = alClient
    TabOrder = 4
    object BtnRelease: TButton
      Left = 512
      Top = 6
      Width = 145
      Height = 73
      Caption = #49440#53469#52636#44256
      TabOrder = 0
      OnClick = BtnReleaseClick
    end
  end
  object BtnRefresh: TButton
    Left = 492
    Top = 98
    Width = 75
    Height = 25
    Caption = #49352#47196#44256#52840
    TabOrder = 5
    OnClick = BtnRefreshClick
  end
  object ResvWaitSource: TDataSource
    DataSet = dmAdminAccess.ResvWaitQuery
    OnDataChange = ResvWaitSourceDataChange
    OnUpdateData = ResvWaitSourceUpdateData
    Left = 56
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = dmAdminAccess.ProdQuery
    Left = 16
    Top = 8
  end
end
