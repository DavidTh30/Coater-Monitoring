unit Unit4;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    Bevel1: TBevel;
    Image1: TImage;
    Interlock1: TLabel;
    Interlock10: TLabel;
    Interlock11: TLabel;
    Interlock12: TLabel;
    Interlock13: TLabel;
    Interlock14: TLabel;
    Interlock15: TLabel;
    Interlock16: TLabel;
    Shape18: TShape;
    Status_: TLabel;
    Interlock2: TLabel;
    Interlock3: TLabel;
    Interlock4: TLabel;
    Interlock5: TLabel;
    Interlock6: TLabel;
    Interlock7: TLabel;
    Interlock8: TLabel;
    Interlock9: TLabel;
    InterlockName: TLabel;
    LabelDateTime: TLabel;
    Timer1: TTimer;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Timer1Timer(Sender: TObject);
    procedure Loop_();
  private

  public
    InterlockName_:string;
    DateTime_:string;
    DefaultColor:TColor;
    DefaultWidth:integer;
  end;

var
  Form2: TForm2;

implementation

uses Unit2;

{$R *.lfm}

{ TForm2 }
procedure TForm2.Loop_();
begin
  InterlockName.Caption:=InterlockName_;
  LabelDateTime.Caption:=DateTime_;
  DateTime_:=FormatDateTime('dd/mm/yyyy ', Now())+TimeToStr(Time);

  if ProductionView then self.Width:=DefaultWidth
  else self.Width:=DefaultWidth*2;

  if (InterlockName_ = 'Corona roll Interlock') then
  begin
    if ProductionView then
    begin
      Interlock1.Caption:='0:  Corona Roll On by production';
      Interlock2.Caption:='1:  Coating Mode';
      Status_.Caption:='Corona Roll Run';
    end
    else
    begin
      Interlock1.Caption:='0:  Corona Roll On_Hmi_Cmd (M34.0=1)  << Done by HMI';
      Interlock2.Caption:='1:  Coating Mode (M30.0=1)            << Done by HMI';
      Status_.Caption:='Corona Roll Run (Q209.0=1)';
    end;
  end;

  if (InterlockName_ = 'Corona Generator Interlock') then
  begin
    if ProductionView then
    begin
      Interlock1.Caption:='0:  Generator On by production';
      Interlock2.Caption:='1:  Generator Off by production';
      Interlock3.Caption:='2:  Not Bypass Mode';
      Interlock4.Caption:='3:  E-Stop OK';
      Interlock5.Caption:='4:  System On';
      Interlock6.Caption:='5:  Coating Mode';
      Interlock7.Caption:='6.1 or 7.3: MDO Film Brake';
      Interlock8.Caption:='6.2 or 7.3: All zone TDO Film Break';
      Interlock9.Caption:='6.3: Bypass Filmbrake';
      Interlock10.Caption:='7:  Electrode In position';
      Interlock11.Caption:='8:  Corona Exhaust Fan Run';
      Status_.Caption:='Corona Start';
    end
    else
    begin
      Interlock1.Caption:='0:  GenOn_Hmi_Cmd (M0.6=1)                  << Done by HMI';
      Interlock2.Caption:='1:  GenOff_Hmi_Cmd (M0.7=0)                 << Done by HMI';
      Interlock3.Caption:='2:  Not Bypass Mode (M30.1=0)               << Done by HMI';
      Interlock4.Caption:='3:  E-Stop OK (I0.0=1)';
      Interlock5.Caption:='4:  Infeed On (System On) (Q201.0=1)        << Done by HMI and Hardware';
      Interlock6.Caption:='5:  Coating Mode (M30.0=1)                  << Done by HMI';
      Interlock7.Caption:='6.1 or 7.3: MDO Film Brake (I0.2=1)';
      Interlock8.Caption:='6.2 or 7.3: All zone TDO Film Break (I0.7=1)';
      Interlock9.Caption:='6.3: Bypass Filmbrake (M98.0=1)             << Done by HMI';
      Interlock10.Caption:='7:  Electrode In position (I0.5=1)         << Done by HMI and Hardware';
      Interlock11.Caption:='8:  Corona Exhaust Fan Run (Q0.1=1)        << Done by HMI and Hardware';
      Status_.Caption:='Corona Start (Q0.5=1)';
    end;
  end;

  if (InterlockName_ = 'Corona Exhaust Fan Interlock') then
  begin
    if ProductionView then
    begin
      Interlock1.Caption:='0:  Exhaust Fan Run by production';
      Interlock2.Caption:='1:  Exhaust Fan Off by production';
      Interlock3.Caption:='2:  E-Stop OK';
      Status_.Caption:='Corona Exhaust Fan Run';
    end
    else
    begin
      Interlock1.Caption:='0:  Exhaust Fan Run HMI Cmd (M22.0=1) << Done by HMI';
      Interlock2.Caption:='1:  Exhaust Fan Off HMI Cmd (M22.1=0) << Done by HMI';
      Interlock3.Caption:='2:  E-Stop OK (I0.0=1)';
      Status_.Caption:='Corona Exhaust Fan Run (Q0.1=1)';
    end;
  end;

  if (InterlockName_ = 'Corona Electrode Interlock') then
  begin
    if ProductionView then
    begin
      Interlock1.Caption:='0:  Electrode In by production';
      Interlock2.Caption:='1:  Electrode Out by production';
      Interlock3.Caption:='2:  E-Stop OK';
      Interlock4.Caption:='3.1 or 3.3: MDO Film Brake';
      Interlock5.Caption:='3.2 or 3.3: All zone TDO Film Break';
      Interlock6.Caption:='3.3: Bypass Filmbrake';
      Interlock7.Caption:='4:  '+'LineSpeed Upper: '+DB10_DBD42.Value.ToString+' m/min';
      Interlock8.Caption:='5:  Corona Exhaust Fan Run';
      Status_.Caption:='Electrode In Position';
    end
    else
    begin
      Interlock1.Caption:='0:  Electrode In HMI Cmd (M2.0=1)                              << Done by HMI';
      Interlock2.Caption:='1:  Electrode Out HMI Cmd (M2.1=0)                             << Done by HMI';
      Interlock3.Caption:='2:  E-Stop OK (I0.0=1)';
      Interlock4.Caption:='3.1 or 3.3: MDO Film Brake (I0.2=1)';
      Interlock5.Caption:='3.2 or 3.3: All zone TDO Film Break (I0.7=1)';
      Interlock6.Caption:='3.3: Bypass Filmbrake (M98.0=1)                               << Done by HMI';
      Interlock7.Caption:='4:  '+'LineSpeed Upper: '+DB10_DBD42.Value.ToString+' m/min'+' (M17.0=1)';
      Interlock8.Caption:='5:  Corona Exhaust Fan Run (Q0.1=1)';
      Status_.Caption:='Electrode In Position (Q0.3=1)                                    << Done by HMI and Hardware';
    end;
  end;

  if (InterlockName_ = 'Cartridge Valve Interlock') then
  begin
    if ProductionView then
    begin
      Interlock1.Caption:='0:  Cartridge In by production';
      Interlock2.Caption:='1:  Cartridge Out by production';
      Interlock3.Caption:='2:  E-Stop OK';
      Interlock4.Caption:='3:  System On';
      Interlock5.Caption:='4.1 or 4.3: MDO Film Brake';
      Interlock6.Caption:='4.2 or 4.3: All zone TDO Film Break';
      Interlock7.Caption:='4.3: Bypass Filmbrake';
      Interlock8.Caption:='5:  '+'LineSpeed Upper: '+DB10_DBD42.Value.ToString+' m/min';
      Status_.Caption:='Gravure Roll Run';
    end
    else
    begin
      Interlock1.Caption:='0:  Cartridge In HMI Cmd (M2.2=1)                           << Done by HMI';
      Interlock2.Caption:='1:  Cartridge Out HMI Cmd (M2.3=0)                          << Done by HMI';
      Interlock3.Caption:='2:  E-Stop OK (I0.0=1)';
      Interlock4.Caption:='3:  Infeed On (System On) (Q201.0=1)                           << Done by HMI and Hardware';
      Interlock5.Caption:='4.1 or 4.3: MDO Film Brake (I0.2=1)';
      Interlock6.Caption:='4.2 or 4.3: All zone TDO Film Break (I0.7=1)';
      Interlock7.Caption:='4.3: Bypass Filmbrake (M98.0=1)                                << Done by HMI';
      Interlock8.Caption:='5:  '+'LineSpeed Upper: '+DB10_DBD42.Value.ToString+' m/min'+' (M17.0=1)';
      Status_.Caption:='Gravure Roll Run (Q0.2=1)                                         << Done by HMI and Hardware';
    end;
  end;

  if (InterlockName_ = 'Gravure Roll Interlock') then
  begin
    if ProductionView then
    begin
      Interlock1.Caption:='0:  Gravure Roll Run by production';
      Interlock2.Caption:='1:  Gravure Roll Off by production';
      Interlock3.Caption:='2:  System On';
      Status_.Caption:='Gravure Roll Run';
    end
    else
    begin
      Interlock1.Caption:='0:  Gravure Roll Run HMI Cmd (M33.0=1)      << Done by HMI';
      Interlock2.Caption:='1:  Gravure Roll Off HMI Cmd (M33.1=0)      << Done by HMI';
      Interlock3.Caption:='2:  Infeed On (System On) (Q201.0=1)        << Done by HMI and Hardware';
      Status_.Caption:='Gravure Roll Run (Q213.0=1)';
    end;
  end;

  if (InterlockName_ = 'Takeoff Roll Interlock') then
  begin
    if ProductionView then
    begin
      Interlock1.Caption:='0:  Takeoff Roll Run by production';
      Interlock2.Caption:='1:  Takeoff Roll Off by production';
      Interlock3.Caption:='2:  System On';
      Status_.Caption:='Takeoff Roll Run';
    end
    else
    begin
      Interlock1.Caption:='0:  Takeoff Roll Run HMI Cmd (M35.0=1)      << Done by HMI';
      Interlock2.Caption:='1:  Takeoff Roll Off HMI Cmd (M35.1=0)      << Done by HMI';
      Interlock3.Caption:='2:  Infeed On (System On) (Q201.0=1)        << Done by HMI and Hardware';
      Status_.Caption:='Takeoff Roll Run (Q217.0=1)';
    end;
  end;

  if not Communication_Active then
  begin
    Interlock1.Color:=clSilver;
    Interlock2.Color:=clSilver;
    Interlock3.Color:=clSilver;
    Interlock4.Color:=clSilver;
    Interlock5.Color:=clSilver;
    Interlock6.Color:=clSilver;
    Interlock7.Color:=clSilver;
    Interlock8.Color:=clSilver;
    Interlock9.Color:=clSilver;
    Interlock10.Color:=clSilver;
    Interlock11.Color:=clSilver;
    Interlock12.Color:=clSilver;
    Interlock13.Color:=clSilver;
    Interlock14.Color:=clSilver;
    Interlock15.Color:=clSilver;
    Interlock16.Color:=clSilver;
    Status_.Color:=clSilver;
    exit;
  end;
  if Communication_Active and (Interlock1.Color=clSilver) then
  begin
    Interlock1.ParentColor:=true;
    Interlock2.ParentColor:=true;
    Interlock3.ParentColor:=true;
    Interlock4.ParentColor:=true;
    Interlock5.ParentColor:=true;
    Interlock6.ParentColor:=true;
    Interlock7.ParentColor:=true;
    Interlock8.ParentColor:=true;
    Interlock9.ParentColor:=true;
    Interlock10.ParentColor:=true;
    Interlock11.ParentColor:=true;
    Interlock12.ParentColor:=true;
    Interlock13.ParentColor:=true;
    Interlock14.ParentColor:=true;
    Interlock15.ParentColor:=true;
    Interlock16.ParentColor:=true;
    Status_.ParentColor:=true;
  end;

  if (InterlockName_ = 'Corona roll Interlock') then
  begin
    if M34_0.Value > 0 then begin Interlock1.Color:=clLime; end
      else begin Interlock1.ParentColor:=true; end; //Interlock1.Color:=clDefault; //DefaultColor
    if M30_0.Value > 0 then begin Interlock2.Color:=clLime; end
      else begin Interlock2.ParentColor:=true; end;
    if Q209_0.Value > 0 then begin Status_.Color:=clLime; end
    else begin Status_.ParentColor:=true; end;
  end;

  if (InterlockName_ = 'Corona Exhaust Fan Interlock') then
  begin
    if M22_0.Value > 0 then begin Interlock1.Color:=clLime; end
    else begin Interlock1.ParentColor:=true; end;
    if M22_1.Value < 1 then begin Interlock2.Color:=clLime; end
    else begin Interlock2.ParentColor:=true; end;
    if I0_0.Value > 0 then begin Interlock3.Color:=clLime; end
    else begin Interlock3.ParentColor:=true; end;
    if Q0_1.Value > 0 then begin Status_.Color:=clLime;end
    else begin Status_.ParentColor:=true; end;
  end;

  if (InterlockName_ = 'Corona Generator Interlock') then
  begin
    if M0_6.Value > 0 then begin Interlock1.Color:=clLime; end
    else begin Interlock1.ParentColor:=true; end;
    if M0_7.Value > 0 then begin Interlock2.ParentColor:=true; end
    else begin Interlock2.Color:=clLime; end;
    if M30_1.Value > 0 then begin Interlock3.ParentColor:=true; end
    else begin Interlock3.Color:=clLime; end;
    if I0_0.Value > 0 then begin Interlock4.Color:=clLime; end
    else begin Interlock4.ParentColor:=true; end;
    if Q201_0.Value > 0 then begin Interlock5.Color:=clLime; end
    else begin Interlock5.ParentColor:=true; end;
    if M30_0.Value > 0 then begin Interlock6.Color:=clLime; end
    else begin Interlock6.ParentColor:=true;end;
    if (I0_2.Value > 0) or (M98_0.Value > 0) then begin Interlock7.Color:=clLime;end
    else begin Interlock7.ParentColor:=true; end;
    if (I0_7.Value > 0) or (M98_0.Value > 0) then begin Interlock8.Color:=clLime; end
    else begin Interlock8.ParentColor:=true; end;
    if M98_0.Value > 0 then begin Interlock9.Color:=clLime; end
    else begin Interlock9.ParentColor:=true; end;
    if I0_5.Value > 0 then begin Interlock10.Color:=clLime; end
    else begin Interlock10.ParentColor:=true; end;
    if Q0_1.Value > 0 then begin Interlock11.Color:=clLime; end
    else begin Interlock11.ParentColor:=true; end;
    if Q0_5.Value > 0 then begin Status_.Color:=clLime; end
    else begin Status_.ParentColor:=true; end;
  end;

  if (InterlockName_ = 'Corona Electrode Interlock') then
  begin
    if M2_0.Value > 0 then begin Interlock1.Color:=clLime; end
    else begin Interlock1.ParentColor:=true; end;
    if M2_1.Value > 0 then begin Interlock2.ParentColor:=true; end
    else begin Interlock2.Color:=clLime; end;
    if I0_0.Value > 0 then begin Interlock3.Color:=clLime; end
    else begin Interlock3.ParentColor:=true; end;
    if (I0_2.Value > 0) or (M98_0.Value > 0) then  begin Interlock4.Color:=clLime; end
    else  begin Interlock4.ParentColor:=true; end;
    if (I0_7.Value > 0) or (M98_0.Value > 0) then  begin Interlock5.Color:=clLime; end
    else  begin Interlock5.ParentColor:=true; end;
    if M98_0.Value > 0 then begin Interlock6.Color:=clLime; end
    else begin Interlock6.ParentColor:=true; end;
    if M17_0.Value > 0 then begin Interlock7.Color:=clLime; end
    else begin Interlock7.ParentColor:=true; end;
    if Q0_1.Value > 0 then  begin Interlock8.Color:=clLime; end
    else begin Interlock8.ParentColor:=true; end;
    if Q0_3.Value > 0 then begin Status_.Color:=clMoneyGreen; end
    else begin Status_.ParentColor:=true; end;
  end;

  if (InterlockName_ = 'Cartridge Valve Interlock') then
  begin
    if M2_2.Value > 0 then begin Interlock1.Color:=clLime; end
    else begin Interlock1.ParentColor:=true; end;
    if M2_3.Value < 1 then begin Interlock2.Color:=clLime; end
    else begin Interlock2.ParentColor:=true; end;
    if I0_0.Value > 0 then begin Interlock3.Color:=clLime; end
    else begin Interlock3.ParentColor:=true; end;
    if Q201_0.Value > 0 then  begin Interlock4.Color:=clLime; end
    else begin Interlock4.ParentColor:=true; end;
    if (I0_2.Value > 0) or (M98_0.Value > 0) then  begin Interlock5.Color:=clLime; end
    else  begin Interlock5.ParentColor:=true; end;
     if (I0_7.Value > 0) or (M98_0.Value > 0) then  begin Interlock6.Color:=clLime; end
    else  begin Interlock6.ParentColor:=true; end;
    if M98_0.Value > 0 then begin Interlock7.Color:=clLime; end
    else begin Interlock7.ParentColor:=true; end;
    if M17_0.Value > 0 then begin Interlock8.Color:=clLime; end
    else begin Interlock8.ParentColor:=true; end;
    if Q0_2.Value > 0 then begin Status_.Color:=clMoneyGreen; end
    else begin Status_.ParentColor:=true; end;
  end;

  if (InterlockName_ = 'Gravure Roll Interlock') then
  begin
    if M33_0.Value > 0 then begin Interlock1.Color:=clLime; end
    else begin Interlock1.ParentColor:=true; end;
    if M33_1.Value < 1 then begin Interlock2.Color:=clLime; end
    else begin Interlock2.ParentColor:=true; end;
    if Q201_0.Value > 0 then  begin Interlock3.Color:=clLime; end
    else begin Interlock3.ParentColor:=true; end;
    if Q213_0.Value > 0 then  begin Status_.Color:=clLime; end
    else begin Status_.ParentColor:=true; end;
  end;

  if (InterlockName_ = 'Takeoff Roll Interlock') then
  begin
    if M35_0.Value > 0 then begin Interlock1.Color:=clLime; end
    else begin Interlock1.ParentColor:=true; end;
    if M35_1.Value < 1 then begin Interlock2.Color:=clLime; end
    else begin Interlock2.ParentColor:=true; end;
    if Q201_0.Value > 0 then  begin Interlock3.Color:=clLime; end
    else begin Interlock3.ParentColor:=true; end;
    if Q217_0.Value > 0 then  begin Status_.Color:=clLime; end
    else begin Status_.ParentColor:=true; end;
  end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  DefaultColor:=self.Interlock1.Color;
  DefaultWidth:=self.Width;
  Interlock1.Caption:='0:  ';
  Interlock2.Caption:='1:  ';
  Interlock3.Caption:='2:  ';
  Interlock4.Caption:='3:  ';
  Interlock5.Caption:='4:  ';
  Interlock6.Caption:='5:  ';
  Interlock7.Caption:='6:  ';
  Interlock8.Caption:='7:  ';
  Interlock9.Caption:='8:  ';
  Interlock10.Caption:='9:  ';
  Interlock11.Caption:='10: ';
  Interlock12.Caption:='11: ';
  Interlock13.Caption:='12: ';
  Interlock14.Caption:='13: ';
  Interlock15.Caption:='14: ';
  Interlock16.Caption:='15: ';
  Status_.Caption:='';
  Loop_();
end;

procedure TForm2.Image1Click(Sender: TObject);
begin
  close;
end;

procedure TForm2.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Bevel1.Style:=bsLowered;
end;

procedure TForm2.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Bevel1.Style:=bsRaised;
end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  timer1.Enabled:=false;
end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
  Loop_();
end;

end.

