object FrmMgmtUsers: TFrmMgmtUsers
  Left = 0
  Top = 0
  Caption = #54924#50896#44288#47532
  ClientHeight = 488
  ClientWidth = 782
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 782
    Height = 41
    Align = alTop
    Caption = #54924#50896#44288#47532
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 20
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 344
    Width = 782
    Height = 144
    Align = alBottom
    Color = clCream
    ParentBackground = False
    TabOrder = 1
    object Edit1: TEdit
      Left = 6
      Top = 6
      Width = 275
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyUp = Edit1KeyUp
    end
    object BtnCpn: TButton
      Left = 519
      Top = 50
      Width = 75
      Height = 38
      Caption = #53216#54256#52237#44592
      Enabled = False
      TabOrder = 1
      OnClick = BtnCpnClick
    end
    object CheckBox1: TCheckBox
      Left = 6
      Top = 47
      Width = 67
      Height = 17
      Caption = 'Email'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clCream
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object CheckBox2: TCheckBox
      Left = 93
      Top = 46
      Width = 97
      Height = 17
      Caption = 'Phone'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object SpinEditCpn: TSpinEdit
      Left = 431
      Top = 50
      Width = 82
      Height = 33
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxValue = 10
      MinValue = 0
      ParentFont = False
      TabOrder = 4
      Value = 0
      OnChange = SpinEditCpnChange
    end
    object EditChg: TEdit
      Left = 352
      Top = 6
      Width = 161
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      TabOrder = 5
      OnChange = EditChgChange
    end
    object BtnChg: TButton
      Left = 519
      Top = 6
      Width = 75
      Height = 38
      Caption = #52649#51204
      Enabled = False
      TabOrder = 6
      OnClick = BtnChgClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 782
    Height = 303
    Align = alClient
    DataSource = UserJoinSource
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'EMAIL'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PHONE'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CHARGE'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CPNCNT'
        Width = 100
        Visible = True
      end>
  end
  object UserJoinSource: TDataSource
    DataSet = dmAdminAccess.UserJoin
    Left = 16
    Top = 8
  end
end
