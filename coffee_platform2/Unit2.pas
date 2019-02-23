unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.Edit, FMX.EditBox, FMX.SpinBox, FMX.StdCtrls, FMX.ListView, FMX.Layouts,
  FMX.Objects, FMX.Controls.Presentation, FMX.TabControl;

type
  TForm2 = class(TForm)
    MainTabControl: TTabControl;
    TabItem1: TTabItem;
    ToolBar1: TToolBar;
    StoreNM: TLabel;
    MainLayout: TLayout;
    VertScrollBox1: TVertScrollBox;
    Layout1: TLayout;
    Panel5: TPanel;
    Text5: TText;
    Layout2: TLayout;
    Img_Sig: TImage;
    Layout14: TLayout;
    Panel6: TPanel;
    Layout3: TLayout;
    GridPanelLayout1: TGridPanelLayout;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    TabItem2: TTabItem;
    ToolBar3: TToolBar;
    ListView1: TListView;
    TabItem3: TTabItem;
    ResvTabControl: TTabControl;
    TabItem3_1: TTabItem;
    ToolBar6: TToolBar;
    Layout9: TLayout;
    ListView2: TListView;
    Layout12: TLayout;
    Text6: TText;
    TabItem3_2: TTabItem;
    Layout10: TLayout;
    Image1: TImage;
    Panel2: TPanel;
    BtnResv: TButton;
    SpinBox1: TSpinBox;
    Text1: TText;
    Text2: TText;
    Text8: TText;
    Text9: TText;
    ToolBar2: TToolBar;
    BtnBack3_2: TButton;
    TabItem4: TTabItem;
    MyTabControl: TTabControl;
    TabItem4_1: TTabItem;
    ListView3: TListView;
    Layout13: TLayout;
    Text7: TText;
    ToolBar4: TToolBar;
    TabItem4_2: TTabItem;
    Layout11: TLayout;
    Image6: TImage;
    Panel3: TPanel;
    BtnResvCncl: TButton;
    Text3: TText;
    Text4: TText;
    ToolBar5: TToolBar;
    BtnBack4_2: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

end.
