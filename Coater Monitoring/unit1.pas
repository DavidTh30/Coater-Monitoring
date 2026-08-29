unit Unit1;

{$mode objfpc}{$H+}
//{$DEFINE DEBUG}
//{$IFDEF DEBUG}
//  SendDebug(message_);
//{$ENDIF}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, Menus,
  StdCtrls, ExtCtrls, SpinEx, tcp_udpport, ISOTCPDriver,
   HMIEdit, HMICheckBox, HMILabel, hmi_polyline, dbugintf,
  commtypes, TypInfo, StrUtils, Tag, BCSVGButton, BCButton, simpleipc;

function IsDebuggerPresent(): integer stdcall; external 'kernel32.dll';

type

  { TForm1 }

  TForm1 = class(TForm)
    AdditionalCoronaSpeed_Set02: THMIEdit;
    CoronaSetpoint: THMIEdit;
    CmdCoronaRollRun: TBCButton;
    CmdCoronaRollOff: TBCButton;
    CmdExhaustRun: TBCButton;
    CmdExhaustOff: TBCButton;
    CmdSystemOff: TBCButton;
    CmdCoatingMode: TBCButton;
    CmdBypassMode: TBCButton;
    CmdGeneratorOff: TBCButton;
    CmdSystemOn: TBCButton;
    CmdElectrodeIn: TBCButton;
    CmdElectrodeOut: TBCButton;
    BCSVGButton1: TBCSVGButton;
    CmdGeneratorOn: TBCButton;
    CoronaSpeed_Act02: THMILabel;
    CoronaWattDensityAct: THMILabel;




    EditPort: TSpinEditEx;
    FilmBypass: THMIPolyline;
    GroupBox1: TGroupBox;
    GroupBox10: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    BypassFilmbrake_Set: THMICheckBox;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    FilmCoater: THMIPolyline;
    HMIPolyline10: THMIPolyline;
    HMIPolyline11: THMIPolyline;
    HMIPolyline2: THMIPolyline;
    HMIPolyline3: THMIPolyline;
    HMIPolyline5: THMIPolyline;
    ImageList1: TImageList;
    Label4: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    LineSpeedUpper_Set: THMIEdit;
    AdditionalCoronaSpeed_Set: THMIEdit;
    CoronaSpeed_Act01: THMILabel;
    LineSpeed_Act01: THMILabel;

    ISOTCPDriver1: TISOTCPDriver;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label5: TLabel;
    Label50: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Corona_Act: THMILabel;
    MainMenu1: TMainMenu;
    MaskEditIP: TEdit;

    MenuIFile: TMenuItem;
    Menuexit: TMenuItem;
    MenuConnect: TMenuItem;
    Connect: TMenuItem;
    Disconnect: TMenuItem;
    MenuView: TMenuItem;
    MenuProductionView: TMenuItem;
    MenuMaintenanceView: TMenuItem;
    PageControl1: TPageControl;

    P1: TShape;
    Shape1: TShape;
    Shape10: TShape;
    Shape15: TShape;
    P2: TShape;
    P3: TShape;
    P4: TShape;
    P5: TShape;
    P6: TShape;
    Shape16: TShape;
    Shape17: TShape;
    Shape18: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    StatusBar1: TStatusBar;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TCP_UDPPort1: TTCP_UDPPort;
    Timer1: TTimer;
    procedure CmdCoronaRollOffClick(Sender: TObject);
    procedure CmdCoronaRollRunClick(Sender: TObject);
    procedure CmdCoronaRollRunMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CmdCoronaRollRunMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CmdCoronaRollOffMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CmdCoronaRollOffMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CmdExhaustRunClick(Sender: TObject);
    procedure CmdExhaustRunMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CmdExhaustRunMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CmdElectrodeInClick(Sender: TObject);
    procedure CmdExhaustOffClick(Sender: TObject);
    procedure CmdExhaustOffMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CmdExhaustOffMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CmdElectrodeOutClick(Sender: TObject);
    procedure CmdGeneratorOffButtonClick(Sender: TObject);
    procedure CmdGeneratorOffMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CmdGeneratorOffMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CmdGeneratorOnClick(Sender: TObject);
    procedure CmdGeneratorOnMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CmdGeneratorOnMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CmdSystemOffClick(Sender: TObject);
    procedure CmdSystemOnClick(Sender: TObject);
    procedure CmdCoatingModeClick(Sender: TObject);
    procedure CmdBypassModeClick(Sender: TObject);
    procedure CmdElectrodeInMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CmdElectrodeInMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CmdElectrodeOutMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CmdElectrodeOutMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ConnectClick(Sender: TObject);
    procedure DisconnectClick(Sender: TObject);
    procedure EditPortEditingDone(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure MaskEditIPEditingDone(Sender: TObject);
    procedure MenuexitClick(Sender: TObject);
    procedure MenuProductionViewClick(Sender: TObject);
    procedure MenuMaintenanceViewClick(Sender: TObject);
    procedure TCP_UDPPort1CommErrorReading(Error: TIOResult);
    procedure TCP_UDPPort1CommPortOpened(Sender: TObject);
    procedure TCP_UDPPort1CommPortOpenError(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private

  public
    procedure CommunicationNotActive;
    procedure CommunicationIsActive;
  end;

var
  Form1: TForm1;
  OldClock_Bool:boolean;
  Communication_Active:boolean;
  DebugIsActive:boolean;

implementation

uses Unit2, Unit3;

{$R *.lfm}

{ TForm1 }

function IsAppAlreadyRunning(const AppID: string): Boolean;
var
  Client: TSimpleIPCClient;
begin
  Result := False;
  Client := TSimpleIPCClient.Create(nil);
  try
    Client.ServerID := AppID;
    // Check if a server with this ID is listening
    if Client.ServerRunning then
      Result := True;
  finally
    Client.Free;
  end;
end;


procedure log(message_: string);
begin
if not DebugIsActive then exit;
{$IFOPT D+}
  SendDebug(message_);
{$ELSE}

{$ENDIF}
end;

Function RepairIPAddress(s: string):string;
var
  i:integer;
  k:integer;
  s2:string;
  c:integer;
  A_s: TStringArray;
begin

  //MaskEditIP.Text:=chr(ord('0'));
  //MaskEditIP.Text:=IntToStr(ord('9');

  s:=Trim(s);
  //s:=leftstr(s,15);

  s2:='';
  for i:=1 to length(s) do
  begin
    if (((ord(s[i]) >= 48) and (ord(s[i]) <= 57)) or (s[i] = '.')) then s2:=s2+s[i];
  end;
  s:=s2;

  if length(s) = 0 then s:=s+'0.0.0.0';

  if (s[1] = '.') then s:='0'+s;

  k:=0;
  for i:=1 to length(s) do
  begin
    if(s[i] = '.') then k:=k+1;
  end;
  if k=0 then s:=s+'.0.0.0';
  if k=1 then s:=s+'.0.0';
  if k=2 then s:=s+'.0';
  if s[length(s)]='.' then s:=s+'0';

  k:=0;
  c:=0;
  s2:='';
  for i:=1 to length(s) do
  begin
    if(s[i] = '.') then begin k:=k+1; c:=0; end;
    if (k>3) then
      begin
        s2:=s2;
      end
    else
      begin
        if not(s[i] = '.')then c:=c+1;
        if (c<=3) then s2:=s2+s[i];
      end;
  end;
  s:=s2;

  A_s:=SplitString(s,'.');

  k:=0;
  Try
    k:=StrToInt(A_s[0]);
  except
    On E : EConvertError do
      k:=0;
  end;
  if (k>255) then k:=255;
  if (k<0) then k:=0;
  s:=IntToStr(k);

  k:=0;
  Try
    k:=StrToInt(A_s[1]);
  except
    On E : EConvertError do
      k:=0;
  end;
  if (k>255) then k:=255;
  if (k<0) then k:=0;
  s:=s+'.'+IntToStr(k);

  k:=0;
  Try
    k:=StrToInt(A_s[2]);
  except
    On E : EConvertError do
      k:=0;
  end;
  if (k>255) then k:=255;
  if (k<0) then k:=0;
  s:=s+'.'+IntToStr(k);

  k:=0;
  Try
    k:=StrToInt(A_s[3]);
  except
    On E : EConvertError do
      k:=0;
  end;
  if (k>255) then k:=255;
  if (k<0) then k:=0;
  s:=s+'.'+IntToStr(k);

  result := s;
end;

procedure TForm1.CommunicationNotActive;
begin
  p1.Brush.Color:=clSilver;
  p2.Brush.Color:=clSilver;
  p3.Brush.Color:=clSilver;
  p4.Brush.Color:=clSilver;
  p5.Brush.Color:=clSilver;
  p6.Brush.Color:=clSilver;

  Label11.Color:=clSilver;
  Label12.Color:=clSilver;
  Label13.Color:=clSilver;
  Label14.Color:=clSilver;
  Label15.Color:=clSilver;
  Label16.Color:=clSilver;
  Label17.Color:=clSilver;
  Label19.Color:=clSilver;
  Label20.Color:=clSilver;
  Label21.Color:=clSilver;
  Label24.Color:=clSilver;
  Label25.Color:=clSilver;
  Label26.Color:=clSilver;
  Label28.Color:=clSilver;
  Label29.Color:=clSilver;
  Label30.Color:=clSilver;
  Label33.Color:=clSilver;
  Label35.Color:=clSilver;
  Label36.Color:=clSilver;
  Label37.Color:=clSilver;
  Label39.Color:=clSilver;
  Label41.Color:=clSilver;
  Label42.Color:=clSilver;
  Label43.Color:=clSilver;
  Label45.Color:=clSilver;
  Label46.Color:=clSilver;
  Label47.Color:=clSilver;
  Label49.Color:=clSilver;
  Label51.Color:=clSilver;
  Label52.Color:=clSilver;
  Label54.Color:=clSilver;
  Label56.Color:=clSilver;
  Label57.Color:=clSilver;
  Label64.Color:=clSilver;

  Shape9.Brush.Color:=clSilver;
  Shape10.Brush.Color:=clSilver;

  LineSpeedUpper_Set.Enabled:=false;
  BypassFilmbrake_Set.Enabled:=false;

  CmdCoatingMode.Enabled:=false;
  CmdBypassMode.Enabled:=false;

  CmdElectrodeIn.Enabled:=false;
  CmdElectrodeOut.Enabled:=false;

  CmdSystemOn.Enabled:=false;
  CmdSystemOff.Enabled:=false;

  CmdCoronaRollRun.Enabled:=false;
  CmdCoronaRollOff.Enabled:=false;

  CmdExhaustRun.Enabled:=false;
  CmdExhaustOff.Enabled:=false;

  CmdGeneratorOn.Enabled:=false;
  CmdGeneratorOff.Enabled:=false;

  AdditionalCoronaSpeed_Set.Enabled:=false;
  AdditionalCoronaSpeed_Set02.Enabled:=false;
  CoronaSetpoint.Enabled:=false;
  CoronaSpeed_Act02.Enabled:=false;
  CoronaSpeed_Act01.Enabled:=false;
end;

procedure TForm1.CommunicationIsActive;
begin
  if (p1.Brush.Color=clSilver) then
    begin
      p1.Brush.Color:=clWhite;
      p2.Brush.Color:=clWhite;
      p3.Brush.Color:=clWhite;
      p4.Brush.Color:=clWhite;
      p5.Brush.Color:=clWhite;
      p6.Brush.Color:=clWhite;
    end;

  LineSpeedUpper_Set.Enabled:=true;
  BypassFilmbrake_Set.Enabled:=true;

  CmdCoatingMode.Enabled:=true;
  CmdBypassMode.Enabled:=true;

  CmdElectrodeIn.Enabled:=true;
  CmdElectrodeOut.Enabled:=true;
  Label28.Color:=clWhite;

  CmdSystemOn.Enabled:=true;
  CmdSystemOff.Enabled:=true;

  Label29.Color:=clWhite;
  Label30.Color:=clWhite;
  Label45.Color:=clWhite;
  Label51.Color:=clWhite;
  Label57.Color:=clWhite;

  CmdCoronaRollRun.Enabled:=true;
  CmdCoronaRollOff.Enabled:=true;

  CmdExhaustRun.Enabled:=true;
  CmdExhaustOff.Enabled:=true;

  CmdGeneratorOn.Enabled:=true;
  CmdGeneratorOff.Enabled:=true;

  AdditionalCoronaSpeed_Set.Enabled:=true;
  AdditionalCoronaSpeed_Set02.Enabled:=true;
  CoronaSetpoint.Enabled:=true;

  CoronaSpeed_Act02.Enabled:=true;
  CoronaSpeed_Act01.Enabled:=true;
end;

procedure TForm1.MenuexitClick(Sender: TObject);
begin
  Close;
  //halt;
end;

procedure TForm1.MenuProductionViewClick(Sender: TObject);
begin
  ProductionView:=true;
  MenuMaintenanceView.ImageIndex:=9;
  MenuProductionView.ImageIndex:=7;
  Label16.Caption:='Generator On by production';
  Label9.Visible:=false;
  Label17.Caption:='Generator Off by production';
  Label18.Visible:=false;
  Label19.Caption:='Not Bypass Mode';
  Label10.Visible:=false;
  Label13.Caption:='E-Stop OK';
  Label24.Caption:='System On';
  Label7.Visible:=false;
  Label20.Caption:='Coating Mode';
  Label8.Visible:=false;
  Label14.Caption:='MDO Film Brake';
  Label15.Caption:='All zone TDO Film Break';
  Label21.Caption:='Bypass Filmbrake';
  Label23.Visible:=false;
  Label25.Caption:='Electrode In position';
  Label5.Visible:=false;
  Label11.Caption:='Blower Run';
  Label6.Visible:=false;
  Label12.Caption:='Corona Start';
  Label49.Caption:='Corona Roll On by production';
  Label50.Visible:=false;
  Label47.Caption:='Coating Mode';
  Label48.Visible:=false;
  Label46.Caption:='Corona Roll Run';
  Label26.Caption:='Electrode In by production';
  Label27.Visible:=false;
  Label33.Caption:='Electrode Out by production';
  Label34.Visible:=false;
  Label35.Caption:='E-Stop OK';
  Label36.Caption:='MDO Film Brake';
  Label37.Caption:='All zone TDO Film Break';
  Label39.Caption:='Bypass Filmbrake';
  Label40.Visible:=false;
  Label41.Caption:='LineSpeed Upper: '+DB10_DBD42.Value.ToString+' m/min';
  Label42.Caption:='Blower Run';
  Label44.Visible:=false;
  Label43.Caption:='Electrode In Position';
  Label52.Caption:='Exhaust Fan Run by production';
  Label53.Visible:=false;
  Label54.Caption:='Exhaust Fan Off by production';
  Label55.Visible:=false;
  Label56.Caption:='E-Stop OK';
  Label64.Caption:='Corona Exhaust Fan Run';
end;

procedure TForm1.MenuMaintenanceViewClick(Sender: TObject);
begin
  ProductionView:=false;
  MenuMaintenanceView.ImageIndex:=7;
  MenuProductionView.ImageIndex:=9;
  Label16.Caption:='GenOn_Hmi_Cmd (M0.6=1)';
  Label9.Visible:=true;
  Label17.Caption:='GenOff_Hmi_Cmd (M0.7=0)';
  Label18.Visible:=true;
  Label19.Caption:='Not Bypass Mode (M30.1=0)';
  Label10.Visible:=true;
  Label13.Caption:='E-Stop OK (I0.0=1)';
  Label24.Caption:='Infeed On (System On) (Q201.0=1)';
  Label7.Visible:=true;
  Label20.Caption:='Coating Mode (M30.0=1)';
  Label8.Visible:=true;
  Label14.Caption:='MDO Film Brake (I0.2=1)';
  Label15.Caption:='All zone TDO Film Break (I0.7=1)';
  Label21.Caption:='Bypass Filmbrake (M98.0=1)';
  Label23.Visible:=true;
  Label25.Caption:='Electrode In position (I0.5=1)';
  Label5.Visible:=true;
  Label11.Caption:='Blower Run (Q0.1=1)';
  Label6.Visible:=true;
  Label12.Caption:='Corona Start (Q0.5=1)';
  Label49.Caption:='Corona Roll On_Hmi_Cmd (M34.0=1)';
  Label50.Visible:=true;
  Label47.Caption:='Coating Mode (M30.0=1)';
  Label48.Visible:=true;
  Label46.Caption:='Corona Roll Run (Q209.0=1)';
  Label26.Caption:='Electrode In HMI Cmd (M2.0=1)';
  Label27.Visible:=true;
  Label33.Caption:='Electrode Out HMI Cmd (M2.1=0)';
  Label34.Visible:=true;
  Label35.Caption:='E-Stop OK (I0.0=1)';
  Label36.Caption:='MDO Film Brake (I0.2=1)';
  Label37.Caption:='All zone TDO Film Break (I0.7=1)';
  Label39.Caption:='Bypass Filmbrake (M98.0=1)';
  Label40.Visible:=true;
  Label41.Caption:='LineSpeed Upper: '+DB10_DBD42.Value.ToString+' (M17.0=1)';
  Label42.Caption:='Blower Run (Q0.1=1)';
  Label44.Visible:=true;
  Label43.Caption:='Electrode In (Q0.3=1)';
  Label52.Caption:='Exhaust Fan Run HMI Cmd (M22.0=1)';
  Label53.Visible:=true;
  Label54.Caption:='Exhaust Fan Off HMI Cmd (M22.1=0)';
  Label55.Visible:=true;
  Label56.Caption:='E-Stop OK (I0.0=1)';
  Label64.Caption:='Corona Exhaust Fan Run (Q0.1=1)';
end;

procedure TForm1.TCP_UDPPort1CommErrorReading(Error: TIOResult);
begin
  log({$I %LINE%}+' TCP_UDPPort1CommErrorReading Error: '+GetEnumName(TypeInfo(TIOResult), Ord(Error)));
  if GetEnumName(TypeInfo(TIOResult), Ord(Error)) = 'iorTimeOut' then
  begin
    //System connect erroe please code here
    Communication_Active:=false;
  end;
end;

procedure TForm1.TCP_UDPPort1CommPortOpened(Sender: TObject);
begin
  log({$I %LINE%}+' TCP_UDPPort1CommPortOpened');
  Timer1.Enabled:=true;
end;

procedure TForm1.TCP_UDPPort1CommPortOpenError(Sender: TObject);
begin
  log({$I %LINE%}+' TCP_UDPPort1CommPortOpenError');
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if OldClock_Bool <> round(M101_2.Value).ToBoolean then
  //if OldClock_Bool <> boolean(round(MB101.Value) and 3) then
  begin
    if not Communication_Active then
    begin
      CommunicationIsActive;
    end;

    if (p6.Brush.Color=clGreen) then p6.Brush.Color:=clWhite;
    if (p5.Brush.Color=clGreen) then begin p5.Brush.Color:=clWhite;  p6.Brush.Color:=clGreen; end;
    if (p4.Brush.Color=clGreen) then begin p4.Brush.Color:=clWhite;  p5.Brush.Color:=clGreen; end;
    if (p3.Brush.Color=clGreen) then begin p3.Brush.Color:=clWhite;  p4.Brush.Color:=clGreen; end;
    if (p2.Brush.Color=clGreen) then begin p2.Brush.Color:=clWhite;  p3.Brush.Color:=clGreen; end;
    if (p1.Brush.Color=clGreen) then begin p1.Brush.Color:=clWhite;  p2.Brush.Color:=clGreen; end;
    if (p6.Brush.Color=clWhite) and (p5.Brush.Color=clWhite) and (p4.Brush.Color=clWhite) and
       (p3.Brush.Color=clWhite) and (p2.Brush.Color=clWhite) and (p1.Brush.Color=clWhite) then
       p1.Brush.Color:=clGreen;

    //OldClock_Bool:=round(MB101_2.Value).ToBoolean;
    OldClock_Bool:=not OldClock_Bool;
    Communication_Active:=true;

    if Q0_1.Value > 0 then
    begin Label11.Color:=clMoneyGreen; Label42.Color:=clMoneyGreen; end
    else
    begin Label11.Color:=clWhite; Label42.Color:=clWhite; end;
    if Q0_3.Value > 0 then
    begin Label28.Caption:='Electrode: In'; Label43.Color:=clMoneyGreen; end
    else
    begin Label28.Caption:='Electrode: Out'; Label43.Color:=clWhite; end;
    if Q0_5.Value > 0 then
    begin Label12.Color:=clMoneyGreen; Label57.Caption:='Generator: On'; end
    else
    begin Label12.Color:=clWhite; Label57.Caption:='Generator: Off'; end;

    if Q201_0.Value > 0 then begin Label24.Color:=clMoneyGreen; end
    else begin Label24.Color:=clWhite; end;

    if Q209_0.Value > 0 then
    begin Label46.Color:=clMoneyGreen; Label45.Caption:='Corona Roll: Run'; end
    else
    begin Label46.Color:=clWhite; Label45.Caption:='Corona Roll: Off'; end;

    if I0_0.Value > 0 then
    begin Label13.Color:=clMoneyGreen; Label35.Color:=clMoneyGreen; Label56.Color:=clMoneyGreen; end
    else
    begin Label13.Color:=clWhite; Label35.Color:=clWhite; Label56.Color:=clWhite; end;
    if I0_2.Value > 0 then
    begin Label14.Color:=clMoneyGreen; Label36.Color:=clMoneyGreen; end
    else
    begin Label14.Color:=clWhite; Label36.Color:=clWhite; end;
    if I0_5.Value > 0 then begin Label25.Color:=clMoneyGreen; end
    else begin Label25.Color:=clWhite; end;
    if I0_7.Value > 0 then
    begin Label15.Color:=clMoneyGreen; Label37.Color:=clMoneyGreen; end
    else
    begin Label15.Color:=clWhite; Label37.Color:=clWhite; end;

    if M0_6.Value > 0 then begin Label16.Color:=clMoneyGreen; end
    else begin Label16.Color:=clWhite; end;
    if M0_7.Value > 0 then begin Label17.Color:=clWhite; end
    else begin Label17.Color:=clMoneyGreen; end;

    if M2_0.Value > 0 then begin Label26.Color:=clMoneyGreen; end
    else begin Label26.Color:=clWhite; end;
    if M2_1.Value > 0 then begin Label33.Color:=clWhite; end
    else begin Label33.Color:=clMoneyGreen; end;

    if M17_0.Value > 0 then begin Label41.Color:=clMoneyGreen; end
    else begin Label41.Color:=clWhite; end;

    if ProductionView then
      Label41.Caption:='LineSpeed Upper: '+DB10_DBD42.Value.ToString+' m/min'
    else
      Label41.Caption:='LineSpeed Upper: '+DB10_DBD42.Value.ToString+' (M17.0=1)';

    if M22_0.Value > 0 then begin Label52.Color:=clMoneyGreen; end
    else begin Label52.Color:=clWhite; end;
    if M22_1.Value < 1 then begin Label54.Color:=clMoneyGreen; end
    else begin Label54.Color:=clWhite; end;

    if M30_1.Value > 0 then begin Label19.Color:=clWhite; end
    else begin Label19.Color:=clMoneyGreen; end;
    if M30_0.Value > 0 then
    begin Label20.Color:=clMoneyGreen; Label47.Color:=clMoneyGreen; end
    else
    begin Label20.Color:=clWhite; Label47.Color:=clWhite; end;
    if M31_0.Value > 0 then begin Label29.Caption:='System: On'; end
    else begin Label29.Caption:='System: Off'; end;
    if M32_0.Value > 0 then begin Label30.Caption:='Mode: Coating'; end
    else begin Label30.Caption:='Mode: Bypass'; end;
    if M34_0.Value > 0 then begin Label49.Color:=clMoneyGreen; end
    else begin Label49.Color:=clWhite; end;

    if Q0_1.Value > 0 then
    begin Label64.Color:=clMoneyGreen; Label51.Caption:='Exhaust: Run'; end
    else
    begin Label64.Color:=clWhite; Label51.Caption:='Exhaust: Off'; end;

    IsCoatingMode();
    IsBypassMode();
    IsElectrodeIn();
    IsElectrodeOut();
    IsCoronaRollRun();
    IsCoronaRollOff();
    IsSystemOn();
    IsSystemOff();
    IsCoronaExhaustFanRun();
    IsCoronaExhaustFanOff();
    IsCoronaGeneratorOn();
    IsCoronaGeneratorOff();

    if M98_0.Value > 0 then
    begin Label21.Color:=clMoneyGreen; Label39.Color:=clMoneyGreen; end
    else
    begin Label21.Color:=clWhite; Label39.Color:=clWhite; end;

    if (M98_0.Value > 0) or ((I0_0.Value > 0) and (I0_7.Value > 0)) then
    begin Shape9.Brush.Color:=clMoneyGreen; Shape10.Brush.Color:=clMoneyGreen; end
    else
    begin Shape9.Brush.Color:=clWhite; Shape10.Brush.Color:=clWhite; end;

  end;

  if not Communication_Active then
  begin
    CommunicationNotActive;
  end;
end;

procedure TForm1.ConnectClick(Sender: TObject);
begin
  TCP_UDPPort1.Active:=true;
  Communication_Active:=false;
  MaskEditIP.Enabled:=false;
  EditPort.Enabled:=false;
end;

procedure TForm1.CmdCoatingModeClick(Sender: TObject);
begin
  M32_0.Value:=1;
end;

procedure TForm1.CmdSystemOnClick(Sender: TObject);
begin
  M31_0.Value:=1;
end;

procedure TForm1.CmdSystemOffClick(Sender: TObject);
begin
  M31_0.Value:=0;
end;

procedure TForm1.CmdCoronaRollRunMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  M34_0.Value:=1;
end;

procedure TForm1.CmdCoronaRollRunClick(Sender: TObject);
begin
  M34_0.Value:=0;
end;

procedure TForm1.CmdCoronaRollOffClick(Sender: TObject);
begin
  M34_0.Value:=0;
  M34_1.Value:=0;
end;

procedure TForm1.CmdCoronaRollRunMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  M34_0.Value:=0;
end;

procedure TForm1.CmdCoronaRollOffMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  M34_0.Value:=0;
  M34_1.Value:=1;
end;

procedure TForm1.CmdCoronaRollOffMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  M34_1.Value:=0;
end;

procedure TForm1.CmdExhaustRunClick(Sender: TObject);
begin
  M22_0.Value:=0;
end;

procedure TForm1.CmdExhaustRunMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  M22_0.Value:=1;
end;

procedure TForm1.CmdExhaustRunMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  M22_0.Value:=0;
end;

procedure TForm1.CmdElectrodeInClick(Sender: TObject);
begin
  M2_0.Value:=0;
end;

procedure TForm1.CmdExhaustOffClick(Sender: TObject);
begin
  M22_0.Value:=0;
  M22_1.Value:=0;
end;

procedure TForm1.CmdExhaustOffMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  M22_0.Value:=0;
  M22_1.Value:=1;
end;

procedure TForm1.CmdExhaustOffMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  M22_1.Value:=0;
end;

procedure TForm1.CmdElectrodeOutClick(Sender: TObject);
begin
  M2_0.Value:=0;
  M2_1.Value:=0;
end;

procedure TForm1.CmdGeneratorOffButtonClick(Sender: TObject);
begin
  M0_6.Value:=0;
  M0_7.Value:=0;
end;

procedure TForm1.CmdGeneratorOffMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  M0_7.Value:=1;
end;

procedure TForm1.CmdGeneratorOffMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  M0_7.Value:=0;
end;

procedure TForm1.CmdGeneratorOnClick(Sender: TObject);
begin
  M0_6.Value:=0;
end;

procedure TForm1.CmdGeneratorOnMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  M0_6.Value:=1;
end;

procedure TForm1.CmdGeneratorOnMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  M0_6.Value:=0;
end;

procedure TForm1.CmdBypassModeClick(Sender: TObject);
begin
  M32_0.Value:=0;
end;

procedure TForm1.CmdElectrodeInMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  M2_0.Value:=1;
end;

procedure TForm1.CmdElectrodeInMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  M2_0.Value:=0;
end;

procedure TForm1.CmdElectrodeOutMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  M2_0.Value:=0;
  M2_1.Value:=1;
end;

procedure TForm1.CmdElectrodeOutMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  M2_1.Value:=0;
end;

procedure TForm1.DisconnectClick(Sender: TObject);
begin
  Timer1.Enabled:=false;
  TCP_UDPPort1.Active:=false;
  Communication_Active:=false;
  CommunicationNotActive;
  MaskEditIP.Enabled:=true;
  EditPort.Enabled:=true;
end;

procedure TForm1.EditPortEditingDone(Sender: TObject);
var
  Active_:boolean;
begin
  Active_:=TCP_UDPPort1.Active;
  TCP_UDPPort1.Active:=false;
  TCP_UDPPort1.Port:=EditPort.Value;
  TCP_UDPPort1.Active:=Active_;
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  //Terminate object

  FreeAndNil_MB0();
  FreeAndNil_MB1();
  FreeAndNil_MB2();
  FreeAndNil_MB17();
  FreeAndNil_MB22();
  FreeAndNil_MB30();
  FreeAndNil_MB31();
  FreeAndNil_MB32();
  FreeAndNil_MB34();
  FreeAndNil_MB98();
  FreeAndNil_MB101();
  FreeAndNil_QB0();
  FreeAndNil_QB201();
  FreeAndNil_QB209();
  FreeAndNil_IB0();

  FreeAndNil_DBD();

end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  //Close all commucation first before terminate object

  timer1.Enabled:=false;
  TCP_UDPPort1.Active:=false; //Disconnect
  Communication_Active:=false;

  ISOTCPDriver1.ReadSomethingAlways:=false;
  ISOTCPDriver1.CommunicationPort:=nil;  //Unplug  TCP/UDP Port
end;

procedure TForm1.FormCreate(Sender: TObject);
//var
//  i:integer= 25;
begin
  ProductionView:=true;
  DebugIsActive:=false;
  {$IFOPT D+}
    try
      //if IsDebuggerPresent > 0 then
      //DebugIsActive:=true;
      DebugIsActive:=IsAppAlreadyRunning(dbugintf.DefaultDebugServer)
    except
      DebugIsActive:=false;
    end;
  {$ELSE}
    DebugIsActive:=false;
  {$ENDIF}
  //showmessage(dbugintf.DefaultDebugServer);
  //showmessage(dbugintf.DebugServerExe);
  //showmessage(DebugIsActive.ToInteger.ToString);

  CreateTag_MB0();
  CreateTag_MB1();
  CreateTag_MB2();
  CreateTag_MB17();
  CreateTag_MB22();
  CreateTag_MB30();
  CreateTag_MB31();
  CreateTag_MB32();
  CreateTag_MB34();
  CreateTag_MB98();
  CreateTag_MB101();
  CreateTag_QB0();
  CreateTag_QB201();
  CreateTag_QB209();
  CreateTag_IB0();
  CreateTag_DB9_DBD32();  //CoronaSpeed_Act
  CreateTag_DB9_DBD56();  //CoronaSetpoin
  CreateTag_DB9_DBD60();  //CoronaActual
  CreateTag_DB9_DBD64();  //CoronaWattDensityAct
  CreateTag_DB10_DBD4();  //LineSpeed_Act01
  CreateTag_DB10_DBD22(); //AdditionalCoronaSpeed_Set
  CreateTag_DB10_DBD42(); //LineSpeedUpper_Set

  //if boolean(i and 36) then
  //showmessage('25 and 26');
  //if boolean(i and 25) then
  //showmessage('25 and 25');

  P1.Parent:=StatusBar1;
  P2.Parent:=StatusBar1;
  P3.Parent:=StatusBar1;
  P4.Parent:=StatusBar1;
  P5.Parent:=StatusBar1;
  P6.Parent:=StatusBar1;

  CoronaSpeed_Act01.PLCTag:=DB9_DBD32;
  CoronaSpeed_Act02.PLCTag:=DB9_DBD32;
  Corona_Act.PLCTag:=DB9_DBD60;
  CoronaSetpoint.PLCTag:=DB9_DBD56;
  CoronaWattDensityAct.PLCTag:=DB9_DBD64;
  LineSpeed_Act01.PLCTag:=DB10_DBD4;
  AdditionalCoronaSpeed_Set.PLCTag:=DB10_DBD22;
  AdditionalCoronaSpeed_Set02.PLCTag:=DB10_DBD22;
  LineSpeedUpper_Set.PLCTag:=DB10_DBD42;
  BypassFilmbrake_Set.PLCTag:=M98_0;
  if ProductionView then
      Label41.Caption:='LineSpeed Upper: '+DB10_DBD42.Value.ToString+' m/min'
    else
      Label41.Caption:='LineSpeed Upper: '+DB10_DBD42.Value.ToString+' (M17.0=1)';
end;

procedure TForm1.MaskEditIPEditingDone(Sender: TObject);
begin
  MaskEditIP.Caption:=RepairIPAddress(MaskEditIP.Caption);
  TCP_UDPPort1.Host:=MaskEditIP.Text;
end;

end.

