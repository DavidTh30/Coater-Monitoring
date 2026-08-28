unit Unit1;

{$mode objfpc}{$H+}
//{$DEFINE DEBUG}
//{$IFDEF DEBUG}
//  SendDebug(message_);
//{$ENDIF}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, Menus,
  StdCtrls, ExtCtrls, SpinEx, tcp_udpport, ISOTCPDriver, PLCBlock,
  PLCBlockElement, TagBit, HMIEdit, HMICheckBox, HMILabel, dbugintf,
  commtypes, TypInfo, StrUtils, Tag, BCSVGButton, BCButton, simpleipc;

function IsDebuggerPresent(): integer stdcall; external 'kernel32.dll';

type

  { TForm1 }

  TForm1 = class(TForm)
    CmdCoronaRollOn: TBCButton;
    CmdCoronaRollOff: TBCButton;
    CmdSystemOff: TBCButton;
    CmdCoatingMode: TBCButton;
    CmdBypassMode: TBCButton;
    CmdSystemOn: TBCButton;
    CmdElectrodeIn: TBCButton;
    CmdElectrodeOut: TBCButton;
    BCSVGButton1: TBCSVGButton;
    DB10_DBD4: TPLCBlockElement;

    DB10_DBD42_: TPLCBlock;
    DB10_DBD42: TPLCBlockElement;
    DB10_DBD4_: TPLCBlock;
    DB9_DBD32_: TPLCBlock;
    DB9_DBD32: TPLCBlockElement;

    EditPort: TSpinEditEx;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    HMICheckBox1: THMICheckBox;
    HMIEdit1: THMIEdit;
    HMILabel1: THMILabel;
    HMILabel2: THMILabel;

    IB0_: TPLCBlock;
    IB0: TPLCBlockElement;
    I0_0: TTagBit;
    I0_1: TTagBit;
    I0_2: TTagBit;
    I0_3: TTagBit;
    I0_4: TTagBit;
    I0_5: TTagBit;
    I0_6: TTagBit;
    I0_7: TTagBit;

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
    MainMenu1: TMainMenu;
    MaskEditIP: TEdit;

    MB0_: TPLCBlock;
    MB0: TPLCBlockElement;
    M0_0: TTagBit;
    M0_1: TTagBit;
    M0_2: TTagBit;
    M0_3: TTagBit;
    M0_4: TTagBit;
    M0_5: TTagBit;
    M0_6: TTagBit;
    M0_7: TTagBit;

    MB1_: TPLCBlock;
    MB1: TPLCBlockElement;
    M1_0: TTagBit;
    M1_1: TTagBit;
    M1_2: TTagBit;
    M1_3: TTagBit;
    M1_4: TTagBit;
    M1_5: TTagBit;
    M1_6: TTagBit;
    M1_7: TTagBit;

    MB2_: TPLCBlock;
    MB2: TPLCBlockElement;
    M2_0: TTagBit;
    M2_1: TTagBit;
    M2_2: TTagBit;
    M2_3: TTagBit;
    M2_4: TTagBit;
    M2_5: TTagBit;
    M2_6: TTagBit;
    M2_7: TTagBit;

    MB17_: TPLCBlock;
    MB17: TPLCBlockElement;
    M17_0: TTagBit;
    M17_1: TTagBit;
    M17_2: TTagBit;
    M17_3: TTagBit;
    M17_4: TTagBit;
    M17_5: TTagBit;
    M17_6: TTagBit;
    M17_7: TTagBit;

    MB30_: TPLCBlock;
    MB30: TPLCBlockElement;
    M30_0: TTagBit;
    M30_1: TTagBit;
    M30_2: TTagBit;
    M30_3: TTagBit;
    M30_4: TTagBit;
    M30_5: TTagBit;
    M30_6: TTagBit;
    M30_7: TTagBit;

    MB31_: TPLCBlock;
    MB31: TPLCBlockElement;
    M31_0: TTagBit;
    M31_1: TTagBit;
    M31_2: TTagBit;
    M31_3: TTagBit;
    M31_4: TTagBit;
    M31_5: TTagBit;
    M31_6: TTagBit;
    M31_7: TTagBit;

    MB32_: TPLCBlock;
    MB32: TPLCBlockElement;
    M32_0: TTagBit;
    M32_1: TTagBit;
    M32_2: TTagBit;
    M32_3: TTagBit;
    M32_4: TTagBit;
    M32_5: TTagBit;
    M32_6: TTagBit;
    M32_7: TTagBit;

    MB34_: TPLCBlock;
    MB34: TPLCBlockElement;
    M34_0: TTagBit;
    M34_1: TTagBit;
    M34_2: TTagBit;
    M34_3: TTagBit;
    M34_4: TTagBit;
    M34_5: TTagBit;
    M34_6: TTagBit;
    M34_7: TTagBit;

    MB98_: TPLCBlock;
    MB98: TPLCBlockElement;
    M98_0: TTagBit;
    M98_1: TTagBit;
    M98_2: TTagBit;
    M98_3: TTagBit;
    M98_4: TTagBit;
    M98_5: TTagBit;
    M98_6: TTagBit;
    M98_7: TTagBit;

    MB101: TPLCBlockElement;
    MB101_: TPLCBlock;
    M101_0: TTagBit;
    M101_1: TTagBit;
    M101_2: TTagBit;
    M101_3: TTagBit;
    M101_4: TTagBit;
    M101_5: TTagBit;
    M101_6: TTagBit;
    M101_7: TTagBit;

    MenuIFile: TMenuItem;
    Menuexit: TMenuItem;
    MenuConnect: TMenuItem;
    Connect: TMenuItem;
    Disconnect: TMenuItem;
    PageControl1: TPageControl;

    QB0_: TPLCBlock;
    QB0: TPLCBlockElement;
    Q0_0: TTagBit;
    Q0_1: TTagBit;
    Q0_2: TTagBit;
    Q0_3: TTagBit;
    Q0_4: TTagBit;
    Q0_5: TTagBit;
    Q0_6: TTagBit;
    Q0_7: TTagBit;

    QB201_: TPLCBlock;
    QB201: TPLCBlockElement;
    Q201_0: TTagBit;
    Q201_1: TTagBit;
    Q201_2: TTagBit;
    Q201_3: TTagBit;
    Q201_4: TTagBit;
    Q201_5: TTagBit;
    Q201_6: TTagBit;
    Q201_7: TTagBit;

    QB209_: TPLCBlock;
    QB209: TPLCBlockElement;
    Q209_0: TTagBit;
    Q209_1: TTagBit;
    Q209_2: TTagBit;
    Q209_3: TTagBit;
    Q209_4: TTagBit;
    Q209_5: TTagBit;
    Q209_6: TTagBit;
    Q209_7: TTagBit;

    P1: TShape;
    Shape10: TShape;
    Shape15: TShape;
    P2: TShape;
    P3: TShape;
    P4: TShape;
    P5: TShape;
    P6: TShape;
    Shape16: TShape;
    Shape17: TShape;
    Shape9: TShape;
    StatusBar1: TStatusBar;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TCP_UDPPort1: TTCP_UDPPort;
    Timer1: TTimer;
    procedure CmdCoronaRollOnMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CmdCoronaRollOnMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CmdCoronaRollOffMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CmdCoronaRollOffMouseUp(Sender: TObject; Button: TMouseButton;
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
    procedure FormCreate(Sender: TObject);
    procedure MaskEditIPEditingDone(Sender: TObject);
    procedure MenuexitClick(Sender: TObject);
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

  Shape9.Brush.Color:=clSilver;
  Shape10.Brush.Color:=clSilver;

  HMIEdit1.Enabled:=false;
  HMICheckBox1.Enabled:=false;

  CmdCoatingMode.Enabled:=false;
  CmdBypassMode.Enabled:=false;

  CmdElectrodeIn.Enabled:=false;
  CmdElectrodeOut.Enabled:=false;

  CmdSystemOn.Enabled:=false;
  CmdSystemOff.Enabled:=false;

  CmdCoronaRollOn.Enabled:=false;
  CmdCoronaRollOff.Enabled:=false;
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

  HMIEdit1.Enabled:=true;
  HMICheckBox1.Enabled:=true;

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

  CmdCoronaRollOn.Enabled:=true;
  CmdCoronaRollOff.Enabled:=true;

end;

procedure TForm1.MenuexitClick(Sender: TObject);
begin
  halt;
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
    if Q0_5.Value > 0 then begin Label12.Color:=clMoneyGreen; end
    else begin Label12.Color:=clWhite; end;

    if Q201_0.Value > 0 then begin Label24.Color:=clMoneyGreen; end
    else begin Label24.Color:=clWhite; end;

    if Q209_0.Value > 0 then
    begin Label46.Color:=clMoneyGreen; Label45.Caption:='Corona Roll: Run'; end
    else
    begin Label46.Color:=clWhite; Label45.Caption:='Corona Roll: Off'; end;

    if I0_0.Value > 0 then
    begin Label13.Color:=clMoneyGreen; Label35.Color:=clMoneyGreen; end
    else
    begin Label13.Color:=clWhite; Label35.Color:=clMoneyGreen; end;
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
    Label41.Caption:='LineSpeed Upper: '+DB10_DBD42.Value.ToString+' (M17.0=1)';

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

    if M30_0.Value > 0 then
    begin
      CmdCoatingMode.StateNormal.Background.Gradient1.StartColor:=clMoneyGreen;
      CmdCoatingMode.StateNormal.Background.Gradient1.EndColor:=clMoneyGreen;
      CmdCoatingMode.StateNormal.Background.Gradient2.StartColor:=clMoneyGreen;
      CmdCoatingMode.StateNormal.Background.Gradient2.EndColor:=clMoneyGreen;

      CmdCoatingMode.StateHover.Background.Gradient1.StartColor:=clGreen;
      CmdCoatingMode.StateHover.Background.Gradient1.EndColor:=clMoneyGreen;
      CmdCoatingMode.StateHover.Background.Gradient2.StartColor:=clWhite;
      CmdCoatingMode.StateHover.Background.Gradient2.EndColor:=clBlack;

      CmdCoatingMode.StateClicked.Background.Gradient1.StartColor:=clWhite;
      CmdCoatingMode.StateClicked.Background.Gradient1.EndColor:=clGreen;
      CmdCoatingMode.StateClicked.Background.Gradient2.StartColor:=clWhite;
      CmdCoatingMode.StateClicked.Background.Gradient2.EndColor:=clGreen;
    end
    else
    begin
      CmdCoatingMode.StateNormal.Background.Gradient1.StartColor:=clSkyBlue;
      CmdCoatingMode.StateNormal.Background.Gradient1.EndColor:=clSkyBlue;
      CmdCoatingMode.StateNormal.Background.Gradient2.StartColor:=clSkyBlue;
      CmdCoatingMode.StateNormal.Background.Gradient2.EndColor:=clSkyBlue;

      CmdCoatingMode.StateHover.Background.Gradient1.StartColor:=clSkyBlue;
      CmdCoatingMode.StateHover.Background.Gradient1.EndColor:=clSkyBlue;
      CmdCoatingMode.StateHover.Background.Gradient2.StartColor:=clWhite;
      CmdCoatingMode.StateHover.Background.Gradient2.EndColor:=clBlack;

      CmdCoatingMode.StateClicked.Background.Gradient1.StartColor:=clWhite;
      CmdCoatingMode.StateClicked.Background.Gradient1.EndColor:=clSkyBlue;
      CmdCoatingMode.StateClicked.Background.Gradient2.StartColor:=clWhite;
      CmdCoatingMode.StateClicked.Background.Gradient2.EndColor:=clSkyBlue;
    end;

    if M30_1.Value > 0 then
    begin
      CmdBypassMode.StateNormal.Background.Gradient1.StartColor:=clMoneyGreen;
      CmdBypassMode.StateNormal.Background.Gradient1.EndColor:=clMoneyGreen;
      CmdBypassMode.StateNormal.Background.Gradient2.StartColor:=clMoneyGreen;
      CmdBypassMode.StateNormal.Background.Gradient2.EndColor:=clMoneyGreen;

      CmdBypassMode.StateHover.Background.Gradient1.StartColor:=clGreen;
      CmdBypassMode.StateHover.Background.Gradient1.EndColor:=clMoneyGreen;
      CmdBypassMode.StateHover.Background.Gradient2.StartColor:=clWhite;
      CmdBypassMode.StateHover.Background.Gradient2.EndColor:=clBlack;

      CmdBypassMode.StateClicked.Background.Gradient1.StartColor:=clWhite;
      CmdBypassMode.StateClicked.Background.Gradient1.EndColor:=clGreen;
      CmdBypassMode.StateClicked.Background.Gradient2.StartColor:=clWhite;
      CmdBypassMode.StateClicked.Background.Gradient2.EndColor:=clGreen;
    end
    else
    begin
      CmdBypassMode.StateNormal.Background.Gradient1.StartColor:=clSkyBlue;
      CmdBypassMode.StateNormal.Background.Gradient1.EndColor:=clSkyBlue;
      CmdBypassMode.StateNormal.Background.Gradient2.StartColor:=clSkyBlue;
      CmdBypassMode.StateNormal.Background.Gradient2.EndColor:=clSkyBlue;

      CmdBypassMode.StateHover.Background.Gradient1.StartColor:=clSkyBlue;
      CmdBypassMode.StateHover.Background.Gradient1.EndColor:=clSkyBlue;
      CmdBypassMode.StateHover.Background.Gradient2.StartColor:=clWhite;
      CmdBypassMode.StateHover.Background.Gradient2.EndColor:=clBlack;

      CmdBypassMode.StateClicked.Background.Gradient1.StartColor:=clWhite;
      CmdBypassMode.StateClicked.Background.Gradient1.EndColor:=clSkyBlue;
      CmdBypassMode.StateClicked.Background.Gradient2.StartColor:=clWhite;
      CmdBypassMode.StateClicked.Background.Gradient2.EndColor:=clSkyBlue;
    end;

    if Q0_3.Value > 0 then
    begin
      CmdElectrodeIn.StateNormal.Background.Gradient1.StartColor:=clMoneyGreen;
      CmdElectrodeIn.StateNormal.Background.Gradient1.EndColor:=clMoneyGreen;
      CmdElectrodeIn.StateNormal.Background.Gradient2.StartColor:=clMoneyGreen;
      CmdElectrodeIn.StateNormal.Background.Gradient2.EndColor:=clMoneyGreen;

      CmdElectrodeIn.StateHover.Background.Gradient1.StartColor:=clGreen;
      CmdElectrodeIn.StateHover.Background.Gradient1.EndColor:=clMoneyGreen;
      CmdElectrodeIn.StateHover.Background.Gradient2.StartColor:=clWhite;
      CmdElectrodeIn.StateHover.Background.Gradient2.EndColor:=clBlack;

      CmdElectrodeIn.StateClicked.Background.Gradient1.StartColor:=clWhite;
      CmdElectrodeIn.StateClicked.Background.Gradient1.EndColor:=clGreen;
      CmdElectrodeIn.StateClicked.Background.Gradient2.StartColor:=clWhite;
      CmdElectrodeIn.StateClicked.Background.Gradient2.EndColor:=clGreen;
    end
    else
    begin
      CmdElectrodeIn.StateNormal.Background.Gradient1.StartColor:=clSkyBlue;
      CmdElectrodeIn.StateNormal.Background.Gradient1.EndColor:=clSkyBlue;
      CmdElectrodeIn.StateNormal.Background.Gradient2.StartColor:=clSkyBlue;
      CmdElectrodeIn.StateNormal.Background.Gradient2.EndColor:=clSkyBlue;

      CmdElectrodeIn.StateHover.Background.Gradient1.StartColor:=clSkyBlue;
      CmdElectrodeIn.StateHover.Background.Gradient1.EndColor:=clSkyBlue;
      CmdElectrodeIn.StateHover.Background.Gradient2.StartColor:=clWhite;
      CmdElectrodeIn.StateHover.Background.Gradient2.EndColor:=clBlack;

      CmdElectrodeIn.StateClicked.Background.Gradient1.StartColor:=clWhite;
      CmdElectrodeIn.StateClicked.Background.Gradient1.EndColor:=clSkyBlue;
      CmdElectrodeIn.StateClicked.Background.Gradient2.StartColor:=clWhite;
      CmdElectrodeIn.StateClicked.Background.Gradient2.EndColor:=clSkyBlue;
    end;

    if Q0_3.Value < 1 then
    begin
      CmdElectrodeOut.StateNormal.Background.Gradient1.StartColor:=clMoneyGreen;
      CmdElectrodeOut.StateNormal.Background.Gradient1.EndColor:=clMoneyGreen;
      CmdElectrodeOut.StateNormal.Background.Gradient2.StartColor:=clMoneyGreen;
      CmdElectrodeOut.StateNormal.Background.Gradient2.EndColor:=clMoneyGreen;

      CmdElectrodeOut.StateHover.Background.Gradient1.StartColor:=clGreen;
      CmdElectrodeOut.StateHover.Background.Gradient1.EndColor:=clMoneyGreen;
      CmdElectrodeOut.StateHover.Background.Gradient2.StartColor:=clWhite;
      CmdElectrodeOut.StateHover.Background.Gradient2.EndColor:=clBlack;

      CmdElectrodeOut.StateClicked.Background.Gradient1.StartColor:=clWhite;
      CmdElectrodeOut.StateClicked.Background.Gradient1.EndColor:=clGreen;
      CmdElectrodeOut.StateClicked.Background.Gradient2.StartColor:=clWhite;
      CmdElectrodeOut.StateClicked.Background.Gradient2.EndColor:=clGreen;
    end
    else
    begin
      CmdElectrodeOut.StateNormal.Background.Gradient1.StartColor:=clSkyBlue;
      CmdElectrodeOut.StateNormal.Background.Gradient1.EndColor:=clSkyBlue;
      CmdElectrodeOut.StateNormal.Background.Gradient2.StartColor:=clSkyBlue;
      CmdElectrodeOut.StateNormal.Background.Gradient2.EndColor:=clSkyBlue;

      CmdElectrodeOut.StateHover.Background.Gradient1.StartColor:=clSkyBlue;
      CmdElectrodeOut.StateHover.Background.Gradient1.EndColor:=clSkyBlue;
      CmdElectrodeOut.StateHover.Background.Gradient2.StartColor:=clWhite;
      CmdElectrodeOut.StateHover.Background.Gradient2.EndColor:=clBlack;

      CmdElectrodeOut.StateClicked.Background.Gradient1.StartColor:=clWhite;
      CmdElectrodeOut.StateClicked.Background.Gradient1.EndColor:=clSkyBlue;
      CmdElectrodeOut.StateClicked.Background.Gradient2.StartColor:=clWhite;
      CmdElectrodeOut.StateClicked.Background.Gradient2.EndColor:=clSkyBlue;
    end;

    if Q209_0.Value > 0 then
    begin
      CmdCoronaRollOn.StateNormal.Background.Gradient1.StartColor:=clMoneyGreen;
      CmdCoronaRollOn.StateNormal.Background.Gradient1.EndColor:=clMoneyGreen;
      CmdCoronaRollOn.StateNormal.Background.Gradient2.StartColor:=clMoneyGreen;
      CmdCoronaRollOn.StateNormal.Background.Gradient2.EndColor:=clMoneyGreen;

      CmdCoronaRollOn.StateHover.Background.Gradient1.StartColor:=clGreen;
      CmdCoronaRollOn.StateHover.Background.Gradient1.EndColor:=clMoneyGreen;
      CmdCoronaRollOn.StateHover.Background.Gradient2.StartColor:=clWhite;
      CmdCoronaRollOn.StateHover.Background.Gradient2.EndColor:=clBlack;

      CmdCoronaRollOn.StateClicked.Background.Gradient1.StartColor:=clWhite;
      CmdCoronaRollOn.StateClicked.Background.Gradient1.EndColor:=clGreen;
      CmdCoronaRollOn.StateClicked.Background.Gradient2.StartColor:=clWhite;
      CmdCoronaRollOn.StateClicked.Background.Gradient2.EndColor:=clGreen;
    end
    else
    begin
      CmdCoronaRollOn.StateNormal.Background.Gradient1.StartColor:=clSkyBlue;
      CmdCoronaRollOn.StateNormal.Background.Gradient1.EndColor:=clSkyBlue;
      CmdCoronaRollOn.StateNormal.Background.Gradient2.StartColor:=clSkyBlue;
      CmdCoronaRollOn.StateNormal.Background.Gradient2.EndColor:=clSkyBlue;

      CmdCoronaRollOn.StateHover.Background.Gradient1.StartColor:=clSkyBlue;
      CmdCoronaRollOn.StateHover.Background.Gradient1.EndColor:=clSkyBlue;
      CmdCoronaRollOn.StateHover.Background.Gradient2.StartColor:=clWhite;
      CmdCoronaRollOn.StateHover.Background.Gradient2.EndColor:=clBlack;

      CmdCoronaRollOn.StateClicked.Background.Gradient1.StartColor:=clWhite;
      CmdCoronaRollOn.StateClicked.Background.Gradient1.EndColor:=clSkyBlue;
      CmdCoronaRollOn.StateClicked.Background.Gradient2.StartColor:=clWhite;
      CmdCoronaRollOn.StateClicked.Background.Gradient2.EndColor:=clSkyBlue;
    end;

    if Q209_0.Value < 1 then
    begin
      CmdCoronaRollOff.StateNormal.Background.Gradient1.StartColor:=clMoneyGreen;
      CmdCoronaRollOff.StateNormal.Background.Gradient1.EndColor:=clMoneyGreen;
      CmdCoronaRollOff.StateNormal.Background.Gradient2.StartColor:=clMoneyGreen;
      CmdCoronaRollOff.StateNormal.Background.Gradient2.EndColor:=clMoneyGreen;

      CmdCoronaRollOff.StateHover.Background.Gradient1.StartColor:=clGreen;
      CmdCoronaRollOff.StateHover.Background.Gradient1.EndColor:=clMoneyGreen;
      CmdCoronaRollOff.StateHover.Background.Gradient2.StartColor:=clWhite;
      CmdCoronaRollOff.StateHover.Background.Gradient2.EndColor:=clBlack;

      CmdCoronaRollOff.StateClicked.Background.Gradient1.StartColor:=clWhite;
      CmdCoronaRollOff.StateClicked.Background.Gradient1.EndColor:=clGreen;
      CmdCoronaRollOff.StateClicked.Background.Gradient2.StartColor:=clWhite;
      CmdCoronaRollOff.StateClicked.Background.Gradient2.EndColor:=clGreen;
    end
    else
    begin
      CmdCoronaRollOff.StateNormal.Background.Gradient1.StartColor:=clSkyBlue;
      CmdCoronaRollOff.StateNormal.Background.Gradient1.EndColor:=clSkyBlue;
      CmdCoronaRollOff.StateNormal.Background.Gradient2.StartColor:=clSkyBlue;
      CmdCoronaRollOff.StateNormal.Background.Gradient2.EndColor:=clSkyBlue;

      CmdCoronaRollOff.StateHover.Background.Gradient1.StartColor:=clSkyBlue;
      CmdCoronaRollOff.StateHover.Background.Gradient1.EndColor:=clSkyBlue;
      CmdCoronaRollOff.StateHover.Background.Gradient2.StartColor:=clWhite;
      CmdCoronaRollOff.StateHover.Background.Gradient2.EndColor:=clBlack;

      CmdCoronaRollOff.StateClicked.Background.Gradient1.StartColor:=clWhite;
      CmdCoronaRollOff.StateClicked.Background.Gradient1.EndColor:=clSkyBlue;
      CmdCoronaRollOff.StateClicked.Background.Gradient2.StartColor:=clWhite;
      CmdCoronaRollOff.StateClicked.Background.Gradient2.EndColor:=clSkyBlue;
    end;

    if M31_0.Value > 0 then
    begin
      CmdSystemOn.StateNormal.Background.Gradient1.StartColor:=clMoneyGreen;
      CmdSystemOn.StateNormal.Background.Gradient1.EndColor:=clMoneyGreen;
      CmdSystemOn.StateNormal.Background.Gradient2.StartColor:=clMoneyGreen;
      CmdSystemOn.StateNormal.Background.Gradient2.EndColor:=clMoneyGreen;

      CmdSystemOn.StateHover.Background.Gradient1.StartColor:=clGreen;
      CmdSystemOn.StateHover.Background.Gradient1.EndColor:=clMoneyGreen;
      CmdSystemOn.StateHover.Background.Gradient2.StartColor:=clWhite;
      CmdSystemOn.StateHover.Background.Gradient2.EndColor:=clBlack;

      CmdSystemOn.StateClicked.Background.Gradient1.StartColor:=clWhite;
      CmdSystemOn.StateClicked.Background.Gradient1.EndColor:=clGreen;
      CmdSystemOn.StateClicked.Background.Gradient2.StartColor:=clWhite;
      CmdSystemOn.StateClicked.Background.Gradient2.EndColor:=clGreen;
    end
    else
    begin
      CmdSystemOn.StateNormal.Background.Gradient1.StartColor:=clSkyBlue;
      CmdSystemOn.StateNormal.Background.Gradient1.EndColor:=clSkyBlue;
      CmdSystemOn.StateNormal.Background.Gradient2.StartColor:=clSkyBlue;
      CmdSystemOn.StateNormal.Background.Gradient2.EndColor:=clSkyBlue;

      CmdSystemOn.StateHover.Background.Gradient1.StartColor:=clSkyBlue;
      CmdSystemOn.StateHover.Background.Gradient1.EndColor:=clSkyBlue;
      CmdSystemOn.StateHover.Background.Gradient2.StartColor:=clWhite;
      CmdSystemOn.StateHover.Background.Gradient2.EndColor:=clBlack;

      CmdSystemOn.StateClicked.Background.Gradient1.StartColor:=clWhite;
      CmdSystemOn.StateClicked.Background.Gradient1.EndColor:=clSkyBlue;
      CmdSystemOn.StateClicked.Background.Gradient2.StartColor:=clWhite;
      CmdSystemOn.StateClicked.Background.Gradient2.EndColor:=clSkyBlue;
    end;

    if M31_0.Value < 1 then
    begin
      CmdSystemOff.StateNormal.Background.Gradient1.StartColor:=$008080FF;
      CmdSystemOff.StateNormal.Background.Gradient1.EndColor:=$008080FF;
      CmdSystemOff.StateNormal.Background.Gradient2.StartColor:=$008080FF;
      CmdSystemOff.StateNormal.Background.Gradient2.EndColor:=$008080FF;

      CmdSystemOff.StateHover.Background.Gradient1.StartColor:=clRed;
      CmdSystemOff.StateHover.Background.Gradient1.EndColor:=$008080FF;
      CmdSystemOff.StateHover.Background.Gradient2.StartColor:=clWhite;
      CmdSystemOff.StateHover.Background.Gradient2.EndColor:=clBlack;

      CmdSystemOff.StateClicked.Background.Gradient1.StartColor:=clWhite;
      CmdSystemOff.StateClicked.Background.Gradient1.EndColor:=clRed;
      CmdSystemOff.StateClicked.Background.Gradient2.StartColor:=clWhite;
      CmdSystemOff.StateClicked.Background.Gradient2.EndColor:=clRed;
    end
    else
    begin
      CmdSystemOff.StateNormal.Background.Gradient1.StartColor:=clSkyBlue;
      CmdSystemOff.StateNormal.Background.Gradient1.EndColor:=clSkyBlue;
      CmdSystemOff.StateNormal.Background.Gradient2.StartColor:=clSkyBlue;
      CmdSystemOff.StateNormal.Background.Gradient2.EndColor:=clSkyBlue;

      CmdSystemOff.StateHover.Background.Gradient1.StartColor:=clSkyBlue;
      CmdSystemOff.StateHover.Background.Gradient1.EndColor:=clSkyBlue;
      CmdSystemOff.StateHover.Background.Gradient2.StartColor:=clWhite;
      CmdSystemOff.StateHover.Background.Gradient2.EndColor:=clBlack;

      CmdSystemOff.StateClicked.Background.Gradient1.StartColor:=clWhite;
      CmdSystemOff.StateClicked.Background.Gradient1.EndColor:=clSkyBlue;
      CmdSystemOff.StateClicked.Background.Gradient2.StartColor:=clWhite;
      CmdSystemOff.StateClicked.Background.Gradient2.EndColor:=clSkyBlue;
    end;

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

procedure TForm1.CmdCoronaRollOnMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  M34_0.Value:=1;
end;

procedure TForm1.CmdCoronaRollOnMouseUp(Sender: TObject; Button: TMouseButton;
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
  timer1.Enabled:=false;
  TCP_UDPPort1.Active:=false;
  Communication_Active:=false;

  FreeAndNil(M0_0);
  FreeAndNil(M0_1);
  FreeAndNil(M0_2);
  FreeAndNil(M0_3);
  FreeAndNil(M0_4);
  FreeAndNil(M0_5);
  FreeAndNil(M0_6);
  FreeAndNil(M0_7);
  FreeAndNil(MB0);
  FreeAndNil(MB0_);

  FreeAndNil(M1_0);
  FreeAndNil(M1_1);
  FreeAndNil(M1_2);
  FreeAndNil(M1_3);
  FreeAndNil(M1_4);
  FreeAndNil(M1_5);
  FreeAndNil(M1_6);
  FreeAndNil(M1_7);
  FreeAndNil(MB1);
  FreeAndNil(MB1_);

  FreeAndNil(M2_0);
  FreeAndNil(M2_1);
  FreeAndNil(M2_2);
  FreeAndNil(M2_3);
  FreeAndNil(M2_4);
  FreeAndNil(M2_5);
  FreeAndNil(M2_6);
  FreeAndNil(M2_7);
  FreeAndNil(MB2);
  FreeAndNil(MB2_);

  FreeAndNil(M17_0);
  FreeAndNil(M17_1);
  FreeAndNil(M17_2);
  FreeAndNil(M17_3);
  FreeAndNil(M17_4);
  FreeAndNil(M17_5);
  FreeAndNil(M17_6);
  FreeAndNil(M17_7);
  FreeAndNil(MB17);
  FreeAndNil(MB17_);

  FreeAndNil(M30_0);
  FreeAndNil(M30_1);
  FreeAndNil(M30_2);
  FreeAndNil(M30_3);
  FreeAndNil(M30_4);
  FreeAndNil(M30_5);
  FreeAndNil(M30_6);
  FreeAndNil(M30_7);
  FreeAndNil(MB30);
  FreeAndNil(MB30_);

  FreeAndNil(M31_0);
  FreeAndNil(M31_1);
  FreeAndNil(M31_2);
  FreeAndNil(M31_3);
  FreeAndNil(M31_4);
  FreeAndNil(M31_5);
  FreeAndNil(M31_6);
  FreeAndNil(M31_7);
  FreeAndNil(MB31);
  FreeAndNil(MB31_);

  FreeAndNil(M32_0);
  FreeAndNil(M32_1);
  FreeAndNil(M32_2);
  FreeAndNil(M32_3);
  FreeAndNil(M32_4);
  FreeAndNil(M32_5);
  FreeAndNil(M32_6);
  FreeAndNil(M32_7);
  FreeAndNil(MB32);
  FreeAndNil(MB32_);

  FreeAndNil(M34_0);
  FreeAndNil(M34_1);
  FreeAndNil(M34_2);
  FreeAndNil(M34_3);
  FreeAndNil(M34_4);
  FreeAndNil(M34_5);
  FreeAndNil(M34_6);
  FreeAndNil(M34_7);
  FreeAndNil(MB34);
  FreeAndNil(MB34_);

  FreeAndNil(M98_0);
  FreeAndNil(M98_1);
  FreeAndNil(M98_2);
  FreeAndNil(M98_3);
  FreeAndNil(M98_4);
  FreeAndNil(M98_5);
  FreeAndNil(M98_6);
  FreeAndNil(M98_7);
  FreeAndNil(MB98);
  FreeAndNil(MB98_);

  FreeAndNil(M101_0);
  FreeAndNil(M101_1);
  FreeAndNil(M101_2);
  FreeAndNil(M101_3);
  FreeAndNil(M101_4);
  FreeAndNil(M101_5);
  FreeAndNil(M101_6);
  FreeAndNil(M101_7);
  FreeAndNil(MB101);
  FreeAndNil(MB101_);

  FreeAndNil(Q0_0);
  FreeAndNil(Q0_1);
  FreeAndNil(Q0_2);
  FreeAndNil(Q0_3);
  FreeAndNil(Q0_4);
  FreeAndNil(Q0_5);
  FreeAndNil(Q0_6);
  FreeAndNil(Q0_7);
  FreeAndNil(QB0);
  FreeAndNil(QB0_);

  FreeAndNil(Q201_0);
  FreeAndNil(Q201_1);
  FreeAndNil(Q201_2);
  FreeAndNil(Q201_3);
  FreeAndNil(Q201_4);
  FreeAndNil(Q201_5);
  FreeAndNil(Q201_6);
  FreeAndNil(Q201_7);
  FreeAndNil(QB201);
  FreeAndNil(QB201_);

  FreeAndNil(Q209_0);
  FreeAndNil(Q209_1);
  FreeAndNil(Q209_2);
  FreeAndNil(Q209_3);
  FreeAndNil(Q209_4);
  FreeAndNil(Q209_5);
  FreeAndNil(Q209_6);
  FreeAndNil(Q209_7);
  FreeAndNil(QB209);
  FreeAndNil(QB209_);

  FreeAndNil(I0_0);
  FreeAndNil(I0_1);
  FreeAndNil(I0_2);
  FreeAndNil(I0_3);
  FreeAndNil(I0_4);
  FreeAndNil(I0_5);
  FreeAndNil(I0_6);
  FreeAndNil(I0_7);
  FreeAndNil(IB0);
  FreeAndNil(IB0_);

  FreeAndNil(DB10_DBD42);
  FreeAndNil(DB10_DBD42_);
end;

procedure TForm1.FormCreate(Sender: TObject);
//var
//  i:integer= 25;
begin

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

  MB0_:= TPLCBlock.Create(nil);
  MB0_.PLCRack:=0;
  MB0_.PLCSlot:=0;
  MB0_.PLCStation:=2;
  MB0_.MemAddress:=0;
  MB0_.MemReadFunction:=3;
  MB0_.AutoRead:=true;
  MB0_.AutoWrite:=false;
  MB0_.TagType:= TTagType.pttByte;
  MB0_.Size:=1;
  MB0_.RefreshTime:=500;
  MB0_.ProtocolDriver:=ISOTCPDriver1;

  MB0:= TPLCBlockElement.Create(nil);
  MB0.Index:=0;
  MB0.PLCBlock:=MB0_;

  M0_0:= TTagBit.Create(nil);
  M0_1:= TTagBit.Create(nil);
  M0_2:= TTagBit.Create(nil);
  M0_3:= TTagBit.Create(nil);
  M0_4:= TTagBit.Create(nil);
  M0_5:= TTagBit.Create(nil);
  M0_6:= TTagBit.Create(nil);
  M0_7:= TTagBit.Create(nil);

  M0_0.StartBit:=0;
  M0_0.EndBit:=0;
  M0_0.PLCTag:=MB0;

  M0_1.StartBit:=1;
  M0_1.EndBit:=1;
  M0_1.PLCTag:=MB0;

  M0_2.StartBit:=2;
  M0_2.EndBit:=2;
  M0_2.PLCTag:=MB0;

  M0_3.StartBit:=3;
  M0_3.EndBit:=3;
  M0_3.PLCTag:=MB0;

  M0_4.StartBit:=4;
  M0_4.EndBit:=4;
  M0_4.PLCTag:=MB0;

  M0_5.StartBit:=5;
  M0_5.EndBit:=5;
  M0_5.PLCTag:=MB0;

  M0_6.StartBit:=6;
  M0_6.EndBit:=6;
  M0_6.PLCTag:=MB0;

  M0_7.StartBit:=7;
  M0_7.EndBit:=7;
  M0_7.PLCTag:=MB0;

  MB1_:= TPLCBlock.Create(nil);
  MB1_.PLCRack:=0;
  MB1_.PLCSlot:=0;
  MB1_.PLCStation:=2;
  MB1_.MemAddress:=1;
  MB1_.MemReadFunction:=3;
  MB1_.AutoRead:=true;
  MB1_.AutoWrite:=false;
  MB1_.TagType:= TTagType.pttByte;
  MB1_.Size:=1;
  MB1_.RefreshTime:=500;
  MB1_.ProtocolDriver:=ISOTCPDriver1;

  MB1:= TPLCBlockElement.Create(nil);
  MB1.Index:=0;
  MB1.PLCBlock:=MB1_;

  M1_0:= TTagBit.Create(nil);
  M1_1:= TTagBit.Create(nil);
  M1_2:= TTagBit.Create(nil);
  M1_3:= TTagBit.Create(nil);
  M1_4:= TTagBit.Create(nil);
  M1_5:= TTagBit.Create(nil);
  M1_6:= TTagBit.Create(nil);
  M1_7:= TTagBit.Create(nil);

  M1_0.StartBit:=0;
  M1_0.EndBit:=0;
  M1_0.PLCTag:=MB1;

  M1_1.StartBit:=1;
  M1_1.EndBit:=1;
  M1_1.PLCTag:=MB1;

  M1_2.StartBit:=2;
  M1_2.EndBit:=2;
  M1_2.PLCTag:=MB1;

  M1_3.StartBit:=3;
  M1_3.EndBit:=3;
  M1_3.PLCTag:=MB1;

  M1_4.StartBit:=4;
  M1_4.EndBit:=4;
  M1_4.PLCTag:=MB1;

  M1_5.StartBit:=5;
  M1_5.EndBit:=5;
  M1_5.PLCTag:=MB1;

  M1_6.StartBit:=6;
  M1_6.EndBit:=6;
  M1_6.PLCTag:=MB1;

  M1_7.StartBit:=7;
  M1_7.EndBit:=7;
  M1_7.PLCTag:=MB1;

  MB2_:= TPLCBlock.Create(nil);
  MB2_.PLCRack:=0;
  MB2_.PLCSlot:=0;
  MB2_.PLCStation:=2;
  MB2_.MemAddress:=2;
  MB2_.MemReadFunction:=3;
  MB2_.AutoRead:=true;
  MB2_.AutoWrite:=true;
  MB2_.TagType:= TTagType.pttByte;
  MB2_.Size:=1;
  MB2_.RefreshTime:=500;
  MB2_.ProtocolDriver:=ISOTCPDriver1;

  MB2:= TPLCBlockElement.Create(nil);
  MB2.Index:=0;
  MB2.PLCBlock:=MB2_;

  M2_0:= TTagBit.Create(nil);
  M2_1:= TTagBit.Create(nil);
  M2_2:= TTagBit.Create(nil);
  M2_3:= TTagBit.Create(nil);
  M2_4:= TTagBit.Create(nil);
  M2_5:= TTagBit.Create(nil);
  M2_6:= TTagBit.Create(nil);
  M2_7:= TTagBit.Create(nil);

  M2_0.StartBit:=0;
  M2_0.EndBit:=0;
  M2_0.PLCTag:=MB2;

  M2_1.StartBit:=1;
  M2_1.EndBit:=1;
  M2_1.PLCTag:=MB2;

  M2_2.StartBit:=2;
  M2_2.EndBit:=2;
  M2_2.PLCTag:=MB2;

  M2_3.StartBit:=3;
  M2_3.EndBit:=3;
  M2_3.PLCTag:=MB2;

  M2_4.StartBit:=4;
  M2_4.EndBit:=4;
  M2_4.PLCTag:=MB2;

  M2_5.StartBit:=5;
  M2_5.EndBit:=5;
  M2_5.PLCTag:=MB2;

  M2_6.StartBit:=6;
  M2_6.EndBit:=6;
  M2_6.PLCTag:=MB2;

  M2_7.StartBit:=7;
  M2_7.EndBit:=7;
  M2_7.PLCTag:=MB2;

  MB17_:= TPLCBlock.Create(nil);
  MB17_.PLCRack:=0;
  MB17_.PLCSlot:=0;
  MB17_.PLCStation:=2;
  MB17_.MemAddress:=17;
  MB17_.MemReadFunction:=3;
  MB17_.AutoRead:=true;
  MB17_.AutoWrite:=true;
  MB17_.TagType:= TTagType.pttByte;
  MB17_.Size:=1;
  MB17_.RefreshTime:=500;
  MB17_.ProtocolDriver:=ISOTCPDriver1;

  MB17:= TPLCBlockElement.Create(nil);
  MB17.Index:=0;
  MB17.PLCBlock:=MB17_;

  M17_0:= TTagBit.Create(nil);
  M17_1:= TTagBit.Create(nil);
  M17_2:= TTagBit.Create(nil);
  M17_3:= TTagBit.Create(nil);
  M17_4:= TTagBit.Create(nil);
  M17_5:= TTagBit.Create(nil);
  M17_6:= TTagBit.Create(nil);
  M17_7:= TTagBit.Create(nil);

  M17_0.StartBit:=0;
  M17_0.EndBit:=0;
  M17_0.PLCTag:=MB17;

  M17_1.StartBit:=1;
  M17_1.EndBit:=1;
  M17_1.PLCTag:=MB17;

  M17_2.StartBit:=2;
  M17_2.EndBit:=2;
  M17_2.PLCTag:=MB17;

  M17_3.StartBit:=3;
  M17_3.EndBit:=3;
  M17_3.PLCTag:=MB17;

  M17_4.StartBit:=4;
  M17_4.EndBit:=4;
  M17_4.PLCTag:=MB17;

  M17_5.StartBit:=5;
  M17_5.EndBit:=5;
  M17_5.PLCTag:=MB17;

  M17_6.StartBit:=6;
  M17_6.EndBit:=6;
  M17_6.PLCTag:=MB17;

  M17_7.StartBit:=7;
  M17_7.EndBit:=7;
  M17_7.PLCTag:=MB17;

  MB30_:= TPLCBlock.Create(nil);
  MB30_.PLCRack:=0;
  MB30_.PLCSlot:=0;
  MB30_.PLCStation:=2;
  MB30_.MemAddress:=30;
  MB30_.MemReadFunction:=3;
  MB30_.AutoRead:=true;
  MB30_.AutoWrite:=false;
  MB30_.TagType:= TTagType.pttByte;
  MB30_.Size:=1;
  MB30_.RefreshTime:=500;
  MB30_.ProtocolDriver:=ISOTCPDriver1;

  MB30:= TPLCBlockElement.Create(nil);
  MB30.Index:=0;
  MB30.PLCBlock:=MB30_;

  M30_0:= TTagBit.Create(nil);
  M30_1:= TTagBit.Create(nil);
  M30_2:= TTagBit.Create(nil);
  M30_3:= TTagBit.Create(nil);
  M30_4:= TTagBit.Create(nil);
  M30_5:= TTagBit.Create(nil);
  M30_6:= TTagBit.Create(nil);
  M30_7:= TTagBit.Create(nil);

  M30_0.StartBit:=0;
  M30_0.EndBit:=0;
  M30_0.PLCTag:=MB30;

  M30_1.StartBit:=1;
  M30_1.EndBit:=1;
  M30_1.PLCTag:=MB30;

  M30_2.StartBit:=2;
  M30_2.EndBit:=2;
  M30_2.PLCTag:=MB30;

  M30_3.StartBit:=3;
  M30_3.EndBit:=3;
  M30_3.PLCTag:=MB30;

  M30_4.StartBit:=4;
  M30_4.EndBit:=4;
  M30_4.PLCTag:=MB30;

  M30_5.StartBit:=5;
  M30_5.EndBit:=5;
  M30_5.PLCTag:=MB30;

  M30_6.StartBit:=6;
  M30_6.EndBit:=6;
  M30_6.PLCTag:=MB30;

  M30_7.StartBit:=7;
  M30_7.EndBit:=7;
  M30_7.PLCTag:=MB30;

  MB31_:= TPLCBlock.Create(nil);
  MB31_.PLCRack:=0;
  MB31_.PLCSlot:=0;
  MB31_.PLCStation:=2;
  MB31_.MemAddress:=31;
  MB31_.MemReadFunction:=3;
  MB31_.AutoRead:=true;
  MB31_.AutoWrite:=true;
  MB31_.TagType:= TTagType.pttByte;
  MB31_.Size:=1;
  MB31_.RefreshTime:=500;
  MB31_.ProtocolDriver:=ISOTCPDriver1;

  MB31:= TPLCBlockElement.Create(nil);
  MB31.Index:=0;
  MB31.PLCBlock:=MB31_;

  M31_0:= TTagBit.Create(nil);
  M31_1:= TTagBit.Create(nil);
  M31_2:= TTagBit.Create(nil);
  M31_3:= TTagBit.Create(nil);
  M31_4:= TTagBit.Create(nil);
  M31_5:= TTagBit.Create(nil);
  M31_6:= TTagBit.Create(nil);
  M31_7:= TTagBit.Create(nil);

  M31_0.StartBit:=0;
  M31_0.EndBit:=0;
  M31_0.PLCTag:=MB31;

  M31_1.StartBit:=1;
  M31_1.EndBit:=1;
  M31_1.PLCTag:=MB31;

  M31_2.StartBit:=2;
  M31_2.EndBit:=2;
  M31_2.PLCTag:=MB31;

  M31_3.StartBit:=3;
  M31_3.EndBit:=3;
  M31_3.PLCTag:=MB31;

  M31_4.StartBit:=4;
  M31_4.EndBit:=4;
  M31_4.PLCTag:=MB31;

  M31_5.StartBit:=5;
  M31_5.EndBit:=5;
  M31_5.PLCTag:=MB31;

  M31_6.StartBit:=6;
  M31_6.EndBit:=6;
  M31_6.PLCTag:=MB31;

  M31_7.StartBit:=7;
  M31_7.EndBit:=7;
  M31_7.PLCTag:=MB31;

  MB32_:= TPLCBlock.Create(nil);
  MB32_.PLCRack:=0;
  MB32_.PLCSlot:=0;
  MB32_.PLCStation:=2;
  MB32_.MemAddress:=32;
  MB32_.MemReadFunction:=3;
  MB32_.AutoRead:=true;
  MB32_.AutoWrite:=true;
  MB32_.TagType:= TTagType.pttByte;
  MB32_.Size:=1;
  MB32_.RefreshTime:=500;
  MB32_.ProtocolDriver:=ISOTCPDriver1;

  MB32:= TPLCBlockElement.Create(nil);
  MB32.Index:=0;
  MB32.PLCBlock:=MB32_;

  M32_0:= TTagBit.Create(nil);
  M32_1:= TTagBit.Create(nil);
  M32_2:= TTagBit.Create(nil);
  M32_3:= TTagBit.Create(nil);
  M32_4:= TTagBit.Create(nil);
  M32_5:= TTagBit.Create(nil);
  M32_6:= TTagBit.Create(nil);
  M32_7:= TTagBit.Create(nil);

  M32_0.StartBit:=0;
  M32_0.EndBit:=0;
  M32_0.PLCTag:=MB32;

  M32_1.StartBit:=1;
  M32_1.EndBit:=1;
  M32_1.PLCTag:=MB32;

  M32_2.StartBit:=2;
  M32_2.EndBit:=2;
  M32_2.PLCTag:=MB32;

  M32_3.StartBit:=3;
  M32_3.EndBit:=3;
  M32_3.PLCTag:=MB32;

  M32_4.StartBit:=4;
  M32_4.EndBit:=4;
  M32_4.PLCTag:=MB32;

  M32_5.StartBit:=5;
  M32_5.EndBit:=5;
  M32_5.PLCTag:=MB32;

  M32_6.StartBit:=6;
  M32_6.EndBit:=6;
  M32_6.PLCTag:=MB32;

  M32_7.StartBit:=7;
  M32_7.EndBit:=7;
  M32_7.PLCTag:=MB32;

  MB34_:= TPLCBlock.Create(nil);
  MB34_.PLCRack:=0;
  MB34_.PLCSlot:=0;
  MB34_.PLCStation:=2;
  MB34_.MemAddress:=34;
  MB34_.MemReadFunction:=3;
  MB34_.AutoRead:=true;
  MB34_.AutoWrite:=true;
  MB34_.TagType:= TTagType.pttByte;
  MB34_.Size:=1;
  MB34_.RefreshTime:=500;
  MB34_.ProtocolDriver:=ISOTCPDriver1;

  MB34:= TPLCBlockElement.Create(nil);
  MB34.Index:=0;
  MB34.PLCBlock:=MB34_;

  M34_0:= TTagBit.Create(nil);
  M34_1:= TTagBit.Create(nil);
  M34_2:= TTagBit.Create(nil);
  M34_3:= TTagBit.Create(nil);
  M34_4:= TTagBit.Create(nil);
  M34_5:= TTagBit.Create(nil);
  M34_6:= TTagBit.Create(nil);
  M34_7:= TTagBit.Create(nil);

  M34_0.StartBit:=0;
  M34_0.EndBit:=0;
  M34_0.PLCTag:=MB34;

  M34_1.StartBit:=1;
  M34_1.EndBit:=1;
  M34_1.PLCTag:=MB34;

  M34_2.StartBit:=2;
  M34_2.EndBit:=2;
  M34_2.PLCTag:=MB34;

  M34_3.StartBit:=3;
  M34_3.EndBit:=3;
  M34_3.PLCTag:=MB34;

  M34_4.StartBit:=4;
  M34_4.EndBit:=4;
  M34_4.PLCTag:=MB34;

  M34_5.StartBit:=5;
  M34_5.EndBit:=5;
  M34_5.PLCTag:=MB34;

  M34_6.StartBit:=6;
  M34_6.EndBit:=6;
  M34_6.PLCTag:=MB34;

  M34_7.StartBit:=7;
  M34_7.EndBit:=7;
  M34_7.PLCTag:=MB34;

  MB98_:= TPLCBlock.Create(nil);
  MB98_.PLCRack:=0;
  MB98_.PLCSlot:=0;
  MB98_.PLCStation:=2;
  MB98_.MemAddress:=98;
  MB98_.MemReadFunction:=3;
  MB98_.AutoRead:=true;
  MB98_.AutoWrite:=true;
  MB98_.TagType:= TTagType.pttByte;
  MB98_.Size:=1;
  MB98_.RefreshTime:=500;
  MB98_.ProtocolDriver:=ISOTCPDriver1;

  MB98:= TPLCBlockElement.Create(nil);
  MB98.Index:=0;
  MB98.PLCBlock:=MB98_;

  M98_0:= TTagBit.Create(nil);
  M98_1:= TTagBit.Create(nil);
  M98_2:= TTagBit.Create(nil);
  M98_3:= TTagBit.Create(nil);
  M98_4:= TTagBit.Create(nil);
  M98_5:= TTagBit.Create(nil);
  M98_6:= TTagBit.Create(nil);
  M98_7:= TTagBit.Create(nil);

  M98_0.StartBit:=0;
  M98_0.EndBit:=0;
  M98_0.PLCTag:=MB98;

  M98_1.StartBit:=1;
  M98_1.EndBit:=1;
  M98_1.PLCTag:=MB98;

  M98_2.StartBit:=2;
  M98_2.EndBit:=2;
  M98_2.PLCTag:=MB30;

  M98_3.StartBit:=3;
  M98_3.EndBit:=3;
  M98_3.PLCTag:=MB98;

  M98_4.StartBit:=4;
  M98_4.EndBit:=4;
  M98_4.PLCTag:=MB98;

  M98_5.StartBit:=5;
  M98_5.EndBit:=5;
  M98_5.PLCTag:=MB98;

  M98_6.StartBit:=6;
  M98_6.EndBit:=6;
  M98_6.PLCTag:=MB98;

  M98_7.StartBit:=7;
  M98_7.EndBit:=7;
  M98_7.PLCTag:=MB98;

  MB101_:= TPLCBlock.Create(nil);
  MB101_.PLCRack:=0;
  MB101_.PLCSlot:=0;
  MB101_.PLCStation:=2;
  MB101_.MemAddress:=101;
  MB101_.MemReadFunction:=3;
  MB101_.AutoRead:=true;
  MB101_.AutoWrite:=false;
  MB101_.TagType:= TTagType.pttByte;
  MB101_.Size:=1;
  MB101_.RefreshTime:=200;
  MB101_.ProtocolDriver:=ISOTCPDriver1;

  MB101:= TPLCBlockElement.Create(nil);
  MB101.Index:=0;
  MB101.PLCBlock:=MB101_;

  //if boolean(i and 36) then
  //showmessage('25 and 26');
  //if boolean(i and 25) then
  //showmessage('25 and 25');

  M101_0:= TTagBit.Create(nil);
  M101_1:= TTagBit.Create(nil);
  M101_2:= TTagBit.Create(nil);
  M101_3:= TTagBit.Create(nil);
  M101_4:= TTagBit.Create(nil);
  M101_5:= TTagBit.Create(nil);
  M101_6:= TTagBit.Create(nil);
  M101_7:= TTagBit.Create(nil);

  M101_0.StartBit:=0;
  M101_0.EndBit:=0;
  M101_0.PLCTag:=MB101;

  M101_1.StartBit:=1;
  M101_1.EndBit:=1;
  M101_1.PLCTag:=MB101;

  M101_2.StartBit:=2;
  M101_2.EndBit:=2;
  M101_2.PLCTag:=MB101;

  M101_3.StartBit:=3;
  M101_3.EndBit:=3;
  M101_3.PLCTag:=MB101;

  M101_4.StartBit:=4;
  M101_4.EndBit:=4;
  M101_4.PLCTag:=MB101;

  M101_5.StartBit:=5;
  M101_5.EndBit:=5;
  M101_5.PLCTag:=MB101;

  M101_6.StartBit:=6;
  M101_6.EndBit:=6;
  M101_6.PLCTag:=MB101;

  M101_7.StartBit:=7;
  M101_7.EndBit:=7;
  M101_7.PLCTag:=MB101;

  QB0_:= TPLCBlock.Create(nil);
  QB0_.PLCRack:=0;
  QB0_.PLCSlot:=0;
  QB0_.PLCStation:=2;
  QB0_.MemAddress:=0;
  QB0_.MemReadFunction:=2;
  QB0_.AutoRead:=true;
  QB0_.AutoWrite:=false;
  QB0_.TagType:= TTagType.pttByte;
  QB0_.Size:=1;
  QB0_.RefreshTime:=500;
  QB0_.ProtocolDriver:=ISOTCPDriver1;

  QB0:= TPLCBlockElement.Create(nil);
  QB0.Index:=0;
  QB0.PLCBlock:=QB0_;

  Q0_0:= TTagBit.Create(nil);
  Q0_1:= TTagBit.Create(nil);
  Q0_2:= TTagBit.Create(nil);
  Q0_3:= TTagBit.Create(nil);
  Q0_4:= TTagBit.Create(nil);
  Q0_5:= TTagBit.Create(nil);
  Q0_6:= TTagBit.Create(nil);
  Q0_7:= TTagBit.Create(nil);

  Q0_0.StartBit:=0;
  Q0_0.EndBit:=0;
  Q0_0.PLCTag:=QB0;

  Q0_1.StartBit:=1;
  Q0_1.EndBit:=1;
  Q0_1.PLCTag:=QB0;

  Q0_2.StartBit:=2;
  Q0_2.EndBit:=2;
  Q0_2.PLCTag:=QB0;

  Q0_3.StartBit:=3;
  Q0_3.EndBit:=3;
  Q0_3.PLCTag:=QB0;

  Q0_4.StartBit:=4;
  Q0_4.EndBit:=4;
  Q0_4.PLCTag:=QB0;

  Q0_5.StartBit:=5;
  Q0_5.EndBit:=5;
  Q0_5.PLCTag:=QB0;

  Q0_6.StartBit:=6;
  Q0_6.EndBit:=6;
  Q0_6.PLCTag:=QB0;

  Q0_7.StartBit:=7;
  Q0_7.EndBit:=7;
  Q0_7.PLCTag:=QB0;

  QB201_:= TPLCBlock.Create(nil);
  QB201_.PLCRack:=0;
  QB201_.PLCSlot:=0;
  QB201_.PLCStation:=2;
  QB201_.MemAddress:=201;
  QB201_.MemReadFunction:=2;
  QB201_.AutoRead:=true;
  QB201_.AutoWrite:=false;
  QB201_.TagType:= TTagType.pttByte;
  QB201_.Size:=1;
  QB201_.RefreshTime:=500;
  QB201_.ProtocolDriver:=ISOTCPDriver1;

  QB201:= TPLCBlockElement.Create(nil);
  QB201.Index:=0;
  QB201.PLCBlock:=QB201_;

  Q201_0:= TTagBit.Create(nil);
  Q201_1:= TTagBit.Create(nil);
  Q201_2:= TTagBit.Create(nil);
  Q201_3:= TTagBit.Create(nil);
  Q201_4:= TTagBit.Create(nil);
  Q201_5:= TTagBit.Create(nil);
  Q201_6:= TTagBit.Create(nil);
  Q201_7:= TTagBit.Create(nil);

  Q201_0.StartBit:=0;
  Q201_0.EndBit:=0;
  Q201_0.PLCTag:=QB201;

  Q201_1.StartBit:=1;
  Q201_1.EndBit:=1;
  Q201_1.PLCTag:=QB201;

  Q201_2.StartBit:=2;
  Q201_2.EndBit:=2;
  Q201_2.PLCTag:=QB201;

  Q201_3.StartBit:=3;
  Q201_3.EndBit:=3;
  Q201_3.PLCTag:=QB201;

  Q201_4.StartBit:=4;
  Q201_4.EndBit:=4;
  Q201_4.PLCTag:=QB201;

  Q201_5.StartBit:=5;
  Q201_5.EndBit:=5;
  Q201_5.PLCTag:=QB201;

  Q201_6.StartBit:=6;
  Q201_6.EndBit:=6;
  Q201_6.PLCTag:=QB201;

  Q201_7.StartBit:=7;
  Q201_7.EndBit:=7;
  Q201_7.PLCTag:=QB201;

  QB209_:= TPLCBlock.Create(nil);
  QB209_.PLCRack:=0;
  QB209_.PLCSlot:=0;
  QB209_.PLCStation:=2;
  QB209_.MemAddress:=209;
  QB209_.MemReadFunction:=2;
  QB209_.AutoRead:=true;
  QB209_.AutoWrite:=false;
  QB209_.TagType:= TTagType.pttByte;
  QB209_.Size:=1;
  QB209_.RefreshTime:=500;
  QB209_.ProtocolDriver:=ISOTCPDriver1;

  QB209:= TPLCBlockElement.Create(nil);
  QB209.Index:=0;
  QB209.PLCBlock:=QB209_;

  Q209_0:= TTagBit.Create(nil);
  Q209_1:= TTagBit.Create(nil);
  Q209_2:= TTagBit.Create(nil);
  Q209_3:= TTagBit.Create(nil);
  Q209_4:= TTagBit.Create(nil);
  Q209_5:= TTagBit.Create(nil);
  Q209_6:= TTagBit.Create(nil);
  Q209_7:= TTagBit.Create(nil);

  Q209_0.StartBit:=0;
  Q209_0.EndBit:=0;
  Q209_0.PLCTag:=QB209;

  Q209_1.StartBit:=1;
  Q209_1.EndBit:=1;
  Q209_1.PLCTag:=QB209;

  Q209_2.StartBit:=2;
  Q209_2.EndBit:=2;
  Q209_2.PLCTag:=QB209;

  Q209_3.StartBit:=3;
  Q209_3.EndBit:=3;
  Q209_3.PLCTag:=QB209;

  Q209_4.StartBit:=4;
  Q209_4.EndBit:=4;
  Q209_4.PLCTag:=QB209;

  Q209_5.StartBit:=5;
  Q209_5.EndBit:=5;
  Q209_5.PLCTag:=QB209;

  Q209_6.StartBit:=6;
  Q209_6.EndBit:=6;
  Q209_6.PLCTag:=QB209;

  Q209_7.StartBit:=7;
  Q209_7.EndBit:=7;
  Q209_7.PLCTag:=QB209;

  IB0_:= TPLCBlock.Create(nil);
  IB0_.PLCRack:=0;
  IB0_.PLCSlot:=0;
  IB0_.PLCStation:=2;
  IB0_.MemAddress:=0;
  IB0_.MemReadFunction:=1;
  IB0_.AutoRead:=true;
  IB0_.AutoWrite:=false;
  IB0_.TagType:= TTagType.pttByte;
  IB0_.Size:=1;
  IB0_.RefreshTime:=500;
  IB0_.ProtocolDriver:=ISOTCPDriver1;

  IB0:= TPLCBlockElement.Create(nil);
  IB0.Index:=0;
  IB0.PLCBlock:=IB0_;

  I0_0:= TTagBit.Create(nil);
  I0_1:= TTagBit.Create(nil);
  I0_2:= TTagBit.Create(nil);
  I0_3:= TTagBit.Create(nil);
  I0_4:= TTagBit.Create(nil);
  I0_5:= TTagBit.Create(nil);
  I0_6:= TTagBit.Create(nil);
  I0_7:= TTagBit.Create(nil);

  I0_0.StartBit:=0;
  I0_0.EndBit:=0;
  I0_0.PLCTag:=IB0;

  I0_1.StartBit:=1;
  I0_1.EndBit:=1;
  I0_1.PLCTag:=IB0;

  I0_2.StartBit:=2;
  I0_2.EndBit:=2;
  I0_2.PLCTag:=IB0;

  I0_3.StartBit:=3;
  I0_3.EndBit:=3;
  I0_3.PLCTag:=IB0;

  I0_4.StartBit:=4;
  I0_4.EndBit:=4;
  I0_4.PLCTag:=IB0;

  I0_5.StartBit:=5;
  I0_5.EndBit:=5;
  I0_5.PLCTag:=IB0;

  I0_6.StartBit:=6;
  I0_6.EndBit:=6;
  I0_6.PLCTag:=IB0;

  I0_7.StartBit:=7;
  I0_7.EndBit:=7;
  I0_7.PLCTag:=IB0;

  P1.Parent:=StatusBar1;
  P2.Parent:=StatusBar1;
  P3.Parent:=StatusBar1;
  P4.Parent:=StatusBar1;
  P5.Parent:=StatusBar1;
  P6.Parent:=StatusBar1;

  DB10_DBD42_:= TPLCBlock.Create(nil);
  DB10_DBD42_.PLCRack:=0;
  DB10_DBD42_.PLCSlot:=0;
  DB10_DBD42_.PLCStation:=2;
  DB10_DBD42_.MemAddress:=42;
  DB10_DBD42_.MemFile_DB:=10;
  DB10_DBD42_.MemReadFunction:=4;
  DB10_DBD42_.MemWriteFunction:=0;
  DB10_DBD42_.AutoRead:=true;
  DB10_DBD42_.AutoWrite:=true;
  DB10_DBD42_.TagType:= TTagType.pttFloat;
  DB10_DBD42_.Size:=1;
  DB10_DBD42_.SwapBytes:=true;
  DB10_DBD42_.SwapDWords:=false;
  DB10_DBD42_.SwapWords:=true;
  DB10_DBD42_.RefreshTime:=1000;
  DB10_DBD42_.ProtocolDriver:=ISOTCPDriver1;

  DB10_DBD42:= TPLCBlockElement.Create(nil);
  DB10_DBD42.Index:=0;
  DB10_DBD42.PLCBlock:=DB10_DBD42_;

  HMIEdit1.PLCTag:=DB10_DBD42;
  HMICheckBox1.PLCTag:=M98_0;
  Label41.Caption:='LineSpeed Upper: '+DB10_DBD42.Value.ToString+' (M17.0=1)';
end;

procedure TForm1.MaskEditIPEditingDone(Sender: TObject);
begin
  MaskEditIP.Caption:=RepairIPAddress(MaskEditIP.Caption);
  TCP_UDPPort1.Host:=MaskEditIP.Text;
end;

end.

