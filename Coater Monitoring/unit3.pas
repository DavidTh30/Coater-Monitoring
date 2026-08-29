unit Unit3;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Graphics;

function CalculateTotal2(A, B: Integer): Integer;
procedure IsCoatingMode();
procedure IsBypassMode();
procedure IsElectrodeIn();
procedure IsElectrodeOut();
procedure IsCoronaRollRun();
procedure IsCoronaRollOff();
procedure IsSystemOn();
procedure IsSystemOff();
procedure IsCoronaExhaustFanRun();
procedure IsCoronaExhaustFanOff();
procedure IsCoronaGeneratorOn();
procedure IsCoronaGeneratorOff();

implementation

uses Unit1, Unit2;

function CalculateTotal2(A, B: Integer): Integer;
begin
  Result := A + B;
end;

procedure IsCoatingMode();
begin
  if M30_0.Value > 0 then
  begin
    Unit1.Form1.CmdCoatingMode.StateNormal.Background.Gradient1.StartColor:=clMoneyGreen;
    Unit1.Form1.CmdCoatingMode.StateNormal.Background.Gradient1.EndColor:=clMoneyGreen;
    Unit1.Form1.CmdCoatingMode.StateNormal.Background.Gradient2.StartColor:=clMoneyGreen;
    Unit1.Form1.CmdCoatingMode.StateNormal.Background.Gradient2.EndColor:=clMoneyGreen;

    Unit1.Form1.CmdCoatingMode.StateHover.Background.Gradient1.StartColor:=clGreen;
    Unit1.Form1.CmdCoatingMode.StateHover.Background.Gradient1.EndColor:=clMoneyGreen;
    Unit1.Form1.CmdCoatingMode.StateHover.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdCoatingMode.StateHover.Background.Gradient2.EndColor:=clBlack;

    Unit1.Form1.CmdCoatingMode.StateClicked.Background.Gradient1.StartColor:=clWhite;
    Unit1.Form1.CmdCoatingMode.StateClicked.Background.Gradient1.EndColor:=clGreen;
    Unit1.Form1.CmdCoatingMode.StateClicked.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdCoatingMode.StateClicked.Background.Gradient2.EndColor:=clGreen;
  end
  else
  begin
    Unit1.Form1.CmdCoatingMode.StateNormal.Background.Gradient1.StartColor:=clSkyBlue;
    Unit1.Form1.CmdCoatingMode.StateNormal.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdCoatingMode.StateNormal.Background.Gradient2.StartColor:=clSkyBlue;
    Unit1.Form1.CmdCoatingMode.StateNormal.Background.Gradient2.EndColor:=clSkyBlue;

    Unit1.Form1.CmdCoatingMode.StateHover.Background.Gradient1.StartColor:=clSkyBlue;
    Unit1.Form1.CmdCoatingMode.StateHover.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdCoatingMode.StateHover.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdCoatingMode.StateHover.Background.Gradient2.EndColor:=clBlack;

    Unit1.Form1.CmdCoatingMode.StateClicked.Background.Gradient1.StartColor:=clWhite;
    Unit1.Form1.CmdCoatingMode.StateClicked.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdCoatingMode.StateClicked.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdCoatingMode.StateClicked.Background.Gradient2.EndColor:=clSkyBlue;
  end;
end;

procedure IsBypassMode();
begin
  if M30_1.Value > 0 then
  begin
    Unit1.Form1.CmdBypassMode.StateNormal.Background.Gradient1.StartColor:=clMoneyGreen;
    Unit1.Form1.CmdBypassMode.StateNormal.Background.Gradient1.EndColor:=clMoneyGreen;
    Unit1.Form1.CmdBypassMode.StateNormal.Background.Gradient2.StartColor:=clMoneyGreen;
    Unit1.Form1.CmdBypassMode.StateNormal.Background.Gradient2.EndColor:=clMoneyGreen;

    Unit1.Form1.CmdBypassMode.StateHover.Background.Gradient1.StartColor:=clGreen;
    Unit1.Form1.CmdBypassMode.StateHover.Background.Gradient1.EndColor:=clMoneyGreen;
    Unit1.Form1.CmdBypassMode.StateHover.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdBypassMode.StateHover.Background.Gradient2.EndColor:=clBlack;

    Unit1.Form1.CmdBypassMode.StateClicked.Background.Gradient1.StartColor:=clWhite;
    Unit1.Form1.CmdBypassMode.StateClicked.Background.Gradient1.EndColor:=clGreen;
    Unit1.Form1.CmdBypassMode.StateClicked.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdBypassMode.StateClicked.Background.Gradient2.EndColor:=clGreen;
  end
  else
  begin
    Unit1.Form1.CmdBypassMode.StateNormal.Background.Gradient1.StartColor:=clSkyBlue;
    Unit1.Form1.CmdBypassMode.StateNormal.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdBypassMode.StateNormal.Background.Gradient2.StartColor:=clSkyBlue;
    Unit1.Form1.CmdBypassMode.StateNormal.Background.Gradient2.EndColor:=clSkyBlue;

    Unit1.Form1.CmdBypassMode.StateHover.Background.Gradient1.StartColor:=clSkyBlue;
    Unit1.Form1.CmdBypassMode.StateHover.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdBypassMode.StateHover.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdBypassMode.StateHover.Background.Gradient2.EndColor:=clBlack;

    Unit1.Form1.CmdBypassMode.StateClicked.Background.Gradient1.StartColor:=clWhite;
    Unit1.Form1.CmdBypassMode.StateClicked.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdBypassMode.StateClicked.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdBypassMode.StateClicked.Background.Gradient2.EndColor:=clSkyBlue;
  end;
end;

procedure IsElectrodeIn();
begin
  if Q0_3.Value > 0 then
  begin
    Unit1.Form1.CmdElectrodeIn.StateNormal.Background.Gradient1.StartColor:=clMoneyGreen;
    Unit1.Form1.CmdElectrodeIn.StateNormal.Background.Gradient1.EndColor:=clMoneyGreen;
    Unit1.Form1.CmdElectrodeIn.StateNormal.Background.Gradient2.StartColor:=clMoneyGreen;
    Unit1.Form1.CmdElectrodeIn.StateNormal.Background.Gradient2.EndColor:=clMoneyGreen;

    Unit1.Form1.CmdElectrodeIn.StateHover.Background.Gradient1.StartColor:=clGreen;
    Unit1.Form1.CmdElectrodeIn.StateHover.Background.Gradient1.EndColor:=clMoneyGreen;
    Unit1.Form1.CmdElectrodeIn.StateHover.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdElectrodeIn.StateHover.Background.Gradient2.EndColor:=clBlack;

    Unit1.Form1.CmdElectrodeIn.StateClicked.Background.Gradient1.StartColor:=clWhite;
    Unit1.Form1.CmdElectrodeIn.StateClicked.Background.Gradient1.EndColor:=clGreen;
    Unit1.Form1.CmdElectrodeIn.StateClicked.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdElectrodeIn.StateClicked.Background.Gradient2.EndColor:=clGreen;
  end
  else
  begin
    Unit1.Form1.CmdElectrodeIn.StateNormal.Background.Gradient1.StartColor:=clSkyBlue;
    Unit1.Form1.CmdElectrodeIn.StateNormal.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdElectrodeIn.StateNormal.Background.Gradient2.StartColor:=clSkyBlue;
    Unit1.Form1.CmdElectrodeIn.StateNormal.Background.Gradient2.EndColor:=clSkyBlue;

    Unit1.Form1.CmdElectrodeIn.StateHover.Background.Gradient1.StartColor:=clSkyBlue;
    Unit1.Form1.CmdElectrodeIn.StateHover.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdElectrodeIn.StateHover.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdElectrodeIn.StateHover.Background.Gradient2.EndColor:=clBlack;

    Unit1.Form1.CmdElectrodeIn.StateClicked.Background.Gradient1.StartColor:=clWhite;
    Unit1.Form1.CmdElectrodeIn.StateClicked.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdElectrodeIn.StateClicked.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdElectrodeIn.StateClicked.Background.Gradient2.EndColor:=clSkyBlue;
  end;
end;

procedure IsElectrodeOut();
begin
  if Q0_3.Value < 1 then
  begin
    Unit1.Form1.CmdElectrodeOut.StateNormal.Background.Gradient1.StartColor:=clMoneyGreen;
    Unit1.Form1.CmdElectrodeOut.StateNormal.Background.Gradient1.EndColor:=clMoneyGreen;
    Unit1.Form1.CmdElectrodeOut.StateNormal.Background.Gradient2.StartColor:=clMoneyGreen;
    Unit1.Form1.CmdElectrodeOut.StateNormal.Background.Gradient2.EndColor:=clMoneyGreen;

    Unit1.Form1.CmdElectrodeOut.StateHover.Background.Gradient1.StartColor:=clGreen;
    Unit1.Form1.CmdElectrodeOut.StateHover.Background.Gradient1.EndColor:=clMoneyGreen;
    Unit1.Form1.CmdElectrodeOut.StateHover.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdElectrodeOut.StateHover.Background.Gradient2.EndColor:=clBlack;

    Unit1.Form1.CmdElectrodeOut.StateClicked.Background.Gradient1.StartColor:=clWhite;
    Unit1.Form1.CmdElectrodeOut.StateClicked.Background.Gradient1.EndColor:=clGreen;
    Unit1.Form1.CmdElectrodeOut.StateClicked.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdElectrodeOut.StateClicked.Background.Gradient2.EndColor:=clGreen;
  end
  else
  begin
    Unit1.Form1.CmdElectrodeOut.StateNormal.Background.Gradient1.StartColor:=clSkyBlue;
    Unit1.Form1.CmdElectrodeOut.StateNormal.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdElectrodeOut.StateNormal.Background.Gradient2.StartColor:=clSkyBlue;
    Unit1.Form1.CmdElectrodeOut.StateNormal.Background.Gradient2.EndColor:=clSkyBlue;

    Unit1.Form1.CmdElectrodeOut.StateHover.Background.Gradient1.StartColor:=clSkyBlue;
    Unit1.Form1.CmdElectrodeOut.StateHover.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdElectrodeOut.StateHover.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdElectrodeOut.StateHover.Background.Gradient2.EndColor:=clBlack;

    Unit1.Form1.CmdElectrodeOut.StateClicked.Background.Gradient1.StartColor:=clWhite;
    Unit1.Form1.CmdElectrodeOut.StateClicked.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdElectrodeOut.StateClicked.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdElectrodeOut.StateClicked.Background.Gradient2.EndColor:=clSkyBlue;
  end;
end;

procedure IsCoronaRollRun();
begin
  if Q209_0.Value > 0 then
  begin
    Unit1.Form1.CmdCoronaRollRun.StateNormal.Background.Gradient1.StartColor:=clMoneyGreen;
    Unit1.Form1.CmdCoronaRollRun.StateNormal.Background.Gradient1.EndColor:=clMoneyGreen;
    Unit1.Form1.CmdCoronaRollRun.StateNormal.Background.Gradient2.StartColor:=clMoneyGreen;
    Unit1.Form1.CmdCoronaRollRun.StateNormal.Background.Gradient2.EndColor:=clMoneyGreen;

    Unit1.Form1.CmdCoronaRollRun.StateHover.Background.Gradient1.StartColor:=clGreen;
    Unit1.Form1.CmdCoronaRollRun.StateHover.Background.Gradient1.EndColor:=clMoneyGreen;
    Unit1.Form1.CmdCoronaRollRun.StateHover.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdCoronaRollRun.StateHover.Background.Gradient2.EndColor:=clBlack;

    Unit1.Form1.CmdCoronaRollRun.StateClicked.Background.Gradient1.StartColor:=clWhite;
    Unit1.Form1.CmdCoronaRollRun.StateClicked.Background.Gradient1.EndColor:=clGreen;
    Unit1.Form1.CmdCoronaRollRun.StateClicked.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdCoronaRollRun.StateClicked.Background.Gradient2.EndColor:=clGreen;
  end
  else
  begin
    Unit1.Form1.CmdCoronaRollRun.StateNormal.Background.Gradient1.StartColor:=clSkyBlue;
    Unit1.Form1.CmdCoronaRollRun.StateNormal.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdCoronaRollRun.StateNormal.Background.Gradient2.StartColor:=clSkyBlue;
    Unit1.Form1.CmdCoronaRollRun.StateNormal.Background.Gradient2.EndColor:=clSkyBlue;

    Unit1.Form1.CmdCoronaRollRun.StateHover.Background.Gradient1.StartColor:=clSkyBlue;
    Unit1.Form1.CmdCoronaRollRun.StateHover.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdCoronaRollRun.StateHover.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdCoronaRollRun.StateHover.Background.Gradient2.EndColor:=clBlack;

    Unit1.Form1.CmdCoronaRollRun.StateClicked.Background.Gradient1.StartColor:=clWhite;
    Unit1.Form1.CmdCoronaRollRun.StateClicked.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdCoronaRollRun.StateClicked.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdCoronaRollRun.StateClicked.Background.Gradient2.EndColor:=clSkyBlue;
  end;
end;

procedure IsCoronaRollOff();
begin
  if Q209_0.Value < 1 then
  begin
    Unit1.Form1.CmdCoronaRollOff.StateNormal.Background.Gradient1.StartColor:=clMoneyGreen;
    Unit1.Form1.CmdCoronaRollOff.StateNormal.Background.Gradient1.EndColor:=clMoneyGreen;
    Unit1.Form1.CmdCoronaRollOff.StateNormal.Background.Gradient2.StartColor:=clMoneyGreen;
    Unit1.Form1.CmdCoronaRollOff.StateNormal.Background.Gradient2.EndColor:=clMoneyGreen;

    Unit1.Form1.CmdCoronaRollOff.StateHover.Background.Gradient1.StartColor:=clGreen;
    Unit1.Form1.CmdCoronaRollOff.StateHover.Background.Gradient1.EndColor:=clMoneyGreen;
    Unit1.Form1.CmdCoronaRollOff.StateHover.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdCoronaRollOff.StateHover.Background.Gradient2.EndColor:=clBlack;

    Unit1.Form1.CmdCoronaRollOff.StateClicked.Background.Gradient1.StartColor:=clWhite;
    Unit1.Form1.CmdCoronaRollOff.StateClicked.Background.Gradient1.EndColor:=clGreen;
    Unit1.Form1.CmdCoronaRollOff.StateClicked.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdCoronaRollOff.StateClicked.Background.Gradient2.EndColor:=clGreen;
  end
  else
  begin
    Unit1.Form1.CmdCoronaRollOff.StateNormal.Background.Gradient1.StartColor:=clSkyBlue;
    Unit1.Form1.CmdCoronaRollOff.StateNormal.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdCoronaRollOff.StateNormal.Background.Gradient2.StartColor:=clSkyBlue;
    Unit1.Form1.CmdCoronaRollOff.StateNormal.Background.Gradient2.EndColor:=clSkyBlue;

    Unit1.Form1.CmdCoronaRollOff.StateHover.Background.Gradient1.StartColor:=clSkyBlue;
    Unit1.Form1.CmdCoronaRollOff.StateHover.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdCoronaRollOff.StateHover.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdCoronaRollOff.StateHover.Background.Gradient2.EndColor:=clBlack;

    Unit1.Form1.CmdCoronaRollOff.StateClicked.Background.Gradient1.StartColor:=clWhite;
    Unit1.Form1.CmdCoronaRollOff.StateClicked.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdCoronaRollOff.StateClicked.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdCoronaRollOff.StateClicked.Background.Gradient2.EndColor:=clSkyBlue;
  end;
end;

procedure IsSystemOn();
begin
  if M31_0.Value > 0 then
  begin
    Unit1.Form1.CmdSystemOn.StateNormal.Background.Gradient1.StartColor:=clMoneyGreen;
    Unit1.Form1.CmdSystemOn.StateNormal.Background.Gradient1.EndColor:=clMoneyGreen;
    Unit1.Form1.CmdSystemOn.StateNormal.Background.Gradient2.StartColor:=clMoneyGreen;
    Unit1.Form1.CmdSystemOn.StateNormal.Background.Gradient2.EndColor:=clMoneyGreen;

    Unit1.Form1.CmdSystemOn.StateHover.Background.Gradient1.StartColor:=clGreen;
    Unit1.Form1.CmdSystemOn.StateHover.Background.Gradient1.EndColor:=clMoneyGreen;
    Unit1.Form1.CmdSystemOn.StateHover.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdSystemOn.StateHover.Background.Gradient2.EndColor:=clBlack;

    Unit1.Form1.CmdSystemOn.StateClicked.Background.Gradient1.StartColor:=clWhite;
    Unit1.Form1.CmdSystemOn.StateClicked.Background.Gradient1.EndColor:=clGreen;
    Unit1.Form1.CmdSystemOn.StateClicked.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdSystemOn.StateClicked.Background.Gradient2.EndColor:=clGreen;
  end
  else
  begin
    Unit1.Form1.CmdSystemOn.StateNormal.Background.Gradient1.StartColor:=clSkyBlue;
    Unit1.Form1.CmdSystemOn.StateNormal.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdSystemOn.StateNormal.Background.Gradient2.StartColor:=clSkyBlue;
    Unit1.Form1.CmdSystemOn.StateNormal.Background.Gradient2.EndColor:=clSkyBlue;

    Unit1.Form1.CmdSystemOn.StateHover.Background.Gradient1.StartColor:=clSkyBlue;
    Unit1.Form1.CmdSystemOn.StateHover.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdSystemOn.StateHover.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdSystemOn.StateHover.Background.Gradient2.EndColor:=clBlack;

    Unit1.Form1.CmdSystemOn.StateClicked.Background.Gradient1.StartColor:=clWhite;
    Unit1.Form1.CmdSystemOn.StateClicked.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdSystemOn.StateClicked.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdSystemOn.StateClicked.Background.Gradient2.EndColor:=clSkyBlue;
  end;
end;

procedure IsSystemOff();
begin
  if M31_0.Value < 1 then
  begin
    Unit1.Form1.CmdSystemOff.StateNormal.Background.Gradient1.StartColor:=$008080FF;
    Unit1.Form1.CmdSystemOff.StateNormal.Background.Gradient1.EndColor:=$008080FF;
    Unit1.Form1.CmdSystemOff.StateNormal.Background.Gradient2.StartColor:=$008080FF;
    Unit1.Form1.CmdSystemOff.StateNormal.Background.Gradient2.EndColor:=$008080FF;

    Unit1.Form1.CmdSystemOff.StateHover.Background.Gradient1.StartColor:=clRed;
    Unit1.Form1.CmdSystemOff.StateHover.Background.Gradient1.EndColor:=$008080FF;
    Unit1.Form1.CmdSystemOff.StateHover.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdSystemOff.StateHover.Background.Gradient2.EndColor:=clBlack;

    Unit1.Form1.CmdSystemOff.StateClicked.Background.Gradient1.StartColor:=clWhite;
    Unit1.Form1.CmdSystemOff.StateClicked.Background.Gradient1.EndColor:=clRed;
    Unit1.Form1.CmdSystemOff.StateClicked.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdSystemOff.StateClicked.Background.Gradient2.EndColor:=clRed;
  end
  else
  begin
    Unit1.Form1.CmdSystemOff.StateNormal.Background.Gradient1.StartColor:=clSkyBlue;
    Unit1.Form1.CmdSystemOff.StateNormal.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdSystemOff.StateNormal.Background.Gradient2.StartColor:=clSkyBlue;
    Unit1.Form1.CmdSystemOff.StateNormal.Background.Gradient2.EndColor:=clSkyBlue;

    Unit1.Form1.CmdSystemOff.StateHover.Background.Gradient1.StartColor:=clSkyBlue;
    Unit1.Form1.CmdSystemOff.StateHover.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdSystemOff.StateHover.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdSystemOff.StateHover.Background.Gradient2.EndColor:=clBlack;

    Unit1.Form1.CmdSystemOff.StateClicked.Background.Gradient1.StartColor:=clWhite;
    Unit1.Form1.CmdSystemOff.StateClicked.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdSystemOff.StateClicked.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdSystemOff.StateClicked.Background.Gradient2.EndColor:=clSkyBlue;
  end;
end;

procedure IsCoronaExhaustFanRun();
begin
  if Q0_1.Value > 0 then
  begin
    Unit1.Form1.CmdExhaustRun.StateNormal.Background.Gradient1.StartColor:=clMoneyGreen;
    Unit1.Form1.CmdExhaustRun.StateNormal.Background.Gradient1.EndColor:=clMoneyGreen;
    Unit1.Form1.CmdExhaustRun.StateNormal.Background.Gradient2.StartColor:=clMoneyGreen;
    Unit1.Form1.CmdExhaustRun.StateNormal.Background.Gradient2.EndColor:=clMoneyGreen;

    Unit1.Form1.CmdExhaustRun.StateHover.Background.Gradient1.StartColor:=clGreen;
    Unit1.Form1.CmdExhaustRun.StateHover.Background.Gradient1.EndColor:=clMoneyGreen;
    Unit1.Form1.CmdExhaustRun.StateHover.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdExhaustRun.StateHover.Background.Gradient2.EndColor:=clBlack;

    Unit1.Form1.CmdExhaustRun.StateClicked.Background.Gradient1.StartColor:=clWhite;
    Unit1.Form1.CmdExhaustRun.StateClicked.Background.Gradient1.EndColor:=clGreen;
    Unit1.Form1.CmdExhaustRun.StateClicked.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdExhaustRun.StateClicked.Background.Gradient2.EndColor:=clGreen;
  end
  else
  begin
    Unit1.Form1.CmdExhaustRun.StateNormal.Background.Gradient1.StartColor:=clSkyBlue;
    Unit1.Form1.CmdExhaustRun.StateNormal.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdExhaustRun.StateNormal.Background.Gradient2.StartColor:=clSkyBlue;
    Unit1.Form1.CmdExhaustRun.StateNormal.Background.Gradient2.EndColor:=clSkyBlue;

    Unit1.Form1.CmdExhaustRun.StateHover.Background.Gradient1.StartColor:=clSkyBlue;
    Unit1.Form1.CmdExhaustRun.StateHover.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdExhaustRun.StateHover.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdExhaustRun.StateHover.Background.Gradient2.EndColor:=clBlack;

    Unit1.Form1.CmdExhaustRun.StateClicked.Background.Gradient1.StartColor:=clWhite;
    Unit1.Form1.CmdExhaustRun.StateClicked.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdExhaustRun.StateClicked.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdExhaustRun.StateClicked.Background.Gradient2.EndColor:=clSkyBlue;
  end;
end;

procedure IsCoronaExhaustFanOff();
begin
  if Q0_1.Value < 1 then
  begin
    Unit1.Form1.CmdExhaustOff.StateNormal.Background.Gradient1.StartColor:=clMoneyGreen;
    Unit1.Form1.CmdExhaustOff.StateNormal.Background.Gradient1.EndColor:=clMoneyGreen;
    Unit1.Form1.CmdExhaustOff.StateNormal.Background.Gradient2.StartColor:=clMoneyGreen;
    Unit1.Form1.CmdExhaustOff.StateNormal.Background.Gradient2.EndColor:=clMoneyGreen;

    Unit1.Form1.CmdExhaustOff.StateHover.Background.Gradient1.StartColor:=clGreen;
    Unit1.Form1.CmdExhaustOff.StateHover.Background.Gradient1.EndColor:=clMoneyGreen;
    Unit1.Form1.CmdExhaustOff.StateHover.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdExhaustOff.StateHover.Background.Gradient2.EndColor:=clBlack;

    Unit1.Form1.CmdExhaustOff.StateClicked.Background.Gradient1.StartColor:=clWhite;
    Unit1.Form1.CmdExhaustOff.StateClicked.Background.Gradient1.EndColor:=clGreen;
    Unit1.Form1.CmdExhaustOff.StateClicked.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdExhaustOff.StateClicked.Background.Gradient2.EndColor:=clGreen;
  end
  else
  begin
    Unit1.Form1.CmdExhaustOff.StateNormal.Background.Gradient1.StartColor:=clSkyBlue;
    Unit1.Form1.CmdExhaustOff.StateNormal.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdExhaustOff.StateNormal.Background.Gradient2.StartColor:=clSkyBlue;
    Unit1.Form1.CmdExhaustOff.StateNormal.Background.Gradient2.EndColor:=clSkyBlue;

    Unit1.Form1.CmdExhaustOff.StateHover.Background.Gradient1.StartColor:=clSkyBlue;
    Unit1.Form1.CmdExhaustOff.StateHover.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdExhaustOff.StateHover.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdExhaustOff.StateHover.Background.Gradient2.EndColor:=clBlack;

    Unit1.Form1.CmdExhaustOff.StateClicked.Background.Gradient1.StartColor:=clWhite;
    Unit1.Form1.CmdExhaustOff.StateClicked.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdExhaustOff.StateClicked.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdExhaustOff.StateClicked.Background.Gradient2.EndColor:=clSkyBlue;
  end;
end;

procedure IsCoronaGeneratorOn();
begin
  if Q0_5.Value > 0 then
  begin
    Unit1.Form1.CmdGeneratorOn.StateNormal.Background.Gradient1.StartColor:=clMoneyGreen;
    Unit1.Form1.CmdGeneratorOn.StateNormal.Background.Gradient1.EndColor:=clMoneyGreen;
    Unit1.Form1.CmdGeneratorOn.StateNormal.Background.Gradient2.StartColor:=clMoneyGreen;
    Unit1.Form1.CmdGeneratorOn.StateNormal.Background.Gradient2.EndColor:=clMoneyGreen;

    Unit1.Form1.CmdGeneratorOn.StateHover.Background.Gradient1.StartColor:=clGreen;
    Unit1.Form1.CmdGeneratorOn.StateHover.Background.Gradient1.EndColor:=clMoneyGreen;
    Unit1.Form1.CmdGeneratorOn.StateHover.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdGeneratorOn.StateHover.Background.Gradient2.EndColor:=clBlack;

    Unit1.Form1.CmdGeneratorOn.StateClicked.Background.Gradient1.StartColor:=clWhite;
    Unit1.Form1.CmdGeneratorOn.StateClicked.Background.Gradient1.EndColor:=clGreen;
    Unit1.Form1.CmdGeneratorOn.StateClicked.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdGeneratorOn.StateClicked.Background.Gradient2.EndColor:=clGreen;
  end
  else
  begin
    Unit1.Form1.CmdGeneratorOn.StateNormal.Background.Gradient1.StartColor:=clSkyBlue;
    Unit1.Form1.CmdGeneratorOn.StateNormal.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdGeneratorOn.StateNormal.Background.Gradient2.StartColor:=clSkyBlue;
    Unit1.Form1.CmdGeneratorOn.StateNormal.Background.Gradient2.EndColor:=clSkyBlue;

    Unit1.Form1.CmdGeneratorOn.StateHover.Background.Gradient1.StartColor:=clSkyBlue;
    Unit1.Form1.CmdGeneratorOn.StateHover.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdGeneratorOn.StateHover.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdGeneratorOn.StateHover.Background.Gradient2.EndColor:=clBlack;

    Unit1.Form1.CmdGeneratorOn.StateClicked.Background.Gradient1.StartColor:=clWhite;
    Unit1.Form1.CmdGeneratorOn.StateClicked.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdGeneratorOn.StateClicked.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdGeneratorOn.StateClicked.Background.Gradient2.EndColor:=clSkyBlue;
  end;
end;

procedure IsCoronaGeneratorOff();
begin
  if Q0_4.Value < 1 then
  begin
    Unit1.Form1.CmdGeneratorOff.StateNormal.Background.Gradient1.StartColor:=clMoneyGreen;
    Unit1.Form1.CmdGeneratorOff.StateNormal.Background.Gradient1.EndColor:=clMoneyGreen;
    Unit1.Form1.CmdGeneratorOff.StateNormal.Background.Gradient2.StartColor:=clMoneyGreen;
    Unit1.Form1.CmdGeneratorOff.StateNormal.Background.Gradient2.EndColor:=clMoneyGreen;

    Unit1.Form1.CmdGeneratorOff.StateHover.Background.Gradient1.StartColor:=clGreen;
    Unit1.Form1.CmdGeneratorOff.StateHover.Background.Gradient1.EndColor:=clMoneyGreen;
    Unit1.Form1.CmdGeneratorOff.StateHover.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdGeneratorOff.StateHover.Background.Gradient2.EndColor:=clBlack;

    Unit1.Form1.CmdGeneratorOff.StateClicked.Background.Gradient1.StartColor:=clWhite;
    Unit1.Form1.CmdGeneratorOff.StateClicked.Background.Gradient1.EndColor:=clGreen;
    Unit1.Form1.CmdGeneratorOff.StateClicked.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdGeneratorOff.StateClicked.Background.Gradient2.EndColor:=clGreen;
  end
  else
  begin
    Unit1.Form1.CmdGeneratorOff.StateNormal.Background.Gradient1.StartColor:=clSkyBlue;
    Unit1.Form1.CmdGeneratorOff.StateNormal.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdGeneratorOff.StateNormal.Background.Gradient2.StartColor:=clSkyBlue;
    Unit1.Form1.CmdGeneratorOff.StateNormal.Background.Gradient2.EndColor:=clSkyBlue;

    Unit1.Form1.CmdGeneratorOff.StateHover.Background.Gradient1.StartColor:=clSkyBlue;
    Unit1.Form1.CmdGeneratorOff.StateHover.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdGeneratorOff.StateHover.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdGeneratorOff.StateHover.Background.Gradient2.EndColor:=clBlack;

    Unit1.Form1.CmdGeneratorOff.StateClicked.Background.Gradient1.StartColor:=clWhite;
    Unit1.Form1.CmdGeneratorOff.StateClicked.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdGeneratorOff.StateClicked.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdGeneratorOff.StateClicked.Background.Gradient2.EndColor:=clSkyBlue;
  end;
end;

end.

