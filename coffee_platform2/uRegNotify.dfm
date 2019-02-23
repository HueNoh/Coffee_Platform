object FrmRegNotify: TFrmRegNotify
  Left = 0
  Top = 0
  Caption = #44277#51648#46321#47197
  ClientHeight = 468
  ClientWidth = 716
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
    Width = 716
    Height = 41
    Align = alTop
    Caption = #44277#51648
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
    Width = 716
    Height = 40
    Align = alTop
    TabOrder = 1
    object BtnDelNoti: TButton
      Left = 592
      Top = 6
      Width = 75
      Height = 25
      Caption = #49440#53469#49325#51228
      TabOrder = 0
      OnClick = BtnDelNotiClick
    end
    object EditNoti: TEdit
      Left = 16
      Top = 8
      Width = 465
      Height = 21
      TabOrder = 1
    end
  end
  object BtnNoti: TButton
    Left = 496
    Top = 47
    Width = 75
    Height = 25
    Caption = #51077#47141
    TabOrder = 2
    OnClick = BtnNotiClick
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 81
    Width = 716
    Height = 387
    Align = alClient
    DataSource = NotiSource
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CONTENT'
        Width = 350
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REG_DATE'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BIZ_CODE'
        Visible = False
      end>
  end
  object NotiSource: TDataSource
    DataSet = dmAdminAccess.NotiQuery
    Left = 48
  end
end
