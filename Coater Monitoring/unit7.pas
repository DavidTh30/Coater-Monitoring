unit Unit7;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ExtCtrls,
  StdCtrls, Spin, HMIEdit, HMILabel, HMICheckBox, TAGraph, TASeries,
  TANavigation, TAIntervalSources, TATools, TAChartAxis, Types, TATextElements,
  TAChartUtils, TATransformations, TAChartAxisUtils, TAChartLiveView;

type

  { TFormChart }

  TFormChart = class(TForm)
    Chart1: TChart;
    ChartAxisTransformations1: TChartAxisTransformations;
    ChartAxisTransformations1AutoScaleAxisTransform1: TAutoScaleAxisTransform;
    ChartMenu: TPopupMenu;
    ChartRefreshMenu: TMenuItem;
    ChartToolset1: TChartToolset;
    ChartToolset1AxisClickTool1: TAxisClickTool;
    ChartZoomInMenu: TMenuItem;
    ChartZoomOutMenu: TMenuItem;
    MainMenu1: TMainMenu;
    MenuCustom: TMenuItem;
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
    MenuClear: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem9: TMenuItem;
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
    procedure MenuClearClick(Sender: TObject);
  private
    procedure AddTChartAxis(Name_:string; AChart: TChart);
    procedure AddAutoScaleToAxis(AChart: TChart; AxisIndex: Integer);
  public

  end;

procedure InitLineSeries();

var
  FormChart: TFormChart;
  MouseWheel:boolean;
  ChartAxisIndex:integer;
  TotalBottomAxis:integer;
  TotalLeftAxis:integer;

  Series_LineSpeed_Act: TLineSeries;
  Series_TakeOffRollSpeed_Act: TLineSeries;
  Series_GravureSpeed_Act: TLineSeries;
  Series_CoronaSpeed_Act: TLineSeries;
  Series_Corona_Act: TLineSeries;

implementation

uses
  Unit1;

{$R *.lfm}

{ TFormChart }

procedure InitLineSeries();
var
  i:integer;
begin
  Series_LineSpeed_Act := TLineSeries.Create(Unit1.Form1);
  Series_LineSpeed_Act.Title:='LineSpeed_Act';
  //Series_LineSpeed_Act.Source:=Unit1.Form1.ListChartSource1;

  Series_TakeOffRollSpeed_Act := TLineSeries.Create(Unit1.Form1);
  Series_TakeOffRollSpeed_Act.Title:='TakeOffRollSpeed_Act';
  //Series_TakeOffRollSpeed_Act.Source:=Unit1.Form1.ListChartSource2;

  Series_GravureSpeed_Act := TLineSeries.Create(Unit1.Form1);
  Series_GravureSpeed_Act.Title:='GravureSpeed_Act';
  //Series_GravureSpeed_Act.Source:=Unit1.Form1.ListChartSource3;

  Series_CoronaSpeed_Act := TLineSeries.Create(Unit1.Form1);
  Series_CoronaSpeed_Act.Title:='CoronaSpeed_Act';
  //Series_CoronaSpeed_Act.Source:=Unit1.Form1.ListChartSource4;

  Series_Corona_Act := TLineSeries.Create(Unit1.Form1);
  Series_Corona_Act.Title:='Corona_Act';
  //Series_Corona_Act.Source:=Unit1.Form1.ListChartSource5;

  for i:=0 to 1500 do
  begin
    Series_LineSpeed_Act.Add(0,'');
    Series_TakeOffRollSpeed_Act.Add(0,'');
    Series_GravureSpeed_Act.Add(0,'');
    Series_CoronaSpeed_Act.Add(0,'');
    Series_Corona_Act.Add(0,'');
  end;
end;

procedure TFormChart.AddTChartAxis(Name_:string; AChart: TChart);
var
  CustomAxisBottom: TChartAxis;
  CustomAxis: TChartAxis;
  CustomLineSeries: TLineSeries;
  i:integer;
  calBottomOK:boolean;
  AxisBottomIndex:integer;
begin

  for i:=0 to AChart.AxisList.Count-1 do
  begin
    if AChart.AxisList[i].Title.Caption=Name_ then exit;
  end;

  AxisBottomIndex:=0;
  TotalBottomAxis:=0;
  TotalLeftAxis:=0;

  //showmessage(AChart.AxisList.Count.ToString);

  calBottomOK:=false;
  i:=0;
  while i <= AChart.AxisList.Count-1 do //for i:=0 to AChart.AxisList.Count-1 do
  begin
    if i < 0 then i:=0;
    if i >= AChart.AxisList.Count then break;

    if AChart.AxisList[i].Alignment=calBottom then
    begin
      if AChart.AxisList[i].Title.Caption='DateTime' then begin calBottomOK:=true; AxisBottomIndex:=i; TotalBottomAxis:=TotalBottomAxis+1; end;
      if AChart.AxisList[i].Title.Caption<>'DateTime' then begin AChart.AxisList.Delete(i); i:=i-1; end;
    end;

    if i < 0 then i:=0;
    if i >= AChart.AxisList.Count then break;

    if AChart.AxisList[i].Alignment=calLeft then
    begin
      if AChart.AxisList[i].Title.Caption='' then begin AChart.AxisList.Delete(i); i:=i-1; end;
    end;

    i:=i+1;
  end;

  //showmessage(AChart.AxisList.Count.ToString);

  if not calBottomOK then
  begin
    CustomAxisBottom := TChartAxis.Create(AChart.AxisList);
    CustomAxisBottom.Alignment := calBottom;
    CustomAxisBottom.Title.Caption := 'DateTime';
    CustomAxisBottom.LabelSize:=0;
    CustomAxisBottom.Margin:=0;
    CustomAxisBottom.Title.Visible:=false;
    CustomAxisBottom.Grid.Visible:=false;
    CustomAxisBottom.MarginsForMarks:=true;
    CustomAxisBottom.Marks.OverlapPolicy:=opHideNeighbour;
    CustomAxisBottom.Marks.LabelFont.Orientation:=900;
    CustomAxisBottom.Marks.Source:=Series_LineSpeed_Act.Source;
    CustomAxisBottom.Marks.Style:=smsLabel;
    AxisBottomIndex:=CustomAxisBottom.Index;
    TotalBottomAxis:=TotalBottomAxis+1;
    if (AChart.Series.Count > 0) and  (AChart.Series[0] is TLineSeries) then
    begin
      //TLineSeries(AChart.Series[0]).AxisIndexX:=CustomAxisBottom.Index;
      //TLineSeries(AChart.Series[0]).AxisIndexY:=-1;
    end;
  end;

  CustomAxis := TChartAxis.Create(Chart1.AxisList);
  CustomAxis.Alignment := calLeft;
  CustomAxis.Title.Caption := Name_;
  if Name_ = 'LineSpeed_Act' then CustomAxis.Marks.LabelFont.Color:=clRed;
  if Name_ = 'TakeOffRollSpeed_Act' then CustomAxis.Marks.LabelFont.Color:=clLime;
  if Name_ = 'GravureSpeed_Act' then CustomAxis.Marks.LabelFont.Color:=clBlue;
  if Name_ = 'CoronaSpeed_Act' then CustomAxis.Marks.LabelFont.Color:=clGreen;
  if Name_ = 'Corona_Act' then CustomAxis.Marks.LabelFont.Color:=clPurple;
  CustomAxis.LabelSize:=25;
  CustomAxis.Margin:=1;
  CustomAxis.Title.Visible:=false;
  CustomAxis.Grid.Visible:=false;

  CustomLineSeries := TLineSeries.Create(AChart);
  if Name_ = 'LineSpeed_Act' then CustomLineSeries.Source:=Series_LineSpeed_Act.Source;
  if Name_ = 'TakeOffRollSpeed_Act' then CustomLineSeries.Source:=Series_TakeOffRollSpeed_Act.Source;
  if Name_ = 'GravureSpeed_Act' then CustomLineSeries.Source:=Series_GravureSpeed_Act.Source;
  if Name_ = 'CoronaSpeed_Act' then CustomLineSeries.Source:=Series_CoronaSpeed_Act.Source;
  if Name_ = 'Corona_Act' then CustomLineSeries.Source:=Series_Corona_Act.Source;
  CustomLineSeries.Title:=Name_;
  CustomLineSeries.AxisIndexX:=-1;
  if Name_ = 'LineSpeed_Act' then CustomLineSeries.SeriesColor:=clRed;
  if Name_ = 'TakeOffRollSpeed_Act' then CustomLineSeries.SeriesColor:=clLime;
  if Name_ = 'GravureSpeed_Act' then CustomLineSeries.SeriesColor:=clBlue;
  if Name_ = 'CoronaSpeed_Act' then CustomLineSeries.SeriesColor:=clGreen;
  if Name_ = 'Corona_Act' then CustomLineSeries.SeriesColor:=clPurple;
  CustomLineSeries.AxisIndexY:=CustomAxis.Index;
  AChart.AddSeries(CustomLineSeries);

  AddAutoScaleToAxis(AChart,CustomAxis.Index);

  for i := 0 to  AChart.AxisList.Count-1 do
  begin
    if AChart.AxisList[i].Alignment=calLeft then  TotalLeftAxis:=TotalLeftAxis+1
  end;

  // Link series to the newly created right axis (assuming it's at index 2)

end;

procedure TFormChart.AddAutoScaleToAxis(AChart: TChart; AxisIndex: Integer);
var
  AxisTrans: TChartAxisTransformations;
  AutoScaleTrans: TAutoscaleAxisTransform;
begin
  if AxisIndex >= AChart.AxisList.Count then begin exit; end;
  if AChart.AxisList[AxisIndex].Transformations <> nil then begin exit; end;
  //if AChart.AxisList[AxisIndex].Transformations = nil then showmessage('no Transformations');

  AxisTrans := TChartAxisTransformations.Create(AChart);

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

procedure TFormChart.MenuClearClick(Sender: TObject);
var
  i:integer;
begin
  TotalBottomAxis:=0;
  TotalLeftAxis:=0;

  //showmessage(AChart.AxisList.Count.ToString);

  for i:=Chart1.Series.Count-1 downto 0 do
  begin
    TLineSeries(Chart1.Series[i]).Delete(i);
  end;

  for i := Chart1.AxisList.Count-1 downto 0 do
  begin
    //Chart1.AxisList[i].Transformations:=nil;
    Chart1.AxisList.Delete(i);
  end;

  Chart1.ClearSeries;

  //showmessage(AChart.AxisList.Count.ToString);
end;

procedure TFormChart.ChartToolset1AxisClickTool1AfterMouseWheelDown(
  ATool: TChartTool; APoint: TPoint);
begin
  //showmessage('WheelDown');
  if MouseWheel and (TotalLeftAxis>0) then
  begin
    //showmessage(TAutoscaleAxisTransform(Chart1.AxisList[ChartAxisIndex].Transformations.List[0]).MaxValue.ToString);
    if TAutoscaleAxisTransform(Chart1.AxisList[ChartAxisIndex].Transformations.List[0]).MaxValue<= 1 then exit;
    TAutoscaleAxisTransform(Chart1.AxisList[ChartAxisIndex].Transformations.List[0]).MaxValue:=TAutoscaleAxisTransform(Chart1.AxisList[ChartAxisIndex].Transformations.List[0]).MaxValue-1;
  end;
end;

procedure TFormChart.ChartToolset1AxisClickTool1AfterMouseWheelUp(
  ATool: TChartTool; APoint: TPoint);
begin
  //showmessage('WheelUp');
  if MouseWheel and (TotalLeftAxis>0) then
  begin
    //showmessage(TAutoscaleAxisTransform(Chart1.AxisList[ChartAxisIndex].Transformations.List[0]).MaxValue.ToString);
    if TAutoscaleAxisTransform(Chart1.AxisList[ChartAxisIndex].Transformations.List[0]).MaxValue >=1000 then exit;
    TAutoscaleAxisTransform(Chart1.AxisList[ChartAxisIndex].Transformations.List[0]).MaxValue:=TAutoscaleAxisTransform(Chart1.AxisList[ChartAxisIndex].Transformations.List[0]).MaxValue+1;
  end;
end;

procedure TFormChart.Chart1DragDrop(Sender, Source: TObject; X, Y: Integer);
var
  CustomAxis: TChartAxis;
  TextPosition: Integer;
begin

  if Source is TShape then
  begin
    //showmessage(TShape(Source).Name);
    exit;
  end;
  if Source is TImage then
  begin
    //showmessage(TImage(Source).Name);
    exit;
  end;
  if Source is THMIEdit then
  begin
    //showmessage(THMIEdit(Source).Name);
    exit;
  end;

  if Source is THMILabel then
  begin
    //showmessage(THMILabel(Source).Name);
    TextPosition := Pos('Corona_Act', THMILabel(Source).Name);
    if TextPosition > 0 then
    begin
      AddTChartAxis('Corona_Act',Chart1);
      exit;
    end;

    TextPosition := Pos('CoronaSpeed_Act', THMILabel(Source).Name);
    if TextPosition > 0 then
    begin
      AddTChartAxis('CoronaSpeed_Act',Chart1);
      exit;
    end;

    TextPosition := Pos('GravureSpeed_Act', THMILabel(Source).Name);
    if TextPosition > 0 then
    begin
      AddTChartAxis('GravureSpeed_Act',Chart1);
      exit;
    end;

    TextPosition := Pos('TakeOffRollSpeed_Act', THMILabel(Source).Name);
    if TextPosition > 0 then
    begin
      AddTChartAxis('TakeOffRollSpeed_Act',Chart1);
      exit;
    end;

    TextPosition := Pos('LineSpeed_Act', THMILabel(Source).Name);
    if TextPosition > 0 then
    begin
      AddTChartAxis('LineSpeed_Act',Chart1);
      exit;
    end;

  end;

  if Source is THMICheckBox then
  begin
    //showmessage(THMICheckBox(Source).Name);
    exit;
  end;
  if Source is Tlabel then
  begin
    //showmessage(Tlabel(Source).Name);
    exit;
  end;
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

