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
procedure IsTakeOffRollRun();
procedure IsTakeOffRollOff();
procedure IsGravureRollRun();
procedure IsGravureRollOff();
procedure IsCartridgeIn();
procedure IsCartridgeOut();
procedure IsGravureAutoMode();
procedure IsGravureManualMode();

implementation

uses Unit1, Unit2;

function CalculateTotal2(A, B: Integer): Integer;
begin
  Result := A + B;
end;

procedure IsCoatingMode();
begin
  if M[30]._0 then
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
  if M[30]._1 then
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
  if Q[0]._3 then
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
  if not Q[0]._3 then
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
  if Q[209]._0 then
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
  if not Q[209]._0 then
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
  if M[31]._0 then
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
  if not M[31]._0 then
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
  if Q[0]._1 then
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
  if not Q[0]._1 then
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
  if Q[0]._5 then
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
  if Q[0]._4 then
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

procedure IsTakeOffRollRun();
begin
  if Q[217]._0 then
  begin
    Unit1.Form1.CmdTakeOffRollRun.StateNormal.Background.Gradient1.StartColor:=clMoneyGreen;
    Unit1.Form1.CmdTakeOffRollRun.StateNormal.Background.Gradient1.EndColor:=clMoneyGreen;
    Unit1.Form1.CmdTakeOffRollRun.StateNormal.Background.Gradient2.StartColor:=clMoneyGreen;
    Unit1.Form1.CmdTakeOffRollRun.StateNormal.Background.Gradient2.EndColor:=clMoneyGreen;

    Unit1.Form1.CmdTakeOffRollRun.StateHover.Background.Gradient1.StartColor:=clGreen;
    Unit1.Form1.CmdTakeOffRollRun.StateHover.Background.Gradient1.EndColor:=clMoneyGreen;
    Unit1.Form1.CmdTakeOffRollRun.StateHover.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdTakeOffRollRun.StateHover.Background.Gradient2.EndColor:=clBlack;

    Unit1.Form1.CmdTakeOffRollRun.StateClicked.Background.Gradient1.StartColor:=clWhite;
    Unit1.Form1.CmdTakeOffRollRun.StateClicked.Background.Gradient1.EndColor:=clGreen;
    Unit1.Form1.CmdTakeOffRollRun.StateClicked.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdTakeOffRollRun.StateClicked.Background.Gradient2.EndColor:=clGreen;
  end
  else
  begin
    Unit1.Form1.CmdTakeOffRollRun.StateNormal.Background.Gradient1.StartColor:=clSkyBlue;
    Unit1.Form1.CmdTakeOffRollRun.StateNormal.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdTakeOffRollRun.StateNormal.Background.Gradient2.StartColor:=clSkyBlue;
    Unit1.Form1.CmdTakeOffRollRun.StateNormal.Background.Gradient2.EndColor:=clSkyBlue;

    Unit1.Form1.CmdTakeOffRollRun.StateHover.Background.Gradient1.StartColor:=clSkyBlue;
    Unit1.Form1.CmdTakeOffRollRun.StateHover.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdTakeOffRollRun.StateHover.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdTakeOffRollRun.StateHover.Background.Gradient2.EndColor:=clBlack;

    Unit1.Form1.CmdTakeOffRollRun.StateClicked.Background.Gradient1.StartColor:=clWhite;
    Unit1.Form1.CmdTakeOffRollRun.StateClicked.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdTakeOffRollRun.StateClicked.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdTakeOffRollRun.StateClicked.Background.Gradient2.EndColor:=clSkyBlue;
  end;
end;

procedure IsTakeOffRollOff();
begin
  if not Q[217]._0 then
  begin
    Unit1.Form1.CmdakeOffRollOff.StateNormal.Background.Gradient1.StartColor:=clMoneyGreen;
    Unit1.Form1.CmdakeOffRollOff.StateNormal.Background.Gradient1.EndColor:=clMoneyGreen;
    Unit1.Form1.CmdakeOffRollOff.StateNormal.Background.Gradient2.StartColor:=clMoneyGreen;
    Unit1.Form1.CmdakeOffRollOff.StateNormal.Background.Gradient2.EndColor:=clMoneyGreen;

    Unit1.Form1.CmdakeOffRollOff.StateHover.Background.Gradient1.StartColor:=clGreen;
    Unit1.Form1.CmdakeOffRollOff.StateHover.Background.Gradient1.EndColor:=clMoneyGreen;
    Unit1.Form1.CmdakeOffRollOff.StateHover.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdakeOffRollOff.StateHover.Background.Gradient2.EndColor:=clBlack;

    Unit1.Form1.CmdakeOffRollOff.StateClicked.Background.Gradient1.StartColor:=clWhite;
    Unit1.Form1.CmdakeOffRollOff.StateClicked.Background.Gradient1.EndColor:=clGreen;
    Unit1.Form1.CmdakeOffRollOff.StateClicked.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdakeOffRollOff.StateClicked.Background.Gradient2.EndColor:=clGreen;
  end
  else
  begin
    Unit1.Form1.CmdakeOffRollOff.StateNormal.Background.Gradient1.StartColor:=clSkyBlue;
    Unit1.Form1.CmdakeOffRollOff.StateNormal.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdakeOffRollOff.StateNormal.Background.Gradient2.StartColor:=clSkyBlue;
    Unit1.Form1.CmdakeOffRollOff.StateNormal.Background.Gradient2.EndColor:=clSkyBlue;

    Unit1.Form1.CmdakeOffRollOff.StateHover.Background.Gradient1.StartColor:=clSkyBlue;
    Unit1.Form1.CmdakeOffRollOff.StateHover.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdakeOffRollOff.StateHover.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdakeOffRollOff.StateHover.Background.Gradient2.EndColor:=clBlack;

    Unit1.Form1.CmdakeOffRollOff.StateClicked.Background.Gradient1.StartColor:=clWhite;
    Unit1.Form1.CmdakeOffRollOff.StateClicked.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdakeOffRollOff.StateClicked.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdakeOffRollOff.StateClicked.Background.Gradient2.EndColor:=clSkyBlue;
  end;
end;

procedure IsGravureRollRun();
begin
  if Q[213]._0 then
  begin
    Unit1.Form1.CmdGravureRollRun.StateNormal.Background.Gradient1.StartColor:=clMoneyGreen;
    Unit1.Form1.CmdGravureRollRun.StateNormal.Background.Gradient1.EndColor:=clMoneyGreen;
    Unit1.Form1.CmdGravureRollRun.StateNormal.Background.Gradient2.StartColor:=clMoneyGreen;
    Unit1.Form1.CmdGravureRollRun.StateNormal.Background.Gradient2.EndColor:=clMoneyGreen;

    Unit1.Form1.CmdGravureRollRun.StateHover.Background.Gradient1.StartColor:=clGreen;
    Unit1.Form1.CmdGravureRollRun.StateHover.Background.Gradient1.EndColor:=clMoneyGreen;
    Unit1.Form1.CmdGravureRollRun.StateHover.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdGravureRollRun.StateHover.Background.Gradient2.EndColor:=clBlack;

    Unit1.Form1.CmdGravureRollRun.StateClicked.Background.Gradient1.StartColor:=clWhite;
    Unit1.Form1.CmdGravureRollRun.StateClicked.Background.Gradient1.EndColor:=clGreen;
    Unit1.Form1.CmdGravureRollRun.StateClicked.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdGravureRollRun.StateClicked.Background.Gradient2.EndColor:=clGreen;
  end
  else
  begin
    Unit1.Form1.CmdGravureRollRun.StateNormal.Background.Gradient1.StartColor:=clSkyBlue;
    Unit1.Form1.CmdGravureRollRun.StateNormal.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdGravureRollRun.StateNormal.Background.Gradient2.StartColor:=clSkyBlue;
    Unit1.Form1.CmdGravureRollRun.StateNormal.Background.Gradient2.EndColor:=clSkyBlue;

    Unit1.Form1.CmdGravureRollRun.StateHover.Background.Gradient1.StartColor:=clSkyBlue;
    Unit1.Form1.CmdGravureRollRun.StateHover.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdGravureRollRun.StateHover.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdGravureRollRun.StateHover.Background.Gradient2.EndColor:=clBlack;

    Unit1.Form1.CmdGravureRollRun.StateClicked.Background.Gradient1.StartColor:=clWhite;
    Unit1.Form1.CmdGravureRollRun.StateClicked.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdGravureRollRun.StateClicked.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdGravureRollRun.StateClicked.Background.Gradient2.EndColor:=clSkyBlue;
  end;
end;

procedure IsGravureRollOff();
begin
  if not Q[213]._0 then
  begin
    Unit1.Form1.CmdGravureRollOff.StateNormal.Background.Gradient1.StartColor:=clMoneyGreen;
    Unit1.Form1.CmdGravureRollOff.StateNormal.Background.Gradient1.EndColor:=clMoneyGreen;
    Unit1.Form1.CmdGravureRollOff.StateNormal.Background.Gradient2.StartColor:=clMoneyGreen;
    Unit1.Form1.CmdGravureRollOff.StateNormal.Background.Gradient2.EndColor:=clMoneyGreen;

    Unit1.Form1.CmdGravureRollOff.StateHover.Background.Gradient1.StartColor:=clGreen;
    Unit1.Form1.CmdGravureRollOff.StateHover.Background.Gradient1.EndColor:=clMoneyGreen;
    Unit1.Form1.CmdGravureRollOff.StateHover.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdGravureRollOff.StateHover.Background.Gradient2.EndColor:=clBlack;

    Unit1.Form1.CmdGravureRollOff.StateClicked.Background.Gradient1.StartColor:=clWhite;
    Unit1.Form1.CmdGravureRollOff.StateClicked.Background.Gradient1.EndColor:=clGreen;
    Unit1.Form1.CmdGravureRollOff.StateClicked.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdGravureRollOff.StateClicked.Background.Gradient2.EndColor:=clGreen;
  end
  else
  begin
    Unit1.Form1.CmdGravureRollOff.StateNormal.Background.Gradient1.StartColor:=clSkyBlue;
    Unit1.Form1.CmdGravureRollOff.StateNormal.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdGravureRollOff.StateNormal.Background.Gradient2.StartColor:=clSkyBlue;
    Unit1.Form1.CmdGravureRollOff.StateNormal.Background.Gradient2.EndColor:=clSkyBlue;

    Unit1.Form1.CmdGravureRollOff.StateHover.Background.Gradient1.StartColor:=clSkyBlue;
    Unit1.Form1.CmdGravureRollOff.StateHover.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdGravureRollOff.StateHover.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdGravureRollOff.StateHover.Background.Gradient2.EndColor:=clBlack;

    Unit1.Form1.CmdGravureRollOff.StateClicked.Background.Gradient1.StartColor:=clWhite;
    Unit1.Form1.CmdGravureRollOff.StateClicked.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdGravureRollOff.StateClicked.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdGravureRollOff.StateClicked.Background.Gradient2.EndColor:=clSkyBlue;
  end;
end;

procedure IsCartridgeIn();
begin
  if Q[0]._2 then
  begin
    Unit1.Form1.CmdCartridgeIn.StateNormal.Background.Gradient1.StartColor:=clMoneyGreen;
    Unit1.Form1.CmdCartridgeIn.StateNormal.Background.Gradient1.EndColor:=clMoneyGreen;
    Unit1.Form1.CmdCartridgeIn.StateNormal.Background.Gradient2.StartColor:=clMoneyGreen;
    Unit1.Form1.CmdCartridgeIn.StateNormal.Background.Gradient2.EndColor:=clMoneyGreen;

    Unit1.Form1.CmdCartridgeIn.StateHover.Background.Gradient1.StartColor:=clGreen;
    Unit1.Form1.CmdCartridgeIn.StateHover.Background.Gradient1.EndColor:=clMoneyGreen;
    Unit1.Form1.CmdCartridgeIn.StateHover.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdCartridgeIn.StateHover.Background.Gradient2.EndColor:=clBlack;

    Unit1.Form1.CmdCartridgeIn.StateClicked.Background.Gradient1.StartColor:=clWhite;
    Unit1.Form1.CmdCartridgeIn.StateClicked.Background.Gradient1.EndColor:=clGreen;
    Unit1.Form1.CmdCartridgeIn.StateClicked.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdCartridgeIn.StateClicked.Background.Gradient2.EndColor:=clGreen;
  end
  else
  begin
    Unit1.Form1.CmdCartridgeIn.StateNormal.Background.Gradient1.StartColor:=clSkyBlue;
    Unit1.Form1.CmdCartridgeIn.StateNormal.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdCartridgeIn.StateNormal.Background.Gradient2.StartColor:=clSkyBlue;
    Unit1.Form1.CmdCartridgeIn.StateNormal.Background.Gradient2.EndColor:=clSkyBlue;

    Unit1.Form1.CmdCartridgeIn.StateHover.Background.Gradient1.StartColor:=clSkyBlue;
    Unit1.Form1.CmdCartridgeIn.StateHover.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdCartridgeIn.StateHover.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdCartridgeIn.StateHover.Background.Gradient2.EndColor:=clBlack;

    Unit1.Form1.CmdCartridgeIn.StateClicked.Background.Gradient1.StartColor:=clWhite;
    Unit1.Form1.CmdCartridgeIn.StateClicked.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdCartridgeIn.StateClicked.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdCartridgeIn.StateClicked.Background.Gradient2.EndColor:=clSkyBlue;
  end;
end;

procedure IsCartridgeOut();
begin
  if not Q[0]._2 then
  begin
    Unit1.Form1.CmdCartridgeOut.StateNormal.Background.Gradient1.StartColor:=clMoneyGreen;
    Unit1.Form1.CmdCartridgeOut.StateNormal.Background.Gradient1.EndColor:=clMoneyGreen;
    Unit1.Form1.CmdCartridgeOut.StateNormal.Background.Gradient2.StartColor:=clMoneyGreen;
    Unit1.Form1.CmdCartridgeOut.StateNormal.Background.Gradient2.EndColor:=clMoneyGreen;

    Unit1.Form1.CmdCartridgeOut.StateHover.Background.Gradient1.StartColor:=clGreen;
    Unit1.Form1.CmdCartridgeOut.StateHover.Background.Gradient1.EndColor:=clMoneyGreen;
    Unit1.Form1.CmdCartridgeOut.StateHover.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdCartridgeOut.StateHover.Background.Gradient2.EndColor:=clBlack;

    Unit1.Form1.CmdCartridgeOut.StateClicked.Background.Gradient1.StartColor:=clWhite;
    Unit1.Form1.CmdCartridgeOut.StateClicked.Background.Gradient1.EndColor:=clGreen;
    Unit1.Form1.CmdCartridgeOut.StateClicked.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdCartridgeOut.StateClicked.Background.Gradient2.EndColor:=clGreen;
  end
  else
  begin
    Unit1.Form1.CmdCartridgeOut.StateNormal.Background.Gradient1.StartColor:=clSkyBlue;
    Unit1.Form1.CmdCartridgeOut.StateNormal.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdCartridgeOut.StateNormal.Background.Gradient2.StartColor:=clSkyBlue;
    Unit1.Form1.CmdCartridgeOut.StateNormal.Background.Gradient2.EndColor:=clSkyBlue;

    Unit1.Form1.CmdCartridgeOut.StateHover.Background.Gradient1.StartColor:=clSkyBlue;
    Unit1.Form1.CmdCartridgeOut.StateHover.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdCartridgeOut.StateHover.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdCartridgeOut.StateHover.Background.Gradient2.EndColor:=clBlack;

    Unit1.Form1.CmdCartridgeOut.StateClicked.Background.Gradient1.StartColor:=clWhite;
    Unit1.Form1.CmdCartridgeOut.StateClicked.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdCartridgeOut.StateClicked.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdCartridgeOut.StateClicked.Background.Gradient2.EndColor:=clSkyBlue;
  end;
end;

procedure IsGravureAutoMode();
begin
  if M[20]._0 then
  begin
    Unit1.Form1.CmdGravureAuto.StateNormal.Background.Gradient1.StartColor:=clMoneyGreen;
    Unit1.Form1.CmdGravureAuto.StateNormal.Background.Gradient1.EndColor:=clMoneyGreen;
    Unit1.Form1.CmdGravureAuto.StateNormal.Background.Gradient2.StartColor:=clMoneyGreen;
    Unit1.Form1.CmdGravureAuto.StateNormal.Background.Gradient2.EndColor:=clMoneyGreen;

    Unit1.Form1.CmdGravureAuto.StateHover.Background.Gradient1.StartColor:=clGreen;
    Unit1.Form1.CmdGravureAuto.StateHover.Background.Gradient1.EndColor:=clMoneyGreen;
    Unit1.Form1.CmdGravureAuto.StateHover.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdGravureAuto.StateHover.Background.Gradient2.EndColor:=clBlack;

    Unit1.Form1.CmdGravureAuto.StateClicked.Background.Gradient1.StartColor:=clWhite;
    Unit1.Form1.CmdGravureAuto.StateClicked.Background.Gradient1.EndColor:=clGreen;
    Unit1.Form1.CmdGravureAuto.StateClicked.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdGravureAuto.StateClicked.Background.Gradient2.EndColor:=clGreen;
  end
  else
  begin
    Unit1.Form1.CmdGravureAuto.StateNormal.Background.Gradient1.StartColor:=clSkyBlue;
    Unit1.Form1.CmdGravureAuto.StateNormal.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdGravureAuto.StateNormal.Background.Gradient2.StartColor:=clSkyBlue;
    Unit1.Form1.CmdGravureAuto.StateNormal.Background.Gradient2.EndColor:=clSkyBlue;

    Unit1.Form1.CmdGravureAuto.StateHover.Background.Gradient1.StartColor:=clSkyBlue;
    Unit1.Form1.CmdGravureAuto.StateHover.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdGravureAuto.StateHover.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdGravureAuto.StateHover.Background.Gradient2.EndColor:=clBlack;

    Unit1.Form1.CmdGravureAuto.StateClicked.Background.Gradient1.StartColor:=clWhite;
    Unit1.Form1.CmdGravureAuto.StateClicked.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdGravureAuto.StateClicked.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdGravureAuto.StateClicked.Background.Gradient2.EndColor:=clSkyBlue;
  end;
end;

procedure IsGravureManualMode();
begin
  if M[20]._1 then
  begin
    Unit1.Form1.CmdGravureManual.StateNormal.Background.Gradient1.StartColor:=clMoneyGreen;
    Unit1.Form1.CmdGravureManual.StateNormal.Background.Gradient1.EndColor:=clMoneyGreen;
    Unit1.Form1.CmdGravureManual.StateNormal.Background.Gradient2.StartColor:=clMoneyGreen;
    Unit1.Form1.CmdGravureManual.StateNormal.Background.Gradient2.EndColor:=clMoneyGreen;

    Unit1.Form1.CmdGravureManual.StateHover.Background.Gradient1.StartColor:=clGreen;
    Unit1.Form1.CmdGravureManual.StateHover.Background.Gradient1.EndColor:=clMoneyGreen;
    Unit1.Form1.CmdGravureManual.StateHover.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdGravureManual.StateHover.Background.Gradient2.EndColor:=clBlack;

    Unit1.Form1.CmdGravureManual.StateClicked.Background.Gradient1.StartColor:=clWhite;
    Unit1.Form1.CmdGravureManual.StateClicked.Background.Gradient1.EndColor:=clGreen;
    Unit1.Form1.CmdGravureManual.StateClicked.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdGravureManual.StateClicked.Background.Gradient2.EndColor:=clGreen;
  end
  else
  begin
    Unit1.Form1.CmdGravureManual.StateNormal.Background.Gradient1.StartColor:=clSkyBlue;
    Unit1.Form1.CmdGravureManual.StateNormal.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdGravureManual.StateNormal.Background.Gradient2.StartColor:=clSkyBlue;
    Unit1.Form1.CmdGravureManual.StateNormal.Background.Gradient2.EndColor:=clSkyBlue;

    Unit1.Form1.CmdGravureManual.StateHover.Background.Gradient1.StartColor:=clSkyBlue;
    Unit1.Form1.CmdGravureManual.StateHover.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdGravureManual.StateHover.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdGravureManual.StateHover.Background.Gradient2.EndColor:=clBlack;

    Unit1.Form1.CmdGravureManual.StateClicked.Background.Gradient1.StartColor:=clWhite;
    Unit1.Form1.CmdGravureManual.StateClicked.Background.Gradient1.EndColor:=clSkyBlue;
    Unit1.Form1.CmdGravureManual.StateClicked.Background.Gradient2.StartColor:=clWhite;
    Unit1.Form1.CmdGravureManual.StateClicked.Background.Gradient2.EndColor:=clSkyBlue;
  end;
end;

end.

