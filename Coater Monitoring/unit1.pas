unit Unit1;

{$mode objfpc}{$H+}
//{$DEFINE DEBUG}
//{$IFDEF DEBUG}
//  SendDebug(message_);
//{$ENDIF}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, Menus,
  StdCtrls, ExtCtrls, SpinEx, tcp_udpport, ISOTCPDriver, HMIEdit, HMICheckBox,
  HMILabel, hmi_polyline, dbugintf, commtypes, TypInfo, StrUtils, Tag,
  BCSVGButton, BCButton, BCImageButton, BCMDButton, simpleipc;

function IsDebuggerPresent(): integer stdcall; external 'kernel32.dll';

type

  { TForm1 }

  TForm1 = class(TForm)
    AdditionalCoronaSpeed_Set02: THMIEdit;
    AdditionalGravureSpeed_Set: THMIEdit;
    AdditionalTakeOffRollSpeed_Set: THMIEdit;
    CmdBypassMode: TBCButton;
    CmdGravureAuto: TBCButton;
    CmdGravureManual: TBCButton;
    CmdCoatingMode: TBCButton;
    CmdGravureRollOff: TBCButton;
    CmdakeOffRollOff: TBCButton;
    CmdGravureRollRun: TBCButton;
    CmdCartridgeIn: TBCButton;
    CmdCartridgeOut: TBCButton;
    CmdTakeOffRollRun: TBCButton;
    CmdSystemOff: TBCButton;
    CmdSystemOn: TBCButton;
    CoronaSetpoint: THMIEdit;
    CmdCoronaRollRun: TBCButton;
    CmdCoronaRollOff: TBCButton;
    CmdExhaustRun: TBCButton;
    CmdExhaustOff: TBCButton;
    CmdGeneratorOff: TBCButton;
    CmdElectrodeIn: TBCButton;
    CmdElectrodeOut: TBCButton;
    BCSVGButton1: TBCSVGButton;
    CmdGeneratorOn: TBCButton;
    CoronaSetpoint1: THMIEdit;
    CoronaSpeed_Act02: THMILabel;
    CoronaWattDensityAct1: THMILabel;
    Corona_Act1: THMILabel;
    GravureSpeed_Act: THMILabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox9: TGroupBox;
    ImageElectrode: TImage;
    ImageCartridge: TImage;
    Label29: TLabel;
    Label30: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label64: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label7: TLabel;
    Label70: TLabel;
    Label8: TLabel;
    LineSpeed_Act01: THMILabel;
    TakeOffRollSpeed_Act: THMILabel;
    LineSpeed_Act: THMILabel;
    CoronaWattDensityAct: THMILabel;




    EditPort: TSpinEditEx;
    FilmBypass: THMIPolyline;
    GroupBox10: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox7: TGroupBox;
    BypassFilmbrake_Set: THMICheckBox;
    GroupBox8: TGroupBox;
    FilmCoater: THMIPolyline;
    HMIPolylineElectrode: THMIPolyline;
    HMIPolylineCoatetStation: THMIPolyline;
    HMIPolyline2: THMIPolyline;
    HMIPolyline3: THMIPolyline;
    HMIPolyline5: THMIPolyline;
    ImageCoronaExhaustFan: TImage;
    Image2: TImage;
    ImageFlow1: TImage;
    ImageFlow2: TImage;
    ImageList1: TImageList;
    ImageList2: TImageList;
    Label4: TLabel;
    Label51: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label65: TLabel;
    LineSpeedUpper_Set: THMIEdit;
    AdditionalCoronaSpeed_Set: THMIEdit;
    CoronaSpeed_Act01: THMILabel;

    ISOTCPDriver1: TISOTCPDriver;
    Label1: TLabel;
    Label2: TLabel;
    Label28: TLabel;
    Label3: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label45: TLabel;
    Corona_Act: THMILabel;
    MainMenu1: TMainMenu;
    MaskEditIP: TEdit;

    MenuIFile: TMenuItem;
    Menuexit: TMenuItem;
    MenuConnect: TMenuItem;
    Connect: TMenuItem;
    Disconnect: TMenuItem;
    MenuIInterlockCoronaRoll: TMenuItem;
    MenuIInterlockCoronaExhaustFan: TMenuItem;
    MenuIInterlockElectrode: TMenuItem;
    MenuInterlockCorona: TMenuItem;
    MenuView: TMenuItem;
    MenuProductionView: TMenuItem;
    MenuMaintenanceView: TMenuItem;
    PageControl1: TPageControl;

    P1: TShape;
    PopupMenuInterlockCoronaRoll: TPopupMenu;
    PopupMenuElectrode: TPopupMenu;
    PopupMenuInterlockCoronaExhaustFan: TPopupMenu;
    TakeOffRoll: TShape;
    P2: TShape;
    P3: TShape;
    P4: TShape;
    P5: TShape;
    P6: TShape;
    GravureRoll: TShape;
    CoronaRoll: TShape;
    BananaRoll: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Electrode02: TShape;
    Electrode01: TShape;
    StatusBar1: TStatusBar;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TCP_UDPPort1: TTCP_UDPPort;
    Timer1: TTimer;
    procedure CmdakeOffRollOffClick(Sender: TObject);
    procedure CmdakeOffRollOffMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CmdakeOffRollOffMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CmdCartridgeInClick(Sender: TObject);
    procedure CmdCartridgeInMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CmdCartridgeInMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CmdCartridgeOutClick(Sender: TObject);
    procedure CmdCartridgeOutMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CmdCartridgeOutMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
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
    procedure CmdGravureAutoClick(Sender: TObject);
    procedure CmdGravureAutoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CmdGravureAutoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CmdGravureManualClick(Sender: TObject);
    procedure CmdGravureManualMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CmdGravureManualMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CmdGravureRollOffClick(Sender: TObject);
    procedure CmdGravureRollOffMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CmdGravureRollOffMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CmdGravureRollRunClick(Sender: TObject);
    procedure CmdGravureRollRunMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CmdGravureRollRunMouseUp(Sender: TObject; Button: TMouseButton;
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
    procedure CmdTakeOffRollRunClick(Sender: TObject);
    procedure CmdTakeOffRollRunMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CmdTakeOffRollRunMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ConnectClick(Sender: TObject);
    procedure DisconnectClick(Sender: TObject);
    procedure EditPortEditingDone(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure MaskEditIPEditingDone(Sender: TObject);
    procedure MenuexitClick(Sender: TObject);
    procedure MenuIInterlockCoronaExhaustFanClick(Sender: TObject);
    procedure MenuIInterlockCoronaRollClick(Sender: TObject);
    procedure MenuIInterlockElectrodeClick(Sender: TObject);
    procedure MenuInterlockCoronaClick(Sender: TObject);
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
  DebugIsActive:boolean;

implementation

uses Unit2, Unit3, Unit4;

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

  Label28.Color:=clSilver;
  Label29.Color:=clSilver;
  Label30.Color:=clSilver;
  Label45.Color:=clSilver;
  Label51.Color:=clSilver;
  Label57.Color:=clSilver;


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
  CoronaRoll.Brush.Color:=clSkyBlue;
  CoronaRoll.Brush.Style:=bsDiagCross;
  GravureRoll.Brush.Style:=bsDiagCross;
  TakeOffRoll.Brush.Style:=bsDiagCross;
  FilmCoater.PenStyle:=psDot;
  FilmCoater.LineColor:=clGray;
  FilmBypass.PenStyle:=psDot;
  FilmBypass.LineColor:=clGray;

  ImageCoronaExhaustFan.ImageIndex:=14;

  AdditionalGravureSpeed_Set.Enabled:=false;
  AdditionalTakeOffRollSpeed_Set.Enabled:=false;
  ImageElectrode.ImageIndex:=18;
  ImageCartridge.ImageIndex:=18;

  Label47.Color:=clSilver;
  CmdTakeOffRollRun.Enabled:=false;
  CmdakeOffRollOff.Enabled:=false;
  Label46.Color:=clSilver;
  CmdGravureRollRun.Enabled:=false;
  CmdGravureRollOff.Enabled:=false;
  Label33.Color:=clSilver;
  CmdCartridgeIn.Enabled:=false;
  CmdCartridgeOut.Enabled:=false;

  Corona_Act1.Color:=clSilver;
  CoronaSetpoint1.Enabled:=false;
  CoronaWattDensityAct1.Color:=clSilver;

  Label34.Color:=clSilver;
  Label35.Color:=clSilver;
  CmdGravureAuto.Enabled:=false;
  CmdGravureManual.Enabled:=false;

  Label28.Transparent:=false;
  Label29.Transparent:=false;
  Label30.Transparent:=false;
  Label33.Transparent:=false;
  Label34.Transparent:=false;
  Label35.Transparent:=false;
  Label45.Transparent:=false;
  Label46.Transparent:=false;
  Label47.Transparent:=false;
  Label51.Transparent:=false;
  Label57.Transparent:=false;
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

  CmdSystemOn.Enabled:=true;
  CmdSystemOff.Enabled:=true;

  Label28.ParentColor:=true;
  Label29.ParentColor:=true;
  Label30.ParentColor:=true;
  Label45.ParentColor:=true;
  Label51.ParentColor:=true;
  Label57.ParentColor:=true;

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
  CoronaRoll.Brush.Style:=bsSolid;
  GravureRoll.Brush.Style:=bsSolid;
  TakeOffRoll.Brush.Style:=bsSolid;

  AdditionalGravureSpeed_Set.Enabled:=true;
  AdditionalTakeOffRollSpeed_Set.Enabled:=true;

  Label47.ParentColor:=true;
  CmdTakeOffRollRun.Enabled:=true;
  CmdakeOffRollOff.Enabled:=true;
  Label46.ParentColor:=true;
  CmdGravureRollRun.Enabled:=true;
  CmdGravureRollOff.Enabled:=true;
  Label33.ParentColor:=true;
  CmdCartridgeIn.Enabled:=true;
  CmdCartridgeOut.Enabled:=true;

  Corona_Act1.ParentColor:=true;
  CoronaSetpoint1.Enabled:=true;
  CoronaWattDensityAct1.ParentColor:=true;

  Label34.ParentColor:=true;
  Label35.ParentColor:=true;
  CmdGravureAuto.Enabled:=true;
  CmdGravureManual.Enabled:=true;

  Label28.Transparent:=true;
  Label29.Transparent:=true;
  Label30.Transparent:=true;
  Label33.Transparent:=true;
  Label34.Transparent:=true;
  Label35.Transparent:=true;
  Label45.Transparent:=true;
  Label46.Transparent:=true;
  Label47.Transparent:=true;
  Label51.Transparent:=true;
  Label57.Transparent:=true;
end;

procedure TForm1.MenuexitClick(Sender: TObject);
begin
  Close;
  //halt;
end;

procedure TForm1.MenuIInterlockCoronaExhaustFanClick(Sender: TObject);
var
  ff:Tform2;
begin
  ff:= Tform2.Create(self);
  ff.InterlockName_:='Corona Exhaust Fan Interlock';
  ff.DateTime_:=FormatDateTime('dd/mm/yyyy ', Now())+TimeToStr(Time);
  ff.Show;
end;

procedure TForm1.MenuIInterlockCoronaRollClick(Sender: TObject);
var
  ff:Tform2;
begin
  //Application.CreateForm(TForm2, ff);
  ff:= Tform2.Create(self);
  ff.InterlockName_:='Corona roll Interlock';
  ff.DateTime_:=FormatDateTime('dd/mm/yyyy ', Now())+TimeToStr(Time);
  ff.Show;
end;

procedure TForm1.MenuIInterlockElectrodeClick(Sender: TObject);
var
  ff:Tform2;
begin
  ff:= Tform2.Create(self);
  ff.InterlockName_:='Corona Electrode Interlock';
  ff.DateTime_:=FormatDateTime('dd/mm/yyyy ', Now())+TimeToStr(Time);
  ff.Show;
end;

procedure TForm1.MenuInterlockCoronaClick(Sender: TObject);
var
  ff:Tform2;
begin
 ff:= Tform2.Create(self);
  ff.InterlockName_:='Corona Generator Interlock';
  ff.DateTime_:=FormatDateTime('dd/mm/yyyy ', Now())+TimeToStr(Time);
  ff.Show;
end;

procedure TForm1.MenuProductionViewClick(Sender: TObject);
begin
  ProductionView:=true;
  MenuMaintenanceView.ImageIndex:=9;
  MenuProductionView.ImageIndex:=7;

end;

procedure TForm1.MenuMaintenanceViewClick(Sender: TObject);
begin
  ProductionView:=false;
  MenuMaintenanceView.ImageIndex:=7;
  MenuProductionView.ImageIndex:=9;

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
  LiveCounter_:=LiveCounter_+1;
  if LiveCounter_ > 100000 then LiveCounter_:=0;

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
    begin Label51.Caption:='Exhaust: Run'; end
    else
    begin Label51.Caption:='Exhaust: Off'; end;

    if Q0_1.Value > 0 then
    begin ImageCoronaExhaustFan.ImageIndex:=12;
          ImageFlow1.Top:=80; ImageFlow1.Height:=79;
          ImageFlow2.Left:=552; ImageFlow2.Width:=100;
    end
    else
    begin  ImageCoronaExhaustFan.ImageIndex:=11;
           ImageFlow1.Top:=120; ImageFlow1.Height:=39;
           ImageFlow2.Left:=608; ImageFlow2.Width:=44;
    end;

    if Q0_2.Value > 0 then  //Cartridge
    begin
      ImageCartridge.ImageIndex:=19;
      ImageCartridge.Left:=410;
      HMIPolylineCoatetStation.Left:=376;
      GravureRoll.Left:=315;
      Label7.Left:=411;
      Label33.Caption:='Cartridge: In position';
    end
    else
    begin
      ImageCartridge.ImageIndex:=20;
      ImageCartridge.Left:=420;
      HMIPolylineCoatetStation.Left:=386;
      GravureRoll.Left:=325;
      Label7.Left:=421;
      Label33.Caption:='Cartridge: Out position';
    end;

    if Q0_3.Value > 0 then   //Electrode
    begin
      Label28.Caption:='Electrode: In';
      ImageElectrode.ImageIndex:=19;
      ImageElectrode.Left:=425;
      Image2.Left:=390;
      HMIPolylineElectrode.Left:=390;
      Label5.Left:=426;
      Electrode01.Left:=395;
      Electrode02.Left:=400;
    end
    else
    begin
      Label28.Caption:='Electrode: Out';
      ImageElectrode.ImageIndex:=20;
      ImageElectrode.Left:=435;
      Image2.Left:=400;
      HMIPolylineElectrode.Left:=400;
      Label5.Left:=436;
      Electrode01.Left:=405;
      Electrode02.Left:=410;
    end;

    if Q0_5.Value > 0 then
    begin Label57.Caption:='Generator: On'; end
    else
    begin Label57.Caption:='Generator: Off'; end;

    if Q201_0.Value > 0 then begin end
    else begin end;

    if Q209_0.Value > 0 then
    begin Label45.Caption:='Corona Roll: Run'; CoronaRoll.Brush.Color:=clLime; end
    else
    begin Label45.Caption:='Corona Roll: Off'; CoronaRoll.Brush.Color:=clSkyBlue; end;

    if Q213_0.Value > 0 then
    begin Label46.Caption:='Gravure roll: Run'; GravureRoll.Brush.Color:=clLime; end
    else
    begin Label46.Caption:='Gravure roll: Off'; GravureRoll.Brush.Color:=clSilver; end;

    if Q217_0.Value > 0 then
    begin Label47.Caption:='Takeoff roll: Run'; TakeOffRoll.Brush.Color:=clLime; end
    else
    begin Label47.Caption:='Takeoff roll: Off'; TakeOffRoll.Brush.Color:=clCream; end;

    if I0_0.Value > 0 then
    begin end
    else
    begin end;
    if I0_2.Value > 0 then
    begin end
    else
    begin end;
    if I0_5.Value > 0 then begin end
    else begin  end;
    if I0_7.Value > 0 then
    begin end
    else
    begin end;

    if M0_6.Value > 0 then begin end
    else begin end;
    if M0_7.Value > 0 then begin end
    else begin end;

    if M2_0.Value > 0 then begin end
    else begin end;
    if M2_1.Value > 0 then begin end
    else begin end;

    if M17_0.Value > 0 then begin end
    else begin end;

    if ProductionView then
      begin end
    else
      begin end;

    if M20_0.Value > 0 then begin Label34.Caption:='Gravure: Auto'; Label35.Caption:='Gravure: Auto'; end;
    if M20_1.Value > 0 then begin Label34.Caption:='Gravure: Manual'; Label35.Caption:='Gravure: Manual'; end;
    if (M20_0.Value < 1) and (M20_1.Value < 1) then begin Label34.Caption:='Gravure: '; Label35.Caption:='Gravure: '; end;

    if M22_0.Value > 0 then begin end
    else begin end;
    if M22_1.Value < 1 then begin end
    else begin end;

    if M30_1.Value > 0 then begin end
    else begin end;
    if M30_0.Value > 0 then
    begin end
    else
    begin end;
    if M31_0.Value > 0 then begin Label29.Caption:='System: On'; end
    else begin Label29.Caption:='System: Off'; end;
    if M32_0.Value > 0 then
    begin
      Label30.Caption:='Mode: Coating';
      FilmCoater.PenStyle:=psSolid;
      FilmCoater.LineColor:=clBlack;
      FilmBypass.PenStyle:=psDashDotDot;
      FilmBypass.LineColor:=$00404080;
    end
    else
    begin
      Label30.Caption:='Mode: Bypass';
      FilmCoater.PenStyle:=psDashDotDot;
      FilmCoater.LineColor:=$00404080;
      FilmBypass.PenStyle:=psSolid;
      FilmBypass.LineColor:=clBlack;
    end;
    if M34_0.Value > 0 then begin end
    else begin end;

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
    IsTakeOffRollRun();
    IsTakeOffRollOff();
    IsGravureRollRun();
    IsGravureRollOff();
    IsCartridgeIn();
    IsCartridgeOut();
    IsGravureAutoMode();
    IsGravureManualMode();

    if M98_0.Value > 0 then
    begin end
    else
    begin end;

    if (M98_0.Value > 0) or ((I0_0.Value > 0) and (I0_7.Value > 0)) then
    begin end
    else
    begin end;

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

procedure TForm1.CmdCartridgeInMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  M2_2.Value:=1;
end;

procedure TForm1.CmdCartridgeInClick(Sender: TObject);
begin
  M2_2.Value:=0;
end;

procedure TForm1.CmdakeOffRollOffClick(Sender: TObject);
begin
  M35_0.Value:=0;  // Takeoff roll Run HMI
  M35_1.Value:=0;  // Takeoff roll Off HMI
end;

procedure TForm1.CmdakeOffRollOffMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  M35_1.Value:=1;
end;

procedure TForm1.CmdakeOffRollOffMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  M35_1.Value:=0;
end;

procedure TForm1.CmdCartridgeInMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  M2_2.Value:=0;
end;

procedure TForm1.CmdCartridgeOutClick(Sender: TObject);
begin
  M2_2.Value:=0;  // Cartridge In HMI
  M2_3.Value:=0;  // Cartridge Out HMI
end;

procedure TForm1.CmdCartridgeOutMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  M2_3.Value:=1;
end;

procedure TForm1.CmdCartridgeOutMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  M2_3.Value:=0;
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

procedure TForm1.CmdGravureAutoClick(Sender: TObject);
begin
  M1_3.Value:=0;
end;

procedure TForm1.CmdGravureAutoMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  M1_3.Value:=1;
end;

procedure TForm1.CmdGravureAutoMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  M1_3.Value:=0;
end;

procedure TForm1.CmdGravureManualClick(Sender: TObject);
begin
  M1_4.Value:=0;
end;

procedure TForm1.CmdGravureManualMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  M1_4.Value:=1;
end;

procedure TForm1.CmdGravureManualMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  M1_4.Value:=0;
end;

procedure TForm1.CmdGravureRollOffClick(Sender: TObject);
begin
  M33_0.Value:=0;  // Gravure roll Start HMI
  M33_1.Value:=0;  // Gravure roll Stop HMI
end;

procedure TForm1.CmdGravureRollOffMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  M33_1.Value:=1;
end;

procedure TForm1.CmdGravureRollOffMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  M33_1.Value:=0;
end;

procedure TForm1.CmdGravureRollRunClick(Sender: TObject);
begin
  M33_0.Value:=0;
end;

procedure TForm1.CmdGravureRollRunMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  M33_0.Value:=1;
end;

procedure TForm1.CmdGravureRollRunMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  M33_0.Value:=0;
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

procedure TForm1.CmdTakeOffRollRunClick(Sender: TObject);
begin
  M35_0.Value:=0;
end;

procedure TForm1.CmdTakeOffRollRunMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  M35_0.Value:=1;
end;

procedure TForm1.CmdTakeOffRollRunMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  M35_0.Value:=0;
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
  FreeAndNil_MB20();
  FreeAndNil_MB22();
  FreeAndNil_MB30();
  FreeAndNil_MB31();
  FreeAndNil_MB32();
  FreeAndNil_MB33();
  FreeAndNil_MB34();
  FreeAndNil_MB35();
  FreeAndNil_MB98();
  FreeAndNil_MB101();
  FreeAndNil_QB0();
  FreeAndNil_QB201();
  FreeAndNil_QB209();
  FreeAndNil_QB213();
  FreeAndNil_QB217();
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
  LiveCounter_:=0;
  CoronaRoll.PopupMenu := PopupMenuInterlockCoronaRoll;
  ImageCoronaExhaustFan.PopupMenu := PopupMenuInterlockCoronaExhaustFan;
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
  CreateTag_MB20();  //Gravure Auto/Manual Cmd (Read Only)
  CreateTag_MB22();
  CreateTag_MB30();
  CreateTag_MB31();
  CreateTag_MB32();
  CreateTag_MB33();   // Gravure roll Start/Stop HMI
  CreateTag_MB34();
  CreateTag_MB35();   //Takeoff roll Run/Off HMI
  CreateTag_MB98();
  CreateTag_MB101();
  CreateTag_QB0();
  CreateTag_QB201();
  CreateTag_QB209();
  CreateTag_QB213();  //Gravure roll run
  CreateTag_QB217();  //Takeoff roll run
  CreateTag_IB0();
  CreateTag_DB9_DBD32();  //CoronaSpeed_Act
  CreateTag_DB9_DBD36();  //GravureRoll_Act
  CreateTag_DB9_DBD40();  //TakeOffRoll_Act
  CreateTag_DB9_DBD56();  //CoronaSetpoin
  CreateTag_DB9_DBD60();  //CoronaActual
  CreateTag_DB9_DBD64();  //CoronaWattDensityAct
  CreateTag_DB10_DBD4();  //LineSpeed_Act01
  CreateTag_DB10_DBD22(); //AdditionalCoronaSpeed_Set
  CreateTag_DB10_DBD26(); //AdditionalGravureRollSpeed_Set
  CreateTag_DB10_DBD30(); //AdditionalTakeOffRollSpeed_Set
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
  GravureSpeed_Act.PLCTag:=DB9_DBD36;
  TakeOffRollSpeed_Act.PLCTag:=DB9_DBD40;
  Corona_Act.PLCTag:=DB9_DBD60;
  Corona_Act1.PLCTag:=DB9_DBD60;
  CoronaSetpoint.PLCTag:=DB9_DBD56;
  CoronaSetpoint1.PLCTag:=DB9_DBD56;
  CoronaWattDensityAct.PLCTag:=DB9_DBD64;
  CoronaWattDensityAct1.PLCTag:=DB9_DBD64;
  LineSpeed_Act01.PLCTag:=DB10_DBD4;
  LineSpeed_Act.PLCTag:=DB10_DBD4;
  AdditionalCoronaSpeed_Set.PLCTag:=DB10_DBD22;
  AdditionalCoronaSpeed_Set02.PLCTag:=DB10_DBD22;
  AdditionalGravureSpeed_Set.PLCTag:=DB10_DBD26;
  AdditionalTakeOffRollSpeed_Set.PLCTag:=DB10_DBD30;
  LineSpeedUpper_Set.PLCTag:=DB10_DBD42;
  BypassFilmbrake_Set.PLCTag:=M98_0;
  if ProductionView then
    begin end
  else
    begin end;
end;

procedure TForm1.MaskEditIPEditingDone(Sender: TObject);
begin
  MaskEditIP.Caption:=RepairIPAddress(MaskEditIP.Caption);
  TCP_UDPPort1.Host:=MaskEditIP.Text;
end;

end.

