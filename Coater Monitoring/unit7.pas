unit Unit7;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ExtCtrls,
  StdCtrls, Spin, HMIEdit, HMILabel, HMICheckBox, TAGraph, TASeries,
  TANavigation, TAIntervalSources, TATools, TAChartAxis, Types, TATextElements,
  TAChartUtils, TATransformations;

type

  { TFormChart }

  TFormChart = class(TForm)
    Button1: TButton;
    Chart1: TChart;
    Chart1LineSeries1: TLineSeries;
    ChartAxisTransformations1: TChartAxisTransformations;
    AutoScaleAxisTransform1: TAutoScaleAxisTransform;
    ChartAxisTransformations2: TChartAxisTransformations;
    ChartMenu: TPopupMenu;
    ChartRefreshMenu: TMenuItem;
    ChartToolset1: TChartToolset;
    ChartToolset1AxisClickTool1: TAxisClickTool;
    ChartZoomInMenu: TMenuItem;
    ChartZoomOutMenu: TMenuItem;
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
    procedure Button1Click(Sender: TObject);
    procedure Chart1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure Chart1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure Chart1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure ChartToolset1AxisClickTool1AfterMouseWheelDown(ATool: TChartTool;
      APoint: TPoint);
    procedure ChartToolset1AxisClickTool1AfterMouseWheelUp(ATool: TChartTool;
      APoint: TPoint);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    procedure AddAutoScaleToAxis(AChart: TChart; AxisIndex: Integer);
  public

  end;

var
  FormChart: TFormChart;
  MouseWheel:boolean;
  ChartAxisIndex:integer;

implementation

uses
  Unit1;

{$R *.lfm}

{ TFormChart }

procedure TFormChart.AddAutoScaleToAxis(AChart: TChart; AxisIndex: Integer);
var
  AxisTrans: TChartAxisTransformations;
  AutoScaleTrans: TAutoscaleAxisTransform;
begin
  if AxisIndex >= AChart.AxisList.Count then begin showmessage('over index'); exit; end;
  if AChart.AxisList[AxisIndex].Transformations <> nil then begin showmessage('have Transformations'); exit; end;
  if AChart.AxisList[AxisIndex].Transformations = nil then showmessage('no Transformations');

  AxisTrans := TChartAxisTransformations.Create(Self);

  // 2. Link the container to the chosen axis (e.g., 0 for LeftAxis)
  AChart.AxisList[AxisIndex].Transformations := AxisTrans;

  // 3. Create the AutoScale transformation object inside the container
  AutoScaleTrans := TAutoscaleAxisTransform.Create(AxisTrans);

  // 4. Configure ranges if necessary (Defaults are 0 and 1)
  AutoScaleTrans.MinValue := 0;
  AutoScaleTrans.MaxValue := 100;
  AutoScaleTrans.Enabled:=true;

  AutoScaleTrans.Transformations := AxisTrans;
end;

procedure TFormChart.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  Form1.Show;
end;

procedure TFormChart.FormCreate(Sender: TObject);
begin
  MouseWheel:=false;
end;

procedure TFormChart.ChartToolset1AxisClickTool1AfterMouseWheelDown(
  ATool: TChartTool; APoint: TPoint);
begin
  //showmessage('WheelDown');
  if MouseWheel then
  begin
    if AutoScaleAxisTransform1.MaxValue <= 1 then exit;
    if ChartAxisIndex =0 then AutoScaleAxisTransform1.MaxValue:=AutoScaleAxisTransform1.MaxValue-1;
  end;
end;

procedure TFormChart.ChartToolset1AxisClickTool1AfterMouseWheelUp(
  ATool: TChartTool; APoint: TPoint);
begin
  //showmessage('WheelUp');
  if MouseWheel then
  begin
    if AutoScaleAxisTransform1.MaxValue >=1000 then exit;
    if ChartAxisIndex =0 then AutoScaleAxisTransform1.MaxValue:=AutoScaleAxisTransform1.MaxValue+1;
  end;
end;

procedure TFormChart.Chart1DragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  //FormChart.Caption:=TimeToStr(now);
  if Source is TShape then
  begin
    showmessage(TShape(Source).Name);
    exit;
  end;
  if Source is TImage then
  begin
    showmessage(TImage(Source).Name);
    exit;
  end;
  if Source is THMIEdit then
  begin
    showmessage(THMIEdit(Source).Name);
    exit;
  end;
  if Source is THMILabel then
  begin
    showmessage(THMILabel(Source).Name);
    exit;
  end;
  if Source is THMICheckBox then
  begin
    showmessage(THMICheckBox(Source).Name);
    exit;
  end;
  if Source is Tlabel then
  begin
    showmessage(Tlabel(Source).Name);
    exit;
  end;
end;

procedure TFormChart.Button1Click(Sender: TObject);
var
  AxisTrans: TChartAxisTransformations;
  AutoScaleTrans: TAutoscaleAxisTransform;
begin
  AddAutoScaleToAxis(Chart1,2)

end;

procedure TFormChart.Chart1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := True;
end;

procedure TFormChart.Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  //P: TDoublePoint;
  //AxisXVal, AxisYVal: Double;
  //Ex: TDoubleRect;
  //MinY, MaxY: Double;
  i:integer;
  TotalLeftAxis:integer;
  Sum_01:integer;
  Sum_02:integer;
begin
  //P := Chart1.ImageToGraph(Point(X, Y));
  //AxisXVal := Chart1.BottomAxis.GetTransform.GraphToAxis(P.X);
  //AxisYVal := Chart1.LeftAxis.GetTransform.GraphToAxis(P.Y);
  //FormChart.Caption:= Format('X = %.2f, Y = %.2f', [AxisXVal, AxisYVal]);

  //Ex := Chart1.CurrentExtent; // Consider zoom/pan state
  //MinY := Ex.a.Y;
  //MaxY := Ex.b.Y;

  TotalLeftAxis:=0;
  Sum_01:=0;
  Sum_02:=0;
  ChartAxisIndex:=0;
  for i:=0 to Chart1.AxisList.Count-1 do
  begin
    if Chart1.AxisList[i].Visible then
    if LeftStr(Chart1.AxisList[i].DisplayName,4) = 'Left' then
    begin
      TotalLeftAxis:=TotalLeftAxis+1;

      if Chart1.AxisList[i].LabelSize = 0 then Chart1.AxisList[i].LabelSize:=25;
      if Chart1.AxisList[i].Margin = 0 then Chart1.AxisList[i].Margin := 1;

      Sum_01:=Sum_01+Chart1.AxisList[i].LabelSize+Chart1.AxisList[i].Margin;
      if (X >= Sum_02) and (X <= Sum_01) then
      begin
        ChartAxisIndex:=i;
      end;
      Sum_02:=Sum_01;
    end;
  end;
  //FormChart.Caption:= Format('X = %d, Y = %d , %d , MinY = %.2f, MaxY = %.2f, %d', [x, y, Chart1.LeftAxis.Intervals.Count,Ex.a.Y,Ex.b.Y, Chart1.LeftAxis.LabelSize]);
  FormChart.Caption:= Format('TotalLeftAxis = %d , ChartAxisIndex = %d ,  Sum_01 = %d', [TotalLeftAxis, ChartAxisIndex, Sum_01]);

  if X <= Sum_01 then
  begin
    MouseWheel:=true;
  end
  else
  begin
    MouseWheel:=false;
  end;

end;



end.

