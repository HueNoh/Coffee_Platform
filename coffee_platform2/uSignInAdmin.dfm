object FrmSignAdmin: TFrmSignAdmin
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = #46321#47197
  ClientHeight = 383
  ClientWidth = 389
  Color = clBtnFace
  DragKind = dkDock
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 389
    Height = 383
    ActivePage = TabSheet1
    Align = alClient
    MultiLine = True
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = '1'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 381
        Height = 355
        Align = alClient
        Anchors = [akLeft, akTop, akRight]
        Color = clGray
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          381
          355)
        object LabelToSignUp: TLabel
          Left = 118
          Top = 242
          Width = 146
          Height = 16
          Cursor = crHandPoint
          Alignment = taCenter
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = #54924#50896#44032#51077
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clInfoBk
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          OnClick = LabelToSignUpClick
          ExplicitWidth = 123
        end
        object Edit2: TEdit
          Left = 72
          Top = 122
          Width = 245
          Height = 33
          Anchors = [akLeft, akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = 25
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          PasswordChar = '*'
          TabOrder = 1
        end
        object BtnSignIn: TButton
          Left = 72
          Top = 177
          Width = 245
          Height = 45
          Anchors = [akLeft, akTop, akRight]
          Caption = #47196#44536#51064
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnClick = BtnSignInClick
        end
        object Edit1: TEdit
          Left = 72
          Top = 83
          Width = 245
          Height = 33
          Anchors = [akLeft, akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = 25
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = '2'
      ImageIndex = 1
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 381
        Height = 355
        Align = alClient
        Anchors = [akLeft, akTop, akRight]
        Color = clGray
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          381
          355)
        object Label1: TLabel
          Left = 50
          Top = 51
          Width = 42
          Height = 19
          Caption = #50500#51060#46356
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clInfoBk
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 50
          Top = 91
          Width = 56
          Height = 19
          Caption = #48708#48128#48264#54840
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clInfoBk
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 50
          Top = 131
          Width = 42
          Height = 19
          Caption = #47588#51109#47749
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clInfoBk
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 50
          Top = 171
          Width = 56
          Height = 19
          Caption = #47588#51109#51452#49548
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clInfoBk
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Edit3: TEdit
          Left = 125
          Top = 49
          Width = 233
          Height = 33
          Anchors = [akLeft, akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = 25
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object BtnSignUp: TButton
          Left = 231
          Top = 224
          Width = 127
          Height = 41
          Anchors = [akTop, akRight]
          Caption = #46321#47197
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          OnClick = BtnSignUpClick
        end
        object Edit4: TEdit
          Left = 125
          Top = 88
          Width = 233
          Height = 33
          Anchors = [akLeft, akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = 25
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object Edit5: TEdit
          Left = 125
          Top = 128
          Width = 233
          Height = 33
          Anchors = [akLeft, akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = 25
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object Edit6: TEdit
          Left = 125
          Top = 167
          Width = 233
          Height = 33
          Anchors = [akLeft, akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = 25
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object BtnBack: TButton
          Left = 67
          Top = 224
          Width = 125
          Height = 41
          Anchors = [akTop, akRight]
          Caption = #8592
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          OnClick = BtnBackClick
        end
      end
    end
  end
end
