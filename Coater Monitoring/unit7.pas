unit Unit7;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, TAGraph,
  TASeries, TANavigation, TAIntervalSources, TATools, TAChartAxis;

type

  { TFormChart }

  TFormChart = class(TForm)
    Chart1: TChart;
    Chart1LineSeries1: TLineSeries;
    Chart1LineSeries2: TLineSeries;
    Chart1LineSeries3: TLineSeries;
    Chart1LineSeries4: TLineSeries;
    Chart1LineSeries5: TLineSeries;
    ChartMenu: TPopupMenu;
    ChartRefreshMenu: TMenuItem;
    ChartToolset1: TChartToolset;
    ChartToolset1AxisClickTool1: TAxisClickTool;
    ChartZoomInMenu: TMenuItem;
    ChartZoomOutMenu: TMenuItem;
    IntervalChartSource1: TIntervalChartSource;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem9: TMenuItem;
    procedure ChartToolset1AxisClickTool1Click(ASender: TChartTool;
      Axis: TChartAxis; AHitInfo: TChartAxisHitTests);
  private

  public

  end;

var
  FormChart: TFormChart;

implementation

uses
  Unit1;

{$R *.lfm}

{ TFormChart }

procedure TFormChart.ChartToolset1AxisClickTool1Click(ASender: TChartTool;
  Axis: TChartAxis; AHitInfo: TChartAxisHitTests);
begin
  showmessage('ChartToolset1AxisClickTool1Click');
end;

end.

