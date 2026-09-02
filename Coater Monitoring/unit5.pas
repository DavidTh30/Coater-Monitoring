unit Unit5;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Graphics, StdCtrls;

type
  Alarm_ = record
    Number: Integer;
    Name: String;
    Caption: String;
    DateTime_: String;
    IsReset: boolean;  //Already reset after active = 1
    IsActive: boolean; //Alarm, Warning   = 1
    Type_:integer;  //None, Alarm, Warning
    Color:TColor;
    Object_:string;
  end;

procedure InitAlarm();
procedure ScanAlarm();
procedure ResetAlarm();

var
  SimulateAlarm1:boolean;
  SimulateAlarm2:boolean;
  SimulateAlarm3:boolean;
  SimulateAlarm4:boolean;
  SimulateAlarm5:boolean;
  AlarmData : array[0..99] of Alarm_;
  CurrentAlarm : array[0..99] of Alarm_;
  ClearAlarmData: Alarm_;
  TotalAlarm:integer;


implementation

uses
  Unit1, Unit2;

procedure InitAlarm();
var
  i:integer;
  AlarmLabel:TLabel;
begin
  TotalAlarm:=0;
  SimulateAlarm1:=false;
  SimulateAlarm2:=false;
  SimulateAlarm3:=false;
  SimulateAlarm4:=false;
  SimulateAlarm5:=false;

  //Test create
  AlarmLabel:=TLabel.Create(Unit1.Form1.ScrollBox1);
  AlarmLabel.Name:='H'+FormatDateTime('ddmmyyyyhhnnss', Now)+TotalAlarm.ToString;
  AlarmLabel.Parent:=Unit1.Form1.ScrollBox1;
  AlarmLabel.Top:=0;
  AlarmLabel.Left:=0;
  AlarmLabel.AutoSize:=false;
  AlarmLabel.Height:=20;
  AlarmLabel.Width:=Unit1.Form1.ScrollBox1.Width;
  AlarmLabel.Caption:=AlarmLabel.Name;
  AlarmLabel.Font.Size:=11;
  AlarmLabel.Color:=clDefault;
  AlarmLabel.ParentColor:=true;
  AlarmLabel.Transparent:=true;
  AlarmLabel.Visible:=true;
  freeandnil(AlarmLabel);

  //Unit1.Form1.Alarm1.Caption:='';
  //Unit1.Form1.Alarm1.Color:=clDefault;
  //Unit1.Form1.Alarm1.ParentColor:=true;
  //Unit1.Form1.Alarm1.Transparent:=true;

  ClearAlarmData.Number:=0;
  ClearAlarmData.Name:='';
  ClearAlarmData.Caption:='';
  ClearAlarmData.DateTime_:='';
  ClearAlarmData.IsActive:=false;
  ClearAlarmData.IsReset:=false;
  ClearAlarmData.Type_:=0;
  ClearAlarmData.Color:=clDefault;
  ClearAlarmData.Object_:='';

  for i := 0 to 99 do
  begin
    AlarmData[i].Number:=0;
    AlarmData[i].Name:='';
    AlarmData[i].Caption:='';
    AlarmData[i].DateTime_:='';
    AlarmData[i].IsActive:=false;
    AlarmData[i].IsReset:=false;
    AlarmData[i].Type_:=0;
    AlarmData[i].Color:=clDefault;
    AlarmData[i].Object_:='';

    CurrentAlarm[i].Number:=0;
    CurrentAlarm[i].Name:='';
    CurrentAlarm[i].Caption:='';
    CurrentAlarm[i].DateTime_:='';
    CurrentAlarm[i].IsActive:=false;
    CurrentAlarm[i].IsReset:=false;
    CurrentAlarm[i].Type_:=0;
    CurrentAlarm[i].Color:=clDefault;
    CurrentAlarm[i].Object_:='';
  end;

  i:=6;
  AlarmData[i].Number:=6;
  AlarmData[i].Name:='Emergency Stop';
  AlarmData[i].Caption:='';
  AlarmData[i].DateTime_:='';
  AlarmData[i].IsActive:=false;
  AlarmData[i].IsReset:=false;
  AlarmData[i].Type_:=1;
  AlarmData[i].Color:=clRed;

  i:=12;
  AlarmData[i].Number:=12;
  AlarmData[i].Name:='Infeed unit fault';
  AlarmData[i].Caption:='';
  AlarmData[i].DateTime_:='';
  AlarmData[i].IsActive:=false;
  AlarmData[i].IsReset:=false;
  AlarmData[i].Type_:=1;
  AlarmData[i].Color:=clRed;

  i:=i+1;
  AlarmData[i].Number:=13;
  AlarmData[i].Name:='Corona roll drive fault';
  AlarmData[i].Caption:='';
  AlarmData[i].DateTime_:='';
  AlarmData[i].IsActive:=false;
  AlarmData[i].IsReset:=false;
  AlarmData[i].Type_:=1;
  AlarmData[i].Color:=clRed;

  i:=i+1;
  AlarmData[i].Number:=14;
  AlarmData[i].Name:='Gravure roll drive fault';
  AlarmData[i].Caption:='';
  AlarmData[i].DateTime_:='';
  AlarmData[i].IsActive:=false;
  AlarmData[i].IsReset:=false;
  AlarmData[i].Type_:=1;
  AlarmData[i].Color:=clRed;

  i:=i+1;
  AlarmData[i].Number:=15;
  AlarmData[i].Name:='Takeoff roll drive fault';
  AlarmData[i].Caption:='';
  AlarmData[i].DateTime_:='';
  AlarmData[i].IsActive:=false;
  AlarmData[i].IsReset:=false;
  AlarmData[i].Type_:=1;
  AlarmData[i].Color:=clRed;

  i:=i+1;
  AlarmData[i].Number:=16;
  AlarmData[i].Name:='Sinamics CU fault';
  AlarmData[i].Caption:='';
  AlarmData[i].DateTime_:='';
  AlarmData[i].IsActive:=false;
  AlarmData[i].IsReset:=false;
  AlarmData[i].Type_:=1;
  AlarmData[i].Color:=clRed;

  i:=i+1;
  AlarmData[i].Number:=17;
  AlarmData[i].Name:='Flow low level';
  AlarmData[i].Caption:='';
  AlarmData[i].DateTime_:='';
  AlarmData[i].IsActive:=false;
  AlarmData[i].IsReset:=false;
  AlarmData[i].Type_:=1;
  AlarmData[i].Color:=clRed;

end;

procedure ScanAlarm();
var
  i:integer;
  AddAlarm:boolean;
  AlarmLabel:TLabel;
begin

  AddAlarm:=false;

  if ((I_[201]._1) or SimulateAlarm1) and (not AlarmData[12].IsActive) then
  begin
    for i:=0 to 99 do
    begin
      if (not CurrentAlarm[i].IsActive) then
      begin
        AlarmData[12].IsActive:=true;
        CurrentAlarm[i]:=AlarmData[12];
        CurrentAlarm[i].DateTime_:=FormatDateTime('dd/mm/yyyy hh:nn:ss', Now);
        AddAlarm:=true;
        break;
      end;
    end;
  end;

  if ((I_[209]._1) or SimulateAlarm2) and (not AlarmData[13].IsActive) then
  begin
    for i:=0 to 99 do
    begin
      if (not CurrentAlarm[i].IsActive) then
      begin
        AlarmData[13].IsActive:=true;
        CurrentAlarm[i]:=AlarmData[13];
        CurrentAlarm[i].DateTime_:=FormatDateTime('dd/mm/yyyy hh:nn:ss', Now);
        AddAlarm:=true;
        break;
      end;
    end;
  end;

  if ((I_[213]._1) or SimulateAlarm3) and (not AlarmData[14].IsActive) then
  begin
    for i:=0 to 99 do
    begin
      if (not CurrentAlarm[i].IsActive) then
      begin
        AlarmData[14].IsActive:=true;
        CurrentAlarm[i]:=AlarmData[14];
        CurrentAlarm[i].DateTime_:=FormatDateTime('dd/mm/yyyy hh:nn:ss', Now);
        AddAlarm:=true;
        break;
      end;
    end;
  end;

  if ((I_[217]._1) or SimulateAlarm4) and (not AlarmData[15].IsActive) then
  begin
    for i:=0 to 99 do
    begin
      if (not CurrentAlarm[i].IsActive) then
      begin
        AlarmData[15].IsActive:=true;
        CurrentAlarm[i]:=AlarmData[15];
        CurrentAlarm[i].DateTime_:=FormatDateTime('dd/mm/yyyy hh:nn:ss', Now);
        AddAlarm:=true;
        break;
      end;
    end;
  end;

  if ((I_[221]._1) or SimulateAlarm5) and (not AlarmData[16].IsActive) then
  begin
    for i:=0 to 99 do
    begin
      if (not CurrentAlarm[i].IsActive) then
      begin
        AlarmData[16].IsActive:=true;
        CurrentAlarm[i]:=AlarmData[16];
        CurrentAlarm[i].DateTime_:=FormatDateTime('dd/mm/yyyy hh:nn:ss', Now);
        AddAlarm:=true;
        break;
      end;
    end;
  end;

  if (M[120]._1) and (not AlarmData[6].IsActive) then //M120.1  M120_1.Value
  begin
    for i:=0 to 99 do
    begin
      if (not CurrentAlarm[i].IsActive) then
      begin
        AlarmData[6].IsActive:=true;
        CurrentAlarm[i]:=AlarmData[6];
        CurrentAlarm[i].DateTime_:=FormatDateTime('dd/mm/yyyy hh:nn:ss', Now);
        AddAlarm:=true;
        break;
      end;
    end;
  end;

  if AddAlarm then
  begin

    for i:=99 downto 0  do
    if CurrentAlarm[i].IsActive and (CurrentAlarm[i].Object_='') then
    begin
      AlarmLabel:=TLabel.Create(Unit1.Form1.ScrollBox1);
      AlarmLabel.Name:='H'+FormatDateTime('ddmmyyyyhhnnss', Now)+TotalAlarm.ToString;
      CurrentAlarm[i].Object_:=AlarmLabel.Name;
      AlarmLabel.Parent:=Unit1.Form1.ScrollBox1;
      AlarmLabel.Top:=TotalAlarm*20;
      AlarmLabel.Left:=0;
      AlarmLabel.AutoSize:=false;
      AlarmLabel.Height:=20;
      AlarmLabel.Width:=Unit1.Form1.ScrollBox1.Width;
      AlarmLabel.Caption:=CurrentAlarm[i].DateTime_ + ' ' + CurrentAlarm[i].Name + ' ' + CurrentAlarm[i].Caption;
      AlarmLabel.Font.Size:=11;
      AlarmLabel.Color:=CurrentAlarm[i].Color;
      //AlarmLabel.ParentColor:=true;
      AlarmLabel.Transparent:=false;
      AlarmLabel.Visible:=true;
      AlarmLabel.OnClick:=@Unit1.Form1.AlarmClick;

      TotalAlarm:=TotalAlarm+1;
    end
    else
    begin
      //Unit1.Form1.Alarm1.Caption:='';
      //Unit1.Form1.Alarm1.Color:=clDefault;
      //Unit1.Form1.Alarm1.ParentColor:=true;
      //Unit1.Form1.Alarm1.Transparent:=true;
    end;

  end;



end;

procedure ResetAlarm();
var
  i:integer;
  RemoveAlarm:boolean;
  MyControl: TComponent;
  Loop_:boolean;
begin
  RemoveAlarm:=false;

  if (not I_[201]._1) and (AlarmData[12].IsActive) and (not SimulateAlarm1) then
  begin
    for i:=0 to 99 do
    begin
      if (CurrentAlarm[i].IsActive) and (CurrentAlarm[i].Number = AlarmData[12].Number) then
      begin
        TotalAlarm:=TotalAlarm-1;
        AlarmData[12].IsActive:=false;
        MyControl := Unit1.Form1.ScrollBox1.FindComponent(CurrentAlarm[i].Object_);
        if MyControl <> nil then FreeAndNil(MyControl);
        CurrentAlarm[i]:=ClearAlarmData;
        RemoveAlarm:=true;
        break;
      end;
    end;
  end;

  if (not I_[209]._1) and (AlarmData[13].IsActive) and (not SimulateAlarm2) then
  begin
    for i:=0 to 99 do
    begin
      if (CurrentAlarm[i].IsActive) and (CurrentAlarm[i].Number = AlarmData[13].Number) then
      begin
        TotalAlarm:=TotalAlarm-1;
        AlarmData[13].IsActive:=false;
        MyControl := Unit1.Form1.ScrollBox1.FindComponent(CurrentAlarm[i].Object_);
        if MyControl <> nil then  FreeAndNil(MyControl);
        CurrentAlarm[i]:=ClearAlarmData;
        RemoveAlarm:=true;
        break;
      end;
    end;
  end;

  if (not I_[213]._1) and (AlarmData[14].IsActive) and (not SimulateAlarm3) then
  begin
    for i:=0 to 99 do
    begin
      if (CurrentAlarm[i].IsActive) and (CurrentAlarm[i].Number = AlarmData[14].Number) then
      begin
        TotalAlarm:=TotalAlarm-1;
        AlarmData[14].IsActive:=false;
        MyControl := Unit1.Form1.ScrollBox1.FindComponent(CurrentAlarm[i].Object_);
        if MyControl <> nil then  FreeAndNil(MyControl);
        CurrentAlarm[i]:=ClearAlarmData;
        RemoveAlarm:=true;
        break;
      end;
    end;
  end;

  if (not I_[217]._1) and (AlarmData[15].IsActive) and (not SimulateAlarm4) then
  begin
    for i:=0 to 99 do
    begin
      if (CurrentAlarm[i].IsActive) and (CurrentAlarm[i].Number = AlarmData[15].Number) then
      begin
        TotalAlarm:=TotalAlarm-1;
        AlarmData[15].IsActive:=false;
        MyControl := Unit1.Form1.ScrollBox1.FindComponent(CurrentAlarm[i].Object_);
        if MyControl <> nil then  FreeAndNil(MyControl);
        CurrentAlarm[i]:=ClearAlarmData;
        RemoveAlarm:=true;
        break;
      end;
    end;
  end;

  if (Not I_[221]._1) and (AlarmData[16].IsActive) and (not SimulateAlarm5) then
  begin
    for i:=0 to 99 do
    begin
      if (CurrentAlarm[i].IsActive) and (CurrentAlarm[i].Number = AlarmData[16].Number) then
      begin
        TotalAlarm:=TotalAlarm-1;
        AlarmData[16].IsActive:=false;
        MyControl := Unit1.Form1.ScrollBox1.FindComponent(CurrentAlarm[i].Object_);
        if MyControl <> nil then  FreeAndNil(MyControl);
        CurrentAlarm[i]:=ClearAlarmData;
        RemoveAlarm:=true;
        break;
      end;
    end;
  end;

  if (Not M[120]._1) and (AlarmData[6].IsActive) then  //M120.1  M120_1.Value
  begin
    for i:=0 to 99 do
    begin
      if (CurrentAlarm[i].IsActive) and (CurrentAlarm[i].Number = AlarmData[6].Number) then
      begin
        TotalAlarm:=TotalAlarm-1;
        AlarmData[6].IsActive:=false;
        MyControl := Unit1.Form1.ScrollBox1.FindComponent(CurrentAlarm[i].Object_);
        if MyControl <> nil then  FreeAndNil(MyControl);
        CurrentAlarm[i]:=ClearAlarmData;
        RemoveAlarm:=true;
        break;
      end;
    end;
  end;

  if RemoveAlarm then
  begin

    Loop_:=True;
    while Loop_=true do
    begin
      Loop_:=false;
      for i:=1 to 99 do
      begin
        if (CurrentAlarm[i-1].Name='') and (CurrentAlarm[i].Name<>'') then
        begin
          CurrentAlarm[i-1]:=CurrentAlarm[i];
          CurrentAlarm[i]:=ClearAlarmData;
          Loop_:=True;
          //break;
        end;
      end;
    end;

    TotalAlarm:=0;
    for i:=99 downto 0 do
    begin
      if (CurrentAlarm[i].Object_<>'') then
      begin
        MyControl := Unit1.Form1.ScrollBox1.FindComponent(CurrentAlarm[i].Object_);
        if MyControl <> nil then
        begin
          TLabel(MyControl).Top:=TotalAlarm*20;
          TotalAlarm:=TotalAlarm+1;
        end;
      end;
    end;
  end;

end;

end.

