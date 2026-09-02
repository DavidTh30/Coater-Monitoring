unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, PLCBlock, PLCBlockElement, TagBit, Tag, Dialogs, Controls;

type
  Caption_ = record
    _0:string;
    _1:string;
    _2:string;
    _3:string;
    _4:string;
    _5:string;
    _6:string;
    _7:string;
    _8:string;
    _9:string;
    _10:string;
    _11:string;
    _12:string;
    _13:string;
    _14:string;
    _15:string;
  end;

type
  Tag_ = record
    _0:boolean;
    _1:boolean;
    _2:boolean;
    _3:boolean;
    _4:boolean;
    _5:boolean;
    _6:boolean;
    _7:boolean;
    _8:boolean;
    _9:boolean;
    _10:boolean;
    _11:boolean;
    _12:boolean;
    _13:boolean;
    _14:boolean;
    _15:boolean;
    Name:String;
    Comment:String;
    TagName:Caption_;
  end;

procedure AutoCreateMemoryTag(maxbit:integer;Address_:integer; TPLCBlock_:TPLCBlockElement ); // Auto creat tag
procedure AutoNilMemoryTag(maxbit:integer; Address_:integer); // Auto Nil
procedure AutoCreateInputTag(maxbit:integer; Address_:integer; TPLCBlock_:TPLCBlockElement ); // Auto creat tag
procedure AutoNilInputTag(maxbit:integer; Address_:integer); // Auto Nil
Function FindTTagBit(Name_:string) : TTagBit; // Return TTagBit
procedure SetTag(Name_:string; Set_:double); // Give value to PLC tag

function CalculateTotal(A, B: Integer): Integer;

procedure CreateTag_MB0();
procedure CreateTag_MB1();
procedure CreateTag_MB2();
procedure CreateTag_MB17();
procedure CreateTag_MB20();  //Gravure Auto/Manual Cmd (Read Only)
procedure CreateTag_MB22();
procedure CreateTag_MB30();
procedure CreateTag_MB31();
procedure CreateTag_MB32();
procedure CreateTag_MB33();   // Gravure roll Start/Stop HMI
procedure CreateTag_MB34();
procedure CreateTag_MB35();   //Takeoff roll Run/Off HMI
procedure CreateTag_MB98();
procedure CreateTag_MB101();
procedure CreateTag_MW120();  // Alarm
procedure CreateTag_QB0();
procedure CreateTag_QB201();
procedure CreateTag_QB209();
procedure CreateTag_QB213();  //Gravure roll run
procedure CreateTag_QB217();  //Takeoff roll run
procedure CreateTag_IB0();
procedure CreateTag_IB201();  // Alarm Drive Infeed
procedure CreateTag_IB209();  // Alarm Drive Corona
procedure CreateTag_IB213();  // Alarm Drive Gravure Roll
procedure CreateTag_IB217();  // Alarm Drive TakeOff Roll
procedure CreateTag_IB221();  // Alarm CU
procedure CreateTag_DB9_DBD32();  //CoronaSpeed_Act
procedure CreateTag_DB9_DBD36();  //GravureRoll_Act
procedure CreateTag_DB9_DBD40();  //TakeOffRoll_Act
procedure CreateTag_DB9_DBD56();  //CoronaSetpoint
procedure CreateTag_DB9_DBD60();  //CoronaActual
procedure CreateTag_DB9_DBD64();  //CoronaWattDensityAct
procedure CreateTag_DB10_DBD4();  //LineSpeed_Act01
procedure CreateTag_DB10_DBD22(); //AdditionalCoronaSpeed_Set
procedure CreateTag_DB10_DBD26(); //AdditionalGravureRollSpeed_Set
procedure CreateTag_DB10_DBD30(); //AdditionalTakeOffRollSpeed_Set
procedure CreateTag_DB10_DBD42(); //LineSpeedUpper_Set
procedure FreeAndNil_MB0();
procedure FreeAndNil_MB1();
procedure FreeAndNil_MB2();
procedure FreeAndNil_MB17();
procedure FreeAndNil_MB20();
procedure FreeAndNil_MB22();
procedure FreeAndNil_MB30();
procedure FreeAndNil_MB31();
procedure FreeAndNil_MB32();
procedure FreeAndNil_MB33();
procedure FreeAndNil_MB34();
procedure FreeAndNil_MB35();
procedure FreeAndNil_MB98();
procedure FreeAndNil_MB101();
procedure FreeAndNil_MW120();
procedure FreeAndNil_QB0();
procedure FreeAndNil_QB201();
procedure FreeAndNil_QB209();
procedure FreeAndNil_QB213();
procedure FreeAndNil_QB217();
procedure FreeAndNil_IB0();
procedure FreeAndNil_IB201();
procedure FreeAndNil_IB209();
procedure FreeAndNil_IB213();
procedure FreeAndNil_IB217();
procedure FreeAndNil_IB221();
procedure FreeAndNil_DBD();

var
  M : array [0..120] of Tag_;
  I_ : array [0..221] of Tag_;
  LiveCounter_:integer;
  Communication_Active:boolean;
  ProductionView:boolean;
  MB0_: TPLCBlock;
  MB0: TPLCBlockElement;
  M0_0: TTagBit;
  M0_1: TTagBit;
  M0_2: TTagBit;
  M0_3: TTagBit;
  M0_4: TTagBit;
  M0_5: TTagBit;
  M0_6: TTagBit;  // Generator On HMI
  M0_7: TTagBit;  // Generator Off HMI

  MB1_: TPLCBlock;
  MB1: TPLCBlockElement;
  M1_0: TTagBit;
  M1_1: TTagBit;
  M1_2: TTagBit;
  M1_3: TTagBit;  // Gravure Auto HMI
  M1_4: TTagBit;  // Gravure Manual HMI
  M1_5: TTagBit;
  M1_6: TTagBit;
  M1_7: TTagBit;

  MB2_: TPLCBlock;
  MB2: TPLCBlockElement;
  M2_0: TTagBit;
  M2_1: TTagBit;
  M2_2: TTagBit;  // Cartridge In HMI
  M2_3: TTagBit;  // Cartridge Out HMI
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

  MB20_: TPLCBlock;
  MB20: TPLCBlockElement;
  M20_0: TTagBit;  // Gravure Auto Cmd
  M20_1: TTagBit;  // Gravure Manual Cmd
  M20_2: TTagBit;
  M20_3: TTagBit;
  M20_4: TTagBit;
  M20_5: TTagBit;
  M20_6: TTagBit;
  M20_7: TTagBit;

  MB22_: TPLCBlock;
  MB22: TPLCBlockElement;
  M22_0: TTagBit;  // Exhaust fan corona on HMI
  M22_1: TTagBit;  // Exhaust fan corona off HMI
  M22_2: TTagBit;
  M22_3: TTagBit;
  M22_4: TTagBit;
  M22_5: TTagBit;
  M22_6: TTagBit;
  M22_7: TTagBit;

  MB30_: TPLCBlock;  //Coating/Bypass Mode Status
  MB30: TPLCBlockElement;
  M30_0: TTagBit;  //CoatingMode Status
  M30_1: TTagBit;  //BypassMode Status
  M30_2: TTagBit;
  M30_3: TTagBit;
  M30_4: TTagBit;
  M30_5: TTagBit;
  M30_6: TTagBit;
  M30_7: TTagBit;

  MB31_: TPLCBlock;  // System Status
  MB31: TPLCBlockElement;

  MB32_: TPLCBlock;   // CoatingMode HMI
  MB32: TPLCBlockElement;

  MB33_: TPLCBlock;   // Gravure roll HMI
  MB33: TPLCBlockElement;

  MB34_: TPLCBlock;
  MB34: TPLCBlockElement;

  MB35_: TPLCBlock;   // Takeoff roll HMI
  MB35: TPLCBlockElement;

  MB98_: TPLCBlock;  // Filmbrake parameter
  MB98: TPLCBlockElement;

  MB101: TPLCBlockElement;
  MB101_: TPLCBlock;

  MW120_: TPLCBlock;       // Alarm
  MW120: TPLCBlockElement; //0..15

  IB0_: TPLCBlock;
  IB0: TPLCBlockElement;  //0..7

  IB201_: TPLCBlock;  // Drive Infeed
  IB201: TPLCBlockElement;

  IB209_: TPLCBlock;  // Drive Corona Roll
  IB209: TPLCBlockElement;

  IB213_: TPLCBlock;  // Drive Gravure Roll
  IB213: TPLCBlockElement;

  IB217_: TPLCBlock;  // Drive TakeOff Roll
  IB217: TPLCBlockElement;

  IB221_: TPLCBlock;  // Sinamics CU
  IB221: TPLCBlockElement;

  QB0_: TPLCBlock;
  QB0: TPLCBlockElement;
  Q0_0: TTagBit;
  Q0_1: TTagBit;  // Exhaust fan corona run
  Q0_2: TTagBit;  // Cartridge In
  Q0_3: TTagBit;  // Electrode In
  Q0_4: TTagBit;  // Generator Off Status
  Q0_5: TTagBit;  // Generator On Status
  Q0_6: TTagBit;
  Q0_7: TTagBit;

  QB201_: TPLCBlock;
  QB201: TPLCBlockElement;
  Q201_0: TTagBit;  // Infeed On
  Q201_1: TTagBit;
  Q201_2: TTagBit;
  Q201_3: TTagBit;
  Q201_4: TTagBit;
  Q201_5: TTagBit;
  Q201_6: TTagBit;
  Q201_7: TTagBit;

  QB209_: TPLCBlock;
  QB209: TPLCBlockElement;
  Q209_0: TTagBit;  // Corona Roll Run
  Q209_1: TTagBit;
  Q209_2: TTagBit;
  Q209_3: TTagBit;
  Q209_4: TTagBit;
  Q209_5: TTagBit;
  Q209_6: TTagBit;
  Q209_7: TTagBit;

  QB213_: TPLCBlock;
  QB213: TPLCBlockElement;
  Q213_0: TTagBit;  // Gravure roll run
  Q213_1: TTagBit;
  Q213_2: TTagBit;
  Q213_3: TTagBit;
  Q213_4: TTagBit;
  Q213_5: TTagBit;
  Q213_6: TTagBit;
  Q213_7: TTagBit;

  QB217_: TPLCBlock;
  QB217: TPLCBlockElement;
  Q217_0: TTagBit;  // Takeoff roll run
  Q217_1: TTagBit;
  Q217_2: TTagBit;
  Q217_3: TTagBit;
  Q217_4: TTagBit;
  Q217_5: TTagBit;
  Q217_6: TTagBit;
  Q217_7: TTagBit;

  DB9_DBD32_: TPLCBlock;        //CoronaSpeed_Act
  DB9_DBD32: TPLCBlockElement;  //CoronaSpeed_Act

  DB9_DBD36_: TPLCBlock;        //GravureRoll_Act
  DB9_DBD36: TPLCBlockElement;  //GravureRoll_Act

  DB9_DBD40_: TPLCBlock;        //TakeOffRoll_Act
  DB9_DBD40: TPLCBlockElement;  //TakeOffRoll_Act

  DB9_DBD56_: TPLCBlock;        //CoronaSetpoint
  DB9_DBD56: TPLCBlockElement;  //CoronaSetpoint
  DB9_DBD60_: TPLCBlock;        //CoronaActual
  DB9_DBD60: TPLCBlockElement;  //CoronaActual
  DB9_DBD64_: TPLCBlock;        //CoronaWattDensityAct
  DB9_DBD64: TPLCBlockElement;  //CoronaWattDensityAct

  DB10_DBD4_: TPLCBlock;        //LineSpeed_Act01
  DB10_DBD4: TPLCBlockElement;  //LineSpeed_Act01
  DB10_DBD22_: TPLCBlock;       //AdditionalCoronaSpeed_Set
  DB10_DBD22: TPLCBlockElement; //AdditionalCoronaSpeed_Set
  DB10_DBD26_: TPLCBlock;       //AdditionalGravureRollSpeed_Set
  DB10_DBD26: TPLCBlockElement; //AdditionalGravureRollSpeed_Set
  DB10_DBD30_: TPLCBlock;       //AdditionalTakeOffRollSpeed_Set
  DB10_DBD30: TPLCBlockElement; //AdditionalTakeOffRollSpeed_Set
  DB10_DBD42_: TPLCBlock;       //LineSpeedUpper_Set
  DB10_DBD42: TPLCBlockElement; //LineSpeedUpper_Set

implementation

uses Unit1;

function CalculateTotal(A, B: Integer): Integer;
begin
  Result := A + B;
end;

procedure AutoCreateMemoryTag(maxbit:integer; Address_:integer; TPLCBlock_:TPLCBlockElement ); // Auto creat tag
var
  i:integer;
  Tempo: TTagBit;
begin
  for i:= 0 to maxbit do
  begin
    Tempo:= TTagBit.Create(Unit1.Form1);
    Tempo.StartBit:=i;
    Tempo.EndBit:=i;
    Tempo.PLCTag:=TPLCBlock_;
    Tempo.Name:='M'+Address_.ToString+Format('%.2d',[i]);
    Tempo.OnValueChange:=@Unit1.Form1.ValueChange;
  end;
end;

procedure AutoNilMemoryTag(maxbit:integer; Address_:integer); // Auto Nil
var
  i:integer;
  MyControl: TComponent;
begin
  // no need to free and nil because create under Unit1.Form1
  exit;
  for i:= 0 to maxbit do
  begin
    MyControl:=Unit1.Form1.FindComponent('M'+Address_.ToString+Format('%.2d',[i]));
    if MyControl <> nil then
    begin
      //showmessage(TTagBit(MyControl).Name);
      FreeAndNil(MyControl);
    end;
  end;
end;

procedure AutoCreateInputTag(maxbit:integer; Address_:integer; TPLCBlock_:TPLCBlockElement ); // Auto creat tag
var
  i:integer;
  Tempo: TTagBit;
begin
  for i:= 0 to maxbit do
  begin
    Tempo:= TTagBit.Create(Unit1.Form1);
    Tempo.StartBit:=i;
    Tempo.EndBit:=i;
    Tempo.PLCTag:=TPLCBlock_;
    Tempo.Name:='I'+Address_.ToString+Format('%.2d',[i]);
    Tempo.OnValueChange:=@Unit1.Form1.ValueChange;
  end;
end;

procedure AutoNilInputTag(maxbit:integer; Address_:integer); // Auto Nil
var
  i:integer;
  MyControl: TComponent;
begin
  // no need to free and nil because create under Unit1.Form1
  exit;
  for i:= 0 to maxbit do
  begin
    MyControl:=Unit1.Form1.FindComponent('I'+Address_.ToString+Format('%.2d',[i]));
    if MyControl <> nil then
    begin
      //showmessage(TTagBit(MyControl).Name);
      FreeAndNil(MyControl);
    end;
  end;
end;

Function FindTTagBit(Name_:string) : TTagBit; // Return TTagBit
var
  MyControl: TComponent;
begin
    MyControl:=Unit1.Form1.FindComponent(Name_);
    if MyControl = nil then
    begin
      FindTTagBit:=nil;
      exit;
    end;
    if MyControl is TTagBit then
    begin
      FindTTagBit:=TTagBit(MyControl);
      exit;
    end
    else
      FindTTagBit:=nil;
end;

procedure SetTag(Name_:string; Set_:double); // Give value to PLC tag
var
  MyControl: TComponent;
begin
    MyControl:=Unit1.Form1.FindComponent(Name_);
    if MyControl is TTagBit then
    begin
      TTagBit(MyControl).Value:=Set_;
    end;
end;

procedure CreateTag_MB0();
begin
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
  MB0_.ProtocolDriver:=Unit1.Form1.ISOTCPDriver1;

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
end;

procedure CreateTag_MB1();
begin
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
  MB1_.ProtocolDriver:=Unit1.Form1.ISOTCPDriver1;

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
end;

procedure CreateTag_MB2();
begin
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
  MB2_.ProtocolDriver:=Unit1.Form1.ISOTCPDriver1;

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
end;

procedure CreateTag_MB17();
begin
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
  MB17_.ProtocolDriver:=Unit1.Form1.ISOTCPDriver1;

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
end;

procedure CreateTag_MB20();  //Gravure Auto/Manual Cmd (Read Only)
begin
  MB20_:= TPLCBlock.Create(nil);
  MB20_.PLCRack:=0;
  MB20_.PLCSlot:=0;
  MB20_.PLCStation:=2;
  MB20_.MemAddress:=20;
  MB20_.MemReadFunction:=3;
  MB20_.AutoRead:=true;
  MB20_.AutoWrite:=false;
  MB20_.TagType:= TTagType.pttByte;
  MB20_.Size:=1;
  MB20_.RefreshTime:=500;
  MB20_.ProtocolDriver:=Unit1.Form1.ISOTCPDriver1;

  MB20:= TPLCBlockElement.Create(nil);
  MB20.Index:=0;
  MB20.PLCBlock:=MB20_;

  M20_0:= TTagBit.Create(nil);
  M20_1:= TTagBit.Create(nil);
  M20_2:= TTagBit.Create(nil);
  M20_3:= TTagBit.Create(nil);
  M20_4:= TTagBit.Create(nil);
  M20_5:= TTagBit.Create(nil);
  M20_6:= TTagBit.Create(nil);
  M20_7:= TTagBit.Create(nil);

  M20_0.StartBit:=0;
  M20_0.EndBit:=0;
  M20_0.PLCTag:=MB20;

  M20_1.StartBit:=1;
  M20_1.EndBit:=1;
  M20_1.PLCTag:=MB20;

  M20_2.StartBit:=2;
  M20_2.EndBit:=2;
  M20_2.PLCTag:=MB20;

  M20_3.StartBit:=3;
  M20_3.EndBit:=3;
  M20_3.PLCTag:=MB20;

  M20_4.StartBit:=4;
  M20_4.EndBit:=4;
  M20_4.PLCTag:=MB20;

  M20_5.StartBit:=5;
  M20_5.EndBit:=5;
  M20_5.PLCTag:=MB20;

  M20_6.StartBit:=6;
  M20_6.EndBit:=6;
  M20_6.PLCTag:=MB20;

  M20_7.StartBit:=7;
  M20_7.EndBit:=7;
  M20_7.PLCTag:=MB20;
end;

procedure CreateTag_MB22();
begin
  MB22_:= TPLCBlock.Create(nil);
  MB22_.PLCRack:=0;
  MB22_.PLCSlot:=0;
  MB22_.PLCStation:=2;
  MB22_.MemAddress:=22;
  MB22_.MemReadFunction:=3;
  MB22_.AutoRead:=true;
  MB22_.AutoWrite:=true;
  MB22_.TagType:= TTagType.pttByte;
  MB22_.Size:=1;
  MB22_.RefreshTime:=500;
  MB22_.ProtocolDriver:=Unit1.Form1.ISOTCPDriver1;

  MB22:= TPLCBlockElement.Create(nil);
  MB22.Index:=0;
  MB22.PLCBlock:=MB22_;

  M22_0:= TTagBit.Create(nil);
  M22_1:= TTagBit.Create(nil);
  M22_2:= TTagBit.Create(nil);
  M22_3:= TTagBit.Create(nil);
  M22_4:= TTagBit.Create(nil);
  M22_5:= TTagBit.Create(nil);
  M22_6:= TTagBit.Create(nil);
  M22_7:= TTagBit.Create(nil);

  M22_0.StartBit:=0;
  M22_0.EndBit:=0;
  M22_0.PLCTag:=MB22;

  M22_1.StartBit:=1;
  M22_1.EndBit:=1;
  M22_1.PLCTag:=MB22;

  M22_2.StartBit:=2;
  M22_2.EndBit:=2;
  M22_2.PLCTag:=MB22;

  M22_3.StartBit:=3;
  M22_3.EndBit:=3;
  M22_3.PLCTag:=MB22;

  M22_4.StartBit:=4;
  M22_4.EndBit:=4;
  M22_4.PLCTag:=MB22;

  M22_5.StartBit:=5;
  M22_5.EndBit:=5;
  M22_5.PLCTag:=MB22;

  M22_6.StartBit:=6;
  M22_6.EndBit:=6;
  M22_6.PLCTag:=MB22;

  M22_7.StartBit:=7;
  M22_7.EndBit:=7;
  M22_7.PLCTag:=MB22;
end;

procedure CreateTag_MB30();
begin
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
  MB30_.ProtocolDriver:=Unit1.Form1.ISOTCPDriver1;

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
end;

procedure CreateTag_MB31();
begin
  MB31_:= TPLCBlock.Create(Unit1.Form1);
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
  MB31_.ProtocolDriver:=Unit1.Form1.ISOTCPDriver1;

  MB31:= TPLCBlockElement.Create(Unit1.Form1);
  MB31.Index:=0;
  MB31.PLCBlock:=MB31_;

  AutoCreateMemoryTag(7,31,MB31);
  m[31].Name:='System Status';
  m[31].TagName._0:='SystemOn Status, HMI Set/Reset  ';
end;

procedure CreateTag_MB32();
begin
  MB32_:= TPLCBlock.Create(Unit1.Form1);
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
  MB32_.ProtocolDriver:=Unit1.Form1.ISOTCPDriver1;

  MB32:= TPLCBlockElement.Create(Unit1.Form1);
  MB32.Index:=0;
  MB32.PLCBlock:=MB32_;

  AutoCreateMemoryTag(7,32,MB32);
  m[32].Name:='MB32 CoatingMode';
  m[32].TagName._0:='CmdCoatingModeHMI set/reset';
end;

procedure CreateTag_MB33();   // Gravure roll Start/Stop HMI
begin
  MB33_:= TPLCBlock.Create(Unit1.Form1);
  MB33_.PLCRack:=0;
  MB33_.PLCSlot:=0;
  MB33_.PLCStation:=2;
  MB33_.MemAddress:=33;
  MB33_.MemReadFunction:=3;
  MB33_.AutoRead:=true;
  MB33_.AutoWrite:=true;
  MB33_.TagType:= TTagType.pttByte;
  MB33_.Size:=1;
  MB33_.RefreshTime:=500;
  MB33_.ProtocolDriver:=Unit1.Form1.ISOTCPDriver1;

  MB33:= TPLCBlockElement.Create(Unit1.Form1);
  MB33.Index:=0;
  MB33.PLCBlock:=MB33_;

  AutoCreateMemoryTag(7,33,MB33);
  m[33].Name:='MB33 Gravure roll HMI';
  m[33].TagName._0:='Gravure Roll Run HMI Cmd';
  m[33].TagName._1:='Gravure Roll Off HMI Cmd';
  m[33].TagName._2:='Gravure Roll Run Mode Select';
  m[33].TagName._3:='Gravure Roll Auto By Speed below Setpoint';
  m[33].TagName._4:='Gravure Roll Auto by TDO FilmBrake';
end;

procedure CreateTag_MB34();
begin
  MB34_:= TPLCBlock.Create(Unit1.Form1);
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
  MB34_.ProtocolDriver:=Unit1.Form1.ISOTCPDriver1;

  MB34:= TPLCBlockElement.Create(Unit1.Form1);
  MB34.Index:=0;
  MB34.PLCBlock:=MB34_;

  AutoCreateMemoryTag(7,34,MB34);
  m[34].Name:='MB34 Corona roll HMI';
  m[34].TagName._0:='Corona Roll Run HMI Cmd';
  m[34].TagName._1:='Corona Roll Off HMI Cmd';
end;

procedure CreateTag_MB35();   //Takeoff roll Run/Off HMI
begin
  MB35_:= TPLCBlock.Create(Unit1.Form1);
  MB35_.PLCRack:=0;
  MB35_.PLCSlot:=0;
  MB35_.PLCStation:=2;
  MB35_.MemAddress:=35;
  MB35_.MemReadFunction:=3;
  MB35_.AutoRead:=true;
  MB35_.AutoWrite:=true;
  MB35_.TagType:= TTagType.pttByte;
  MB35_.Size:=1;
  MB35_.RefreshTime:=500;
  MB35_.ProtocolDriver:=Unit1.Form1.ISOTCPDriver1;

  MB35:= TPLCBlockElement.Create(Unit1.Form1);
  MB35.Index:=0;
  MB35.PLCBlock:=MB35_;

  AutoCreateMemoryTag(7,35,MB35);
  m[35].Name:='MB35 Takeoff roll HMI';
  m[35].TagName._0:='Takeoff Roll Run HMI Cmd';
  m[35].TagName._1:='Takeoff Roll Off HMI Cmd';
end;

procedure CreateTag_MB98();
begin
  MB98_:= TPLCBlock.Create(Unit1.Form1);
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
  MB98_.ProtocolDriver:=Unit1.Form1.ISOTCPDriver1;

  MB98:= TPLCBlockElement.Create(Unit1.Form1);
  MB98.Index:=0;
  MB98.PLCBlock:=MB98_;

  AutoCreateMemoryTag(7,98,MB98);
  m[98].Name:='MB98 TDO Film Break';
  m[98].TagName._0:='Bypass TDO Film Break';
end;

procedure CreateTag_MB101();
begin
  MB101_:= TPLCBlock.Create(Unit1.Form1);
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
  MB101_.ProtocolDriver:=Unit1.Form1.ISOTCPDriver1;

  MB101:= TPLCBlockElement.Create(Unit1.Form1);
  MB101.Index:=0;
  MB101.PLCBlock:=MB101_;

  AutoCreateMemoryTag(7,101,MB101);
  m[101].Name:='MB101 Clock';
  m[101].TagName._0:='10Hz';
  m[101].TagName._1:='5Hz';
  m[101].TagName._2:='2.5Hz';
  m[101].TagName._3:='2Hz';
  m[101].TagName._4:='1.25Hz';
  m[101].TagName._5:='1Hz';
  m[101].TagName._6:='0.625Hz';
  m[101].TagName._7:='0.5Hz';

end;

procedure CreateTag_MW120(); // Alarm
begin
  MW120_:= TPLCBlock.Create(Unit1.Form1);
  MW120_.PLCRack:=0;
  MW120_.PLCSlot:=0;
  MW120_.PLCStation:=2;
  MW120_.MemAddress:=120;
  MW120_.MemReadFunction:=3;
  MW120_.AutoRead:=true;
  MW120_.AutoWrite:=false;
  MW120_.TagType:= TTagType.pttWord;
  MW120_.Size:=1;
  MW120_.SwapBytes:=true;
  MW120_.SwapDWords:=false;
  MW120_.SwapWords:=false;
  MW120_.RefreshTime:=500;
  MW120_.ProtocolDriver:=Unit1.Form1.ISOTCPDriver1;

  MW120:= TPLCBlockElement.Create(Unit1.Form1);
  MW120.Index:=0;
  MW120.PLCBlock:=MW120_;

  AutoCreateMemoryTag(15,120,MW120);
  m[120].Name:='MW120 Alarm';
  m[120].TagName._1:='Emergency Stop';
end;

procedure CreateTag_QB0();
begin
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
  QB0_.ProtocolDriver:=Unit1.Form1.ISOTCPDriver1;

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
end;

procedure CreateTag_QB201();
begin
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
  QB201_.ProtocolDriver:=Unit1.Form1.ISOTCPDriver1;

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
end;

procedure CreateTag_QB209();
begin
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
  QB209_.ProtocolDriver:=Unit1.Form1.ISOTCPDriver1;

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
end;

procedure CreateTag_QB213();  //Gravure roll run
begin
  QB213_:= TPLCBlock.Create(nil);
  QB213_.PLCRack:=0;
  QB213_.PLCSlot:=0;
  QB213_.PLCStation:=2;
  QB213_.MemAddress:=213;
  QB213_.MemReadFunction:=2;
  QB213_.AutoRead:=true;
  QB213_.AutoWrite:=false;
  QB213_.TagType:= TTagType.pttByte;
  QB213_.Size:=1;
  QB213_.RefreshTime:=500;
  QB213_.ProtocolDriver:=Unit1.Form1.ISOTCPDriver1;

  QB213:= TPLCBlockElement.Create(nil);
  QB213.Index:=0;
  QB213.PLCBlock:=QB213_;

  Q213_0:= TTagBit.Create(nil);
  Q213_1:= TTagBit.Create(nil);
  Q213_2:= TTagBit.Create(nil);
  Q213_3:= TTagBit.Create(nil);
  Q213_4:= TTagBit.Create(nil);
  Q213_5:= TTagBit.Create(nil);
  Q213_6:= TTagBit.Create(nil);
  Q213_7:= TTagBit.Create(nil);

  Q213_0.StartBit:=0;
  Q213_0.EndBit:=0;
  Q213_0.PLCTag:=QB213;

  Q213_1.StartBit:=1;
  Q213_1.EndBit:=1;
  Q213_1.PLCTag:=QB213;

  Q213_2.StartBit:=2;
  Q213_2.EndBit:=2;
  Q213_2.PLCTag:=QB213;

  Q213_3.StartBit:=3;
  Q213_3.EndBit:=3;
  Q213_3.PLCTag:=QB213;

  Q213_4.StartBit:=4;
  Q213_4.EndBit:=4;
  Q213_4.PLCTag:=QB213;

  Q213_5.StartBit:=5;
  Q213_5.EndBit:=5;
  Q213_5.PLCTag:=QB213;

  Q213_6.StartBit:=6;
  Q213_6.EndBit:=6;
  Q213_6.PLCTag:=QB213;

  Q213_7.StartBit:=7;
  Q213_7.EndBit:=7;
  Q213_7.PLCTag:=QB213;
end;

procedure CreateTag_QB217();  //Takeoff roll run
begin
  QB217_:= TPLCBlock.Create(nil);
  QB217_.PLCRack:=0;
  QB217_.PLCSlot:=0;
  QB217_.PLCStation:=2;
  QB217_.MemAddress:=217;
  QB217_.MemReadFunction:=2;
  QB217_.AutoRead:=true;
  QB217_.AutoWrite:=false;
  QB217_.TagType:= TTagType.pttByte;
  QB217_.Size:=1;
  QB217_.RefreshTime:=500;
  QB217_.ProtocolDriver:=Unit1.Form1.ISOTCPDriver1;

  QB217:= TPLCBlockElement.Create(nil);
  QB217.Index:=0;
  QB217.PLCBlock:=QB217_;

  Q217_0:= TTagBit.Create(nil);
  Q217_1:= TTagBit.Create(nil);
  Q217_2:= TTagBit.Create(nil);
  Q217_3:= TTagBit.Create(nil);
  Q217_4:= TTagBit.Create(nil);
  Q217_5:= TTagBit.Create(nil);
  Q217_6:= TTagBit.Create(nil);
  Q217_7:= TTagBit.Create(nil);

  Q217_0.StartBit:=0;
  Q217_0.EndBit:=0;
  Q217_0.PLCTag:=QB217;

  Q217_1.StartBit:=1;
  Q217_1.EndBit:=1;
  Q217_1.PLCTag:=QB217;

  Q217_2.StartBit:=2;
  Q217_2.EndBit:=2;
  Q217_2.PLCTag:=QB217;

  Q217_3.StartBit:=3;
  Q217_3.EndBit:=3;
  Q217_3.PLCTag:=QB217;

  Q217_4.StartBit:=4;
  Q217_4.EndBit:=4;
  Q217_4.PLCTag:=QB217;

  Q217_5.StartBit:=5;
  Q217_5.EndBit:=5;
  Q217_5.PLCTag:=QB217;

  Q217_6.StartBit:=6;
  Q217_6.EndBit:=6;
  Q217_6.PLCTag:=QB217;

  Q217_7.StartBit:=7;
  Q217_7.EndBit:=7;
  Q217_7.PLCTag:=QB217;
end;

procedure CreateTag_IB0();
begin
  IB0_:= TPLCBlock.Create(Unit1.Form1);
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
  IB0_.ProtocolDriver:=Unit1.Form1.ISOTCPDriver1;

  IB0:= TPLCBlockElement.Create(Unit1.Form1);
  IB0.Index:=0;
  IB0.PLCBlock:=IB0_;

  AutoCreateInputTag(7,0,IB0);
  I_[0].Name:='Infeed unit';
  I_[0].TagName._0:='E-Stop OK';
  I_[0].TagName._1:='Flow Switch OK';
  I_[0].TagName._2:='MDO Film Brake';
  I_[0].TagName._3:='';
  I_[0].TagName._4:='Image Sensor';
  I_[0].TagName._5:='Corona Electrode in position';
  I_[0].TagName._6:='';
  I_[0].TagName._7:='TDO Film Brake';
end;

procedure CreateTag_IB201();
begin
  IB201_:= TPLCBlock.Create(Unit1.Form1);
  IB201_.PLCRack:=0;
  IB201_.PLCSlot:=0;
  IB201_.PLCStation:=2;
  IB201_.MemAddress:=201;
  IB201_.MemReadFunction:=1;
  IB201_.AutoRead:=true;
  IB201_.AutoWrite:=false;
  IB201_.TagType:= TTagType.pttByte;
  IB201_.Size:=1;
  IB201_.RefreshTime:=500;
  IB201_.ProtocolDriver:=Unit1.Form1.ISOTCPDriver1;

  IB201:= TPLCBlockElement.Create(Unit1.Form1);
  IB201.Index:=0;
  IB201.PLCBlock:=IB201_;

  AutoCreateInputTag(7,201,IB201);
  I_[201].Name:='Infeed unit';
  I_[201].TagName._1:='Infeed unit fault';
end;

procedure CreateTag_IB209();
begin
  IB209_:= TPLCBlock.Create(Unit1.Form1);
  IB209_.PLCRack:=0;
  IB209_.PLCSlot:=0;
  IB209_.PLCStation:=2;
  IB209_.MemAddress:=209;
  IB209_.MemReadFunction:=1;
  IB209_.AutoRead:=true;
  IB209_.AutoWrite:=false;
  IB209_.TagType:= TTagType.pttByte;
  IB209_.Size:=1;
  IB209_.RefreshTime:=500;
  IB209_.ProtocolDriver:=Unit1.Form1.ISOTCPDriver1;

  IB209:= TPLCBlockElement.Create(Unit1.Form1);
  IB209.Index:=0;
  IB209.PLCBlock:=IB209_;

  AutoCreateInputTag(7,209,IB209);
  I_[209].Name:='Corona roll drive';
  I_[209].TagName._1:='Corona roll drive fault';
end;

procedure CreateTag_IB213();
begin
  IB213_:= TPLCBlock.Create(Unit1.Form1);
  IB213_.PLCRack:=0;
  IB213_.PLCSlot:=0;
  IB213_.PLCStation:=2;
  IB213_.MemAddress:=213;
  IB213_.MemReadFunction:=1;
  IB213_.AutoRead:=true;
  IB213_.AutoWrite:=false;
  IB213_.TagType:= TTagType.pttByte;
  IB213_.Size:=1;
  IB213_.RefreshTime:=500;
  IB213_.ProtocolDriver:=Unit1.Form1.ISOTCPDriver1;

  IB213:= TPLCBlockElement.Create(Unit1.Form1);
  IB213.Index:=0;
  IB213.PLCBlock:=IB213_;

  AutoCreateInputTag(7,213,IB213);
  I_[213].Name:='Gravure roll drive';
  I_[213].TagName._1:='Gravure roll drive fault';
end;

procedure CreateTag_IB217();
begin
  IB217_:= TPLCBlock.Create(Unit1.Form1);
  IB217_.PLCRack:=0;
  IB217_.PLCSlot:=0;
  IB217_.PLCStation:=2;
  IB217_.MemAddress:=217;
  IB217_.MemReadFunction:=1;
  IB217_.AutoRead:=true;
  IB217_.AutoWrite:=false;
  IB217_.TagType:= TTagType.pttByte;
  IB217_.Size:=1;
  IB217_.RefreshTime:=500;
  IB217_.ProtocolDriver:=Unit1.Form1.ISOTCPDriver1;

  IB217:= TPLCBlockElement.Create(Unit1.Form1);
  IB217.Index:=0;
  IB217.PLCBlock:=IB217_;

  AutoCreateInputTag(7,217,IB217);
  I_[217].Name:='Takeoff roll drive';
  I_[217].TagName._1:='Takeoff roll drive fault';
end;

procedure CreateTag_IB221();
begin
  IB221_:= TPLCBlock.Create(Unit1.Form1);
  IB221_.PLCRack:=0;
  IB221_.PLCSlot:=0;
  IB221_.PLCStation:=2;
  IB221_.MemAddress:=221;
  IB221_.MemReadFunction:=1;
  IB221_.AutoRead:=true;
  IB221_.AutoWrite:=false;
  IB221_.TagType:= TTagType.pttByte;
  IB221_.Size:=1;
  IB221_.RefreshTime:=500;
  IB221_.ProtocolDriver:=Unit1.Form1.ISOTCPDriver1;

  IB221:= TPLCBlockElement.Create(Unit1.Form1);
  IB221.Index:=0;
  IB221.PLCBlock:=IB221_;

  AutoCreateInputTag(7,221,IB221);
  I_[221].Name:='IB221 CU';
  I_[221].TagName._1:='Sinamics CU fault';
end;


procedure CreateTag_DB9_DBD32();  //CoronaSpeed_Act
begin
  DB9_DBD32_:= TPLCBlock.Create(nil);
  DB9_DBD32_.PLCRack:=0;
  DB9_DBD32_.PLCSlot:=0;
  DB9_DBD32_.PLCStation:=2;
  DB9_DBD32_.MemAddress:=32;
  DB9_DBD32_.MemFile_DB:=9;
  DB9_DBD32_.MemReadFunction:=4;
  DB9_DBD32_.MemWriteFunction:=0;
  DB9_DBD32_.AutoRead:=true;
  DB9_DBD32_.AutoWrite:=false;
  DB9_DBD32_.TagType:= TTagType.pttFloat;
  DB9_DBD32_.Size:=1;
  DB9_DBD32_.SwapBytes:=true;
  DB9_DBD32_.SwapDWords:=false;
  DB9_DBD32_.SwapWords:=true;
  DB9_DBD32_.RefreshTime:=1000;
  DB9_DBD32_.ProtocolDriver:=Unit1.Form1.ISOTCPDriver1;

  DB9_DBD32:= TPLCBlockElement.Create(nil);
  DB9_DBD32.Index:=0;
  DB9_DBD32.PLCBlock:=DB9_DBD32_;
end;

procedure CreateTag_DB9_DBD36();  //GravureRoll_Act
begin
  DB9_DBD36_:= TPLCBlock.Create(nil);
  DB9_DBD36_.PLCRack:=0;
  DB9_DBD36_.PLCSlot:=0;
  DB9_DBD36_.PLCStation:=2;
  DB9_DBD36_.MemAddress:=36;
  DB9_DBD36_.MemFile_DB:=9;
  DB9_DBD36_.MemReadFunction:=4;
  DB9_DBD36_.MemWriteFunction:=0;
  DB9_DBD36_.AutoRead:=true;
  DB9_DBD36_.AutoWrite:=false;
  DB9_DBD36_.TagType:= TTagType.pttFloat;
  DB9_DBD36_.Size:=1;
  DB9_DBD36_.SwapBytes:=true;
  DB9_DBD36_.SwapDWords:=false;
  DB9_DBD36_.SwapWords:=true;
  DB9_DBD36_.RefreshTime:=1000;
  DB9_DBD36_.ProtocolDriver:=Unit1.Form1.ISOTCPDriver1;

  DB9_DBD36:= TPLCBlockElement.Create(nil);
  DB9_DBD36.Index:=0;
  DB9_DBD36.PLCBlock:=DB9_DBD36_;
end;

procedure CreateTag_DB9_DBD40();  //TakeOffRoll_Act
begin
  DB9_DBD40_:= TPLCBlock.Create(nil);
  DB9_DBD40_.PLCRack:=0;
  DB9_DBD40_.PLCSlot:=0;
  DB9_DBD40_.PLCStation:=2;
  DB9_DBD40_.MemAddress:=40;
  DB9_DBD40_.MemFile_DB:=9;
  DB9_DBD40_.MemReadFunction:=4;
  DB9_DBD40_.MemWriteFunction:=0;
  DB9_DBD40_.AutoRead:=true;
  DB9_DBD40_.AutoWrite:=false;
  DB9_DBD40_.TagType:= TTagType.pttFloat;
  DB9_DBD40_.Size:=1;
  DB9_DBD40_.SwapBytes:=true;
  DB9_DBD40_.SwapDWords:=false;
  DB9_DBD40_.SwapWords:=true;
  DB9_DBD40_.RefreshTime:=1000;
  DB9_DBD40_.ProtocolDriver:=Unit1.Form1.ISOTCPDriver1;

  DB9_DBD40:= TPLCBlockElement.Create(nil);
  DB9_DBD40.Index:=0;
  DB9_DBD40.PLCBlock:=DB9_DBD40_;
end;

procedure CreateTag_DB9_DBD56();  //CoronaSetpoint
begin
  DB9_DBD56_:= TPLCBlock.Create(nil);
  DB9_DBD56_.PLCRack:=0;
  DB9_DBD56_.PLCSlot:=0;
  DB9_DBD56_.PLCStation:=2;
  DB9_DBD56_.MemAddress:=56;
  DB9_DBD56_.MemFile_DB:=9;
  DB9_DBD56_.MemReadFunction:=4;
  DB9_DBD56_.MemWriteFunction:=0;
  DB9_DBD56_.AutoRead:=true;
  DB9_DBD56_.AutoWrite:=true;
  DB9_DBD56_.TagType:= TTagType.pttFloat;
  DB9_DBD56_.Size:=1;
  DB9_DBD56_.SwapBytes:=true;
  DB9_DBD56_.SwapDWords:=false;
  DB9_DBD56_.SwapWords:=true;
  DB9_DBD56_.RefreshTime:=1000;
  DB9_DBD56_.ProtocolDriver:=Unit1.Form1.ISOTCPDriver1;

  DB9_DBD56:= TPLCBlockElement.Create(nil);
  DB9_DBD56.Index:=0;
  DB9_DBD56.PLCBlock:=DB9_DBD56_;
end;

procedure CreateTag_DB9_DBD60();  //CoronaActual
begin
  DB9_DBD60_:= TPLCBlock.Create(nil);
  DB9_DBD60_.PLCRack:=0;
  DB9_DBD60_.PLCSlot:=0;
  DB9_DBD60_.PLCStation:=2;
  DB9_DBD60_.MemAddress:=60;
  DB9_DBD60_.MemFile_DB:=9;
  DB9_DBD60_.MemReadFunction:=4;
  DB9_DBD60_.MemWriteFunction:=0;
  DB9_DBD60_.AutoRead:=true;
  DB9_DBD60_.AutoWrite:=false;
  DB9_DBD60_.TagType:= TTagType.pttFloat;
  DB9_DBD60_.Size:=1;
  DB9_DBD60_.SwapBytes:=true;
  DB9_DBD60_.SwapDWords:=false;
  DB9_DBD60_.SwapWords:=true;
  DB9_DBD60_.RefreshTime:=1000;
  DB9_DBD60_.ProtocolDriver:=Unit1.Form1.ISOTCPDriver1;

  DB9_DBD60:= TPLCBlockElement.Create(nil);
  DB9_DBD60.Index:=0;
  DB9_DBD60.PLCBlock:=DB9_DBD60_;
end;

procedure CreateTag_DB9_DBD64();  //CoronaWattDensityAct
begin
  DB9_DBD64_:= TPLCBlock.Create(nil);
  DB9_DBD64_.PLCRack:=0;
  DB9_DBD64_.PLCSlot:=0;
  DB9_DBD64_.PLCStation:=2;
  DB9_DBD64_.MemAddress:=64;
  DB9_DBD64_.MemFile_DB:=9;
  DB9_DBD64_.MemReadFunction:=4;
  DB9_DBD64_.MemWriteFunction:=0;
  DB9_DBD64_.AutoRead:=true;
  DB9_DBD64_.AutoWrite:=false;
  DB9_DBD64_.TagType:= TTagType.pttFloat;
  DB9_DBD64_.Size:=1;
  DB9_DBD64_.SwapBytes:=true;
  DB9_DBD64_.SwapDWords:=false;
  DB9_DBD64_.SwapWords:=true;
  DB9_DBD64_.RefreshTime:=1000;
  DB9_DBD64_.ProtocolDriver:=Unit1.Form1.ISOTCPDriver1;

  DB9_DBD64:= TPLCBlockElement.Create(nil);
  DB9_DBD64.Index:=0;
  DB9_DBD64.PLCBlock:=DB9_DBD64_;
end;

procedure CreateTag_DB10_DBD4();  //LineSpeed_Act01
begin
  DB10_DBD4_:= TPLCBlock.Create(nil);
  DB10_DBD4_.PLCRack:=0;
  DB10_DBD4_.PLCSlot:=0;
  DB10_DBD4_.PLCStation:=2;
  DB10_DBD4_.MemAddress:=4;
  DB10_DBD4_.MemFile_DB:=10;
  DB10_DBD4_.MemReadFunction:=4;
  DB10_DBD4_.MemWriteFunction:=0;
  DB10_DBD4_.AutoRead:=true;
  DB10_DBD4_.AutoWrite:=false;
  DB10_DBD4_.TagType:= TTagType.pttFloat;
  DB10_DBD4_.Size:=1;
  DB10_DBD4_.SwapBytes:=true;
  DB10_DBD4_.SwapDWords:=false;
  DB10_DBD4_.SwapWords:=true;
  DB10_DBD4_.RefreshTime:=1000;
  DB10_DBD4_.ProtocolDriver:=Unit1.Form1.ISOTCPDriver1;

  DB10_DBD4:= TPLCBlockElement.Create(nil);
  DB10_DBD4.Index:=0;
  DB10_DBD4.PLCBlock:=DB10_DBD4_;
end;

procedure CreateTag_DB10_DBD22();  //AdditionalCoronaSpeed_Set
begin
  DB10_DBD22_:= TPLCBlock.Create(nil);
  DB10_DBD22_.PLCRack:=0;
  DB10_DBD22_.PLCSlot:=0;
  DB10_DBD22_.PLCStation:=2;
  DB10_DBD22_.MemAddress:=22;
  DB10_DBD22_.MemFile_DB:=10;
  DB10_DBD22_.MemReadFunction:=4;
  DB10_DBD22_.MemWriteFunction:=0;
  DB10_DBD22_.AutoRead:=true;
  DB10_DBD22_.AutoWrite:=true;
  DB10_DBD22_.TagType:= TTagType.pttFloat;
  DB10_DBD22_.Size:=1;
  DB10_DBD22_.SwapBytes:=true;
  DB10_DBD22_.SwapDWords:=false;
  DB10_DBD22_.SwapWords:=true;
  DB10_DBD22_.RefreshTime:=1000;
  DB10_DBD22_.ProtocolDriver:=Unit1.Form1.ISOTCPDriver1;

  DB10_DBD22:= TPLCBlockElement.Create(nil);
  DB10_DBD22.Index:=0;
  DB10_DBD22.PLCBlock:=DB10_DBD22_;
end;

procedure CreateTag_DB10_DBD26();  //AdditionalGravureRollSpeed_Set
begin
  DB10_DBD26_:= TPLCBlock.Create(nil);
  DB10_DBD26_.PLCRack:=0;
  DB10_DBD26_.PLCSlot:=0;
  DB10_DBD26_.PLCStation:=2;
  DB10_DBD26_.MemAddress:=26;
  DB10_DBD26_.MemFile_DB:=10;
  DB10_DBD26_.MemReadFunction:=4;
  DB10_DBD26_.MemWriteFunction:=0;
  DB10_DBD26_.AutoRead:=true;
  DB10_DBD26_.AutoWrite:=true;
  DB10_DBD26_.TagType:= TTagType.pttFloat;
  DB10_DBD26_.Size:=1;
  DB10_DBD26_.SwapBytes:=true;
  DB10_DBD26_.SwapDWords:=false;
  DB10_DBD26_.SwapWords:=true;
  DB10_DBD26_.RefreshTime:=1000;
  DB10_DBD26_.ProtocolDriver:=Unit1.Form1.ISOTCPDriver1;

  DB10_DBD26:= TPLCBlockElement.Create(nil);
  DB10_DBD26.Index:=0;
  DB10_DBD26.PLCBlock:=DB10_DBD26_;
end;

procedure CreateTag_DB10_DBD30();  //AdditionalTakeOffRollSpeed_Set
begin
  DB10_DBD30_:= TPLCBlock.Create(nil);
  DB10_DBD30_.PLCRack:=0;
  DB10_DBD30_.PLCSlot:=0;
  DB10_DBD30_.PLCStation:=2;
  DB10_DBD30_.MemAddress:=30;
  DB10_DBD30_.MemFile_DB:=10;
  DB10_DBD30_.MemReadFunction:=4;
  DB10_DBD30_.MemWriteFunction:=0;
  DB10_DBD30_.AutoRead:=true;
  DB10_DBD30_.AutoWrite:=true;
  DB10_DBD30_.TagType:= TTagType.pttFloat;
  DB10_DBD30_.Size:=1;
  DB10_DBD30_.SwapBytes:=true;
  DB10_DBD30_.SwapDWords:=false;
  DB10_DBD30_.SwapWords:=true;
  DB10_DBD30_.RefreshTime:=1000;
  DB10_DBD30_.ProtocolDriver:=Unit1.Form1.ISOTCPDriver1;

  DB10_DBD30:= TPLCBlockElement.Create(nil);
  DB10_DBD30.Index:=0;
  DB10_DBD30.PLCBlock:=DB10_DBD30_;
end;

procedure CreateTag_DB10_DBD42();
begin
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
  DB10_DBD42_.ProtocolDriver:=Unit1.Form1.ISOTCPDriver1;

  DB10_DBD42:= TPLCBlockElement.Create(nil);
  DB10_DBD42.Index:=0;
  DB10_DBD42.PLCBlock:=DB10_DBD42_;
end;

procedure FreeAndNil_MB0();
begin
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
end;

procedure FreeAndNil_MB1();
begin
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
end;

procedure FreeAndNil_MB2();
begin
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
end;

procedure FreeAndNil_MB17();
begin
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
end;

procedure FreeAndNil_MB20();
begin
  FreeAndNil(M20_0);
  FreeAndNil(M20_1);
  FreeAndNil(M20_2);
  FreeAndNil(M20_3);
  FreeAndNil(M20_4);
  FreeAndNil(M20_5);
  FreeAndNil(M20_6);
  FreeAndNil(M20_7);
  FreeAndNil(MB20);
  FreeAndNil(MB20_);
end;

procedure FreeAndNil_MB22();
begin
  FreeAndNil(M22_0);
  FreeAndNil(M22_1);
  FreeAndNil(M22_2);
  FreeAndNil(M22_3);
  FreeAndNil(M22_4);
  FreeAndNil(M22_5);
  FreeAndNil(M22_6);
  FreeAndNil(M22_7);
  FreeAndNil(MB22);
  FreeAndNil(MB22_);
end;

procedure FreeAndNil_MB30();
begin
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
end;

procedure FreeAndNil_MB31();
begin
  //FreeAndNil(M31_0);
  //FreeAndNil(M31_1);
  //FreeAndNil(M31_2);
  //FreeAndNil(M31_3);
  //FreeAndNil(M31_4);
  //FreeAndNil(M31_5);
  //FreeAndNil(M31_6);
  //FreeAndNil(M31_7);
  //FreeAndNil(MB31);
  //FreeAndNil(MB31_);
end;

procedure FreeAndNil_MB32();
begin
  //FreeAndNil(M32_0);
  //FreeAndNil(M32_1);
  //FreeAndNil(M32_2);
  //FreeAndNil(M32_3);
  //FreeAndNil(M32_4);
  //FreeAndNil(M32_5);
  //FreeAndNil(M32_6);
  //FreeAndNil(M32_7);
  //FreeAndNil(MB32);
  //FreeAndNil(MB32_);
end;

procedure FreeAndNil_MB33();
begin
  //FreeAndNil(M33_0);
  //FreeAndNil(M33_1);
  //FreeAndNil(M33_2);
  //FreeAndNil(M33_3);
  //FreeAndNil(M33_4);
  //FreeAndNil(M33_5);
  //FreeAndNil(M33_6);
  //FreeAndNil(M33_7);
  //FreeAndNil(MB33);
  //FreeAndNil(MB33_);
end;

procedure FreeAndNil_MB34();
begin
  //FreeAndNil(M34_0);
  //FreeAndNil(M34_1);
  //FreeAndNil(M34_2);
  //FreeAndNil(M34_3);
  //FreeAndNil(M34_4);
  //FreeAndNil(M34_5);
  //FreeAndNil(M34_6);
  //FreeAndNil(M34_7);
  //FreeAndNil(MB34);
  //FreeAndNil(MB34_);
end;

procedure FreeAndNil_MB35();
begin
  //FreeAndNil(M35_0);
  //FreeAndNil(M35_1);
  //FreeAndNil(M35_2);
  //FreeAndNil(M35_3);
  //FreeAndNil(M35_4);
  //FreeAndNil(M35_5);
  //FreeAndNil(M35_6);
  //FreeAndNil(M35_7);
  //FreeAndNil(MB35);
  //FreeAndNil(MB35_);
end;

procedure FreeAndNil_MB98();
begin
  //FreeAndNil(M98_0);
  //FreeAndNil(M98_1);
  //FreeAndNil(M98_2);
  //FreeAndNil(M98_3);
  //FreeAndNil(M98_4);
  //FreeAndNil(M98_5);
  //FreeAndNil(M98_6);
  //FreeAndNil(M98_7);
  //FreeAndNil(MB98);
  //FreeAndNil(MB98_);
end;

procedure FreeAndNil_MB101();
begin
  //FreeAndNil(M101_0);
  //FreeAndNil(M101_1);
  //FreeAndNil(M101_2);
  //FreeAndNil(M101_3);
  //FreeAndNil(M101_4);
  //FreeAndNil(M101_5);
  //FreeAndNil(M101_6);
  //FreeAndNil(M101_7);
  //FreeAndNil(MB101);
  //FreeAndNil(MB101_);
end;

procedure FreeAndNil_MW120();
begin
  //FreeAndNil(M120_0);
  //FreeAndNil(M120_1);
  //FreeAndNil(M120_2);
  //FreeAndNil(M120_3);
  //FreeAndNil(M120_4);
  //FreeAndNil(M120_5);
  //FreeAndNil(M120_6);
  //FreeAndNil(M120_7);
  //FreeAndNil(M120_8);
  //FreeAndNil(M120_9);
  //FreeAndNil(M120_10);
  //FreeAndNil(M120_11);
  //FreeAndNil(M120_12);
  //FreeAndNil(M120_13);
  //FreeAndNil(M120_14);
  //FreeAndNil(M120_15);
  //FreeAndNil(MW120);
  //FreeAndNil(MW120_);
end;

procedure FreeAndNil_QB0();
begin
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
end;

procedure FreeAndNil_QB201();
begin
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
end;

procedure FreeAndNil_QB209();
begin
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
end;

procedure FreeAndNil_QB213();
begin
  FreeAndNil(Q213_0);
  FreeAndNil(Q213_1);
  FreeAndNil(Q213_2);
  FreeAndNil(Q213_3);
  FreeAndNil(Q213_4);
  FreeAndNil(Q213_5);
  FreeAndNil(Q213_6);
  FreeAndNil(Q213_7);
  FreeAndNil(QB213);
  FreeAndNil(QB213_);
end;

procedure FreeAndNil_QB217();
begin
  FreeAndNil(Q217_0);
  FreeAndNil(Q217_1);
  FreeAndNil(Q217_2);
  FreeAndNil(Q217_3);
  FreeAndNil(Q217_4);
  FreeAndNil(Q217_5);
  FreeAndNil(Q217_6);
  FreeAndNil(Q217_7);
  FreeAndNil(QB217);
  FreeAndNil(QB217_);
end;

procedure FreeAndNil_IB0();
begin
  //FreeAndNil(I0_0);
  //FreeAndNil(I0_1);
  //FreeAndNil(I0_2);
  //FreeAndNil(I0_3);
  //FreeAndNil(I0_4);
  //FreeAndNil(I0_5);
  //FreeAndNil(I0_6);
  //FreeAndNil(I0_7);
  //FreeAndNil(IB0);
  //FreeAndNil(IB0_);
end;

procedure FreeAndNil_IB201();
begin
  //FreeAndNil(I201_0);
  //FreeAndNil(I201_1);
  //FreeAndNil(I201_2);
  //FreeAndNil(I201_3);
  //FreeAndNil(I201_4);
  //FreeAndNil(I201_5);
  //FreeAndNil(I201_6);
  //FreeAndNil(I201_7);
  //FreeAndNil(IB201);
  //FreeAndNil(IB201_);
end;

procedure FreeAndNil_IB209();
begin
  //FreeAndNil(I209_0);
  //FreeAndNil(I209_1);
  //FreeAndNil(I209_2);
  //FreeAndNil(I209_3);
  //FreeAndNil(I209_4);
  //FreeAndNil(I209_5);
  //FreeAndNil(I209_6);
  //FreeAndNil(I209_7);
  //FreeAndNil(IB209);
  //FreeAndNil(IB209_);
end;

procedure FreeAndNil_IB213();
begin
  //FreeAndNil(I213_0);
  //FreeAndNil(I213_1);
  //FreeAndNil(I213_2);
  //FreeAndNil(I213_3);
  //FreeAndNil(I213_4);
  //FreeAndNil(I213_5);
  //FreeAndNil(I213_6);
  //FreeAndNil(I213_7);
  //FreeAndNil(IB213);
  //FreeAndNil(IB213_);
end;

procedure FreeAndNil_IB217();
begin
  //FreeAndNil(I217_0);
  //FreeAndNil(I217_1);
  //FreeAndNil(I217_2);
  //FreeAndNil(I217_3);
  //FreeAndNil(I217_4);
  //FreeAndNil(I217_5);
  //FreeAndNil(I217_6);
  //FreeAndNil(I217_7);
  //FreeAndNil(IB217);
  //FreeAndNil(IB217_);
end;

procedure FreeAndNil_IB221();
begin
  //FreeAndNil(I221_0);
  //FreeAndNil(I221_1);
  //FreeAndNil(I221_2);
  //FreeAndNil(I221_3);
  //FreeAndNil(I221_4);
  //FreeAndNil(I221_5);
  //FreeAndNil(I221_6);
  //FreeAndNil(I221_7);
  //FreeAndNil(IB221);
  //FreeAndNil(IB221_);
end;

procedure FreeAndNil_DBD();
begin
  FreeAndNil(DB9_DBD32);
  FreeAndNil(DB9_DBD32_);
  FreeAndNil(DB9_DBD36);
  FreeAndNil(DB9_DBD36_);
  FreeAndNil(DB9_DBD40);
  FreeAndNil(DB9_DBD40_);
  FreeAndNil(DB9_DBD56);
  FreeAndNil(DB9_DBD56_);
  FreeAndNil(DB9_DBD60);
  FreeAndNil(DB9_DBD60_);
  FreeAndNil(DB9_DBD64);
  FreeAndNil(DB9_DBD64_);
  FreeAndNil(DB10_DBD4);
  FreeAndNil(DB10_DBD4_);
  FreeAndNil(DB10_DBD22);
  FreeAndNil(DB10_DBD22_);
  FreeAndNil(DB10_DBD26);
  FreeAndNil(DB10_DBD26_);
  FreeAndNil(DB10_DBD30);
  FreeAndNil(DB10_DBD30_);
  FreeAndNil(DB10_DBD42);
  FreeAndNil(DB10_DBD42_);
end;

Function StrToBoolV2(BoolS_:string):boolean;
begin
  if((LowerCase(BoolS_)='true')or(LowerCase(BoolS_)='1')or
     (LowerCase(BoolS_)='one')or(LowerCase(BoolS_)='t')or
     (LowerCase(BoolS_)='a')or(LowerCase(BoolS_)='on')or
     (LowerCase(BoolS_)='ok')or(LowerCase(BoolS_)='out')) then
  result:= true
  else
  result:= false;
end;

end.

