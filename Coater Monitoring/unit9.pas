unit Unit9;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Dialogs;

procedure RecordLogFile();
procedure AlarmLogFile();
procedure InitLogFile();
procedure LogFileDisconnect();
procedure LogFileConnect();
procedure LogFileSoftwareClose();

var
  FolderError:boolean;
  FileError:boolean;
  HeaderFile_:string;

implementation

uses
  Unit1, Unit2, Unit5;

procedure RecordLogFile();
var
  MyFolder: string;
  S_Name:string;
  fileout : TextFile;
  File_OK:boolean;
  GravureAutoManual:string;
begin
  MyFolder := GetCurrentDir+'\'+FormatDateTime('MM YYY',Now);

  if not DirectoryExists(MyFolder) then
  begin
    if CreateDir(MyFolder) then
    begin
      //showmessage('Directory created successfully.')
    end
    else
    begin
      //showmessage('Failed to create directory.');
      FolderError:=true;
    end;
  end
  else
  begin
    //showmessage('Directory already exists.');
  end;

  S_Name:=MyFolder+'\'+FormatDateTime('DD MM YYYY',Now)+'.CSV';
  if DirectoryExists(MyFolder) then
  if not FileExists(S_Name) then
  begin
    File_OK:=true;
    try
      AssignFile(fileout, S_Name);
      rewrite (fileout);
    except
      on E: EInOutError do
      begin
        //showmessage('AssignFile error: '+ chr(13)+E.ClassName+'/'+ E.Message+'/'+IntToStr(E.ErrorCode));
        FileError:=false;
        File_OK:=false;
      end;
    end;
    if File_OK then
    begin
      //Create Header File
      writeln(fileout, HeaderFile_);
    end;
  end
  else
  begin
    File_OK:=true;
    try
      AssignFile(fileout, S_Name);
      Append(fileout);
    except
      on E: EInOutError do
      begin
        //showmessage('AssignFile error: '+ chr(13)+E.ClassName+'/'+ E.Message+'/'+IntToStr(E.ErrorCode));
        FileError:=true;
        File_OK:=false;
      end;
    end;
  end;

  if File_OK then
  begin
    GravureAutoManual:='-';
    if M[20]._0 then GravureAutoManual:='GravureAutoMode';
    if M[20]._1 then GravureAutoManual:='GravureManualMode';
    writeln(fileout, FormatDateTime('DD/MM/YYYY',Now)+','+
                     FormatDateTime('hh:nn:ss',Now)+','+
                     FormatFloat('0.00', DB10_DBD4.Value)+'m/min,'+
                     DB9_DBD56.Value.ToString+'kW,'+
                     FormatFloat('0.00', DB9_DBD60.Value)+'kW,'+
                     FormatFloat('0.00', DB9_DBD64.Value)+' W/m^2,'+
                     FormatFloat('0.00', DB10_DBD22.Value)+'%,'+
                     Q[209]._0.ToInteger.ToString+','+
                     FormatFloat('0.00', DB9_DBD32.Value)+'m/min,'+
                     Q[0]._3.ToInteger.ToString+','+
                     Q[0]._1.ToInteger.ToString+','+
                     GravureAutoManual+','+
                     DB10_DBD26.Value.ToString+'m/min,'+
                     MD36.Value.ToString+'m/min,'+
                     Q[213]._0.ToInteger.ToString+','+
                     FormatFloat('0.00',DB9_DBD36.Value)+'m/min,'+
                     Q[0]._2.ToInteger.ToString+','+
                     DB10_DBD30.Value.ToString+'%,'+
                     Q[217]._0.ToInteger.ToString+','+
                     FormatFloat('0.00',DB9_DBD40.Value)+'m/min,'+
                     M[31]._0.ToInteger.ToString+','+
                     M[32]._0.ToInteger.ToString+','+
                     DB10_DBD42.Value.ToString+'m/min,'+
                     M[98]._0.ToInteger.ToString);
    CloseFile(fileout);
  end;
end;

procedure AlarmLogFile();
var
  MyFolder: string;
  S_Name:string;
  fileout : TextFile;
  File_OK:boolean;
  i:integer;
begin
  MyFolder := GetCurrentDir+'\'+FormatDateTime('MM YYY',Now);

  for i:=99 downto 0  do
  begin
    if LogAlarm[i].IsActive then
    begin
      LogAlarm[i].IsActive:=false;

      if not DirectoryExists(MyFolder) then
      begin
        if CreateDir(MyFolder) then
        begin
          //showmessage('Directory created successfully.')
        end
        else
        begin
          showmessage('Failed to create directory.');
          FolderError:=true;
        end;
      end
      else
      begin
        //showmessage('Directory already exists.');
      end;

      S_Name:=MyFolder+'\'+'Alarm_'+FormatDateTime('DD MM YYYY',Now)+'.CSV';
      if DirectoryExists(MyFolder) then
      if not FileExists(S_Name) then
      begin
        File_OK:=true;
        try
          AssignFile(fileout, S_Name);
          rewrite (fileout);
        except
          on E: EInOutError do
          begin
            //showmessage('AssignFile error: '+ chr(13)+E.ClassName+'/'+ E.Message+'/'+IntToStr(E.ErrorCode));
            FileError:=false;
            File_OK:=false;
          end;
        end;
        if File_OK then
        begin
          //Create Header File
          writeln(fileout, 'Date,Time,AlarmMessage');
        end;
      end
      else
      begin
        File_OK:=true;
        try
          AssignFile(fileout, S_Name);
          Append(fileout);
        except
          on E: EInOutError do
          begin
            //showmessage('AssignFile error: '+ chr(13)+E.ClassName+'/'+ E.Message+'/'+IntToStr(E.ErrorCode));
            FileError:=true;
            File_OK:=false;
          end;
        end;
      end;

      if File_OK then
      begin
        writeln(fileout, FormatDateTime('DD/MM/YYYY',Now)+','+FormatDateTime('hh:nn:ss',Now)+
                         ','+LogAlarm[i].Name);
        CloseFile(fileout);
      end;

    end;
    if (not CurrentAlarm[i].IsActive) and (LogAlarm[i].Object_<>'') then
    begin
      LogAlarm[i]:=CurrentAlarm[i];
    end;
  end;

end;

procedure InitLogFile();
var
  MyFolder: string;
  S_Name:string;
  fileout : TextFile;
  File_OK:boolean;
begin
  HeaderFile_:='Date,'+
               'Time,'+
               'LineSpeed,'+
               'CoronaSetpoint,'+
               'CoronaPower,'+
               'CoronaWattDensity,'+
               'AdditionalCoronaSpeed,'+
               'CoronaRollRun,'+
               'CoronaSpeed,'+
               'Electrode,'+
               'ExhaustFan,'+
               'GravureMode,'+
               'AdditionalGravureSpeed,'+
               'ManualGravureSpeedSet,'+
               'GravureRollRun,'+
               'GravureRollSpeed,'+
               'Cartridge,'+
               'AdditionalTakeOffRollSpeed,'+
               'TakeOffRollRun,'+
               'TakeOffRollSpeed,'+
               'SystemOn,'+
               'OperlateMode,'+
               'LineSpeedUpper,'+
               'BypassFilmbrake';
  FolderError:=false;
  FileError:=false;

  MyFolder := GetCurrentDir+'\'+FormatDateTime('MM YYY',Now);

  if not DirectoryExists(MyFolder) then
  begin
    if CreateDir(MyFolder) then
    begin
      //showmessage('Directory created successfully.')
    end
    else
    begin
      showmessage('Failed to create directory.');
      //Self.Menu := nil;
      Form1.MenuConnect.Enabled:=false;
      Form1.MenuView.Enabled:=false;
      Form1.MenuChart.Enabled:=false;
      Form1.TabSheet1.Free;
      Form1.TabSheet2.Free;
      Form1.TabSheet3.Free;
      Form1.TabSheet4.Free;
      Form1.TabSheet5.Free;
      Form1.TabSheet6.Free;
      Form1.OnlinePLC_Timer.Enabled:=false;
      Form1.TCP_UDPPort1.Active:=false;
      Communication_Active:=false;
      FolderError:=true;
    end;
  end
  else
  begin
    //showmessage('Directory already exists.');
  end;

  S_Name:=MyFolder+'\'+FormatDateTime('DD MM YYYY',Now)+'.CSV';
  if DirectoryExists(MyFolder) then
  if not FileExists(S_Name) then
  begin
    File_OK:=true;
    try
      AssignFile(fileout, S_Name);
      rewrite (fileout);
    except
      on E: EInOutError do
      begin
        showmessage('AssignFile error: '+ chr(13)+E.ClassName+'/'+ E.Message+'/'+IntToStr(E.ErrorCode));
        //Self.Menu := nil;
        Form1.MenuConnect.Enabled:=false;
        Form1.MenuView.Enabled:=false;
        Form1.MenuChart.Enabled:=false;
        Form1.TabSheet1.Free;
        Form1.TabSheet2.Free;
        Form1.TabSheet3.Free;
        Form1.TabSheet4.Free;
        Form1.TabSheet5.Free;
        Form1.TabSheet6.Free;
        Form1.OnlinePLC_Timer.Enabled:=false;
        Form1.TCP_UDPPort1.Active:=false;
        Communication_Active:=false;
        FileError:=true;
        File_OK:=false;
      end;
    end;
    if File_OK then
    begin
      //Create Header File
      writeln(fileout, HeaderFile_);
    end;
  end
  else
  begin
    File_OK:=true;
    try
      AssignFile(fileout, S_Name);
      Append(fileout);
    except
      on E: EInOutError do
      begin
        showmessage('AssignFile error: '+ chr(13)+E.ClassName+'/'+ E.Message+'/'+IntToStr(E.ErrorCode));
        //Self.Menu := nil;
        Form1.MenuConnect.Enabled:=false;
        Form1.MenuView.Enabled:=false;
        Form1.MenuChart.Enabled:=false;
        Form1.TabSheet1.Free;
        Form1.TabSheet2.Free;
        Form1.TabSheet3.Free;
        Form1.TabSheet4.Free;
        Form1.TabSheet5.Free;
        Form1.TabSheet6.Free;
        Form1.OnlinePLC_Timer.Enabled:=false;
        Form1.TCP_UDPPort1.Active:=false;
        Communication_Active:=false;
        FileError:=true;
        File_OK:=false;
      end;
    end;
  end;

  if File_OK then
  begin
    writeln(fileout, 'Software Start:,'+FormatDateTime('DD/MM/YYYY',Now)+','+FormatDateTime('hh:nn:ss',Now));
    CloseFile(fileout);
  end;
end;

procedure LogFileDisconnect();
var
  MyFolder: string;
  S_Name:string;
  fileout : TextFile;
  File_OK:boolean;
begin
  MyFolder := GetCurrentDir+'\'+FormatDateTime('MM YYY',Now);

  if not DirectoryExists(MyFolder) then
  begin
    if CreateDir(MyFolder) then
    begin
      //showmessage('Directory created successfully.')
    end
    else
    begin
      showmessage('Failed to create directory.');
      //Self.Menu := nil;
      Form1.MenuConnect.Enabled:=false;
      Form1.MenuView.Enabled:=false;
      Form1.MenuChart.Enabled:=false;
      Form1.TabSheet1.Free;
      Form1.TabSheet2.Free;
      Form1.TabSheet3.Free;
      Form1.TabSheet4.Free;
      Form1.TabSheet5.Free;
      Form1.TabSheet6.Free;
      Form1.OnlinePLC_Timer.Enabled:=false;
      Form1.TCP_UDPPort1.Active:=false;
      Communication_Active:=false;
      FolderError:=true;
    end;
  end
  else
  begin
    //showmessage('Directory already exists.');
  end;

  S_Name:=MyFolder+'\'+FormatDateTime('DD MM YYYY',Now)+'.CSV';
  if DirectoryExists(MyFolder) then
  if not FileExists(S_Name) then
  begin
    File_OK:=true;
    try
      AssignFile(fileout, S_Name);
      rewrite (fileout);
    except
      on E: EInOutError do
      begin
        showmessage('AssignFile error: '+ chr(13)+E.ClassName+'/'+ E.Message+'/'+IntToStr(E.ErrorCode));
        //Self.Menu := nil;
        Form1.MenuConnect.Enabled:=false;
        Form1.MenuView.Enabled:=false;
        Form1.MenuChart.Enabled:=false;
        Form1.TabSheet1.Free;
        Form1.TabSheet2.Free;
        Form1.TabSheet3.Free;
        Form1.TabSheet4.Free;
        Form1.TabSheet5.Free;
        Form1.TabSheet6.Free;
        Form1.OnlinePLC_Timer.Enabled:=false;
        Form1.TCP_UDPPort1.Active:=false;
        Communication_Active:=false;
        FileError:=true;
        File_OK:=false;
      end;
    end;
    if File_OK then
    begin
      //Create Header File
      writeln(fileout, HeaderFile_);
    end;
  end
  else
  begin
    File_OK:=true;
    try
      AssignFile(fileout, S_Name);
      Append(fileout);
    except
      on E: EInOutError do
      begin
        showmessage('AssignFile error: '+ chr(13)+E.ClassName+'/'+ E.Message+'/'+IntToStr(E.ErrorCode));
        //Self.Menu := nil;
        Form1.MenuConnect.Enabled:=false;
        Form1.MenuView.Enabled:=false;
        Form1.MenuChart.Enabled:=false;
        Form1.TabSheet1.Free;
        Form1.TabSheet2.Free;
        Form1.TabSheet3.Free;
        Form1.TabSheet4.Free;
        Form1.TabSheet5.Free;
        Form1.TabSheet6.Free;
        Form1.OnlinePLC_Timer.Enabled:=false;
        Form1.TCP_UDPPort1.Active:=false;
        Communication_Active:=false;
        FileError:=true;
        File_OK:=false;
      end;
    end;
  end;

  if File_OK then
  begin
    writeln(fileout, 'Disconnect:,'+FormatDateTime('DD/MM/YYYY',Now)+','+FormatDateTime('hh:nn:ss',Now));
    CloseFile(fileout);
  end;
end;

procedure LogFileConnect();
var
  MyFolder: string;
  S_Name:string;
  fileout : TextFile;
  File_OK:boolean;
begin
  MyFolder := GetCurrentDir+'\'+FormatDateTime('MM YYY',Now);

  if not DirectoryExists(MyFolder) then
  begin
    if CreateDir(MyFolder) then
    begin
      //showmessage('Directory created successfully.')
    end
    else
    begin
      showmessage('Failed to create directory.');
      //Self.Menu := nil;
      Form1.MenuConnect.Enabled:=false;
      Form1.MenuView.Enabled:=false;
      Form1.MenuChart.Enabled:=false;
      Form1.TabSheet1.Free;
      Form1.TabSheet2.Free;
      Form1.TabSheet3.Free;
      Form1.TabSheet4.Free;
      Form1.TabSheet5.Free;
      Form1.TabSheet6.Free;
      Form1.OnlinePLC_Timer.Enabled:=false;
      Form1.TCP_UDPPort1.Active:=false;
      Communication_Active:=false;
      FolderError:=true;
    end;
  end
  else
  begin
    //showmessage('Directory already exists.');
  end;

  S_Name:=MyFolder+'\'+FormatDateTime('DD MM YYYY',Now)+'.CSV';
  if DirectoryExists(MyFolder) then
  if not FileExists(S_Name) then
  begin
    File_OK:=true;
    try
      AssignFile(fileout, S_Name);
      rewrite (fileout);
    except
      on E: EInOutError do
      begin
        showmessage('AssignFile error: '+ chr(13)+E.ClassName+'/'+ E.Message+'/'+IntToStr(E.ErrorCode));
        //Self.Menu := nil;
        Form1.MenuConnect.Enabled:=false;
        Form1.MenuView.Enabled:=false;
        Form1.MenuChart.Enabled:=false;
        Form1.TabSheet1.Free;
        Form1.TabSheet2.Free;
        Form1.TabSheet3.Free;
        Form1.TabSheet4.Free;
        Form1.TabSheet5.Free;
        Form1.TabSheet6.Free;
        Form1.OnlinePLC_Timer.Enabled:=false;
        Form1.TCP_UDPPort1.Active:=false;
        Communication_Active:=false;
        FileError:=true;
        File_OK:=false;
      end;
    end;
    if File_OK then
    begin
      //Create Header File
      writeln(fileout, HeaderFile_);
    end;
  end
  else
  begin
    File_OK:=true;
    try
      AssignFile(fileout, S_Name);
      Append(fileout);
    except
      on E: EInOutError do
      begin
        showmessage('AssignFile error: '+ chr(13)+E.ClassName+'/'+ E.Message+'/'+IntToStr(E.ErrorCode));
        //Self.Menu := nil;
        Form1.MenuConnect.Enabled:=false;
        Form1.MenuView.Enabled:=false;
        Form1.MenuChart.Enabled:=false;
        Form1.TabSheet1.Free;
        Form1.TabSheet2.Free;
        Form1.TabSheet3.Free;
        Form1.TabSheet4.Free;
        Form1.TabSheet5.Free;
        Form1.TabSheet6.Free;
        Form1.OnlinePLC_Timer.Enabled:=false;
        Form1.TCP_UDPPort1.Active:=false;
        Communication_Active:=false;
        FileError:=true;
        File_OK:=false;
      end;
    end;
  end;

  if File_OK then
  begin
    writeln(fileout, 'Connect:,'+FormatDateTime('DD/MM/YYYY',Now)+','+FormatDateTime('hh:nn:ss',Now));
    CloseFile(fileout);
  end;
end;

procedure LogFileSoftwareClose();
var
  MyFolder: string;
  S_Name:string;
  fileout : TextFile;
  File_OK:boolean;
begin
  MyFolder := GetCurrentDir+'\'+FormatDateTime('MM YYY',Now);

  if not DirectoryExists(MyFolder) then
  begin
    if CreateDir(MyFolder) then
    begin
      //showmessage('Directory created successfully.')
    end
    else
    begin
      showmessage('Failed to create directory.');
      //Self.Menu := nil;
      Form1.MenuConnect.Enabled:=false;
      Form1.MenuView.Enabled:=false;
      Form1.MenuChart.Enabled:=false;
      Form1.TabSheet1.Free;
      Form1.TabSheet2.Free;
      Form1.TabSheet3.Free;
      Form1.TabSheet4.Free;
      Form1.TabSheet5.Free;
      Form1.TabSheet6.Free;
      Form1.OnlinePLC_Timer.Enabled:=false;
      Form1.TCP_UDPPort1.Active:=false;
      Communication_Active:=false;
      FolderError:=true;
    end;
  end
  else
  begin
    //showmessage('Directory already exists.');
  end;

  S_Name:=MyFolder+'\'+FormatDateTime('DD MM YYYY',Now)+'.CSV';
  if DirectoryExists(MyFolder) then
  if not FileExists(S_Name) then
  begin
    File_OK:=true;
    try
      AssignFile(fileout, S_Name);
      rewrite (fileout);
    except
      on E: EInOutError do
      begin
        showmessage('AssignFile error: '+ chr(13)+E.ClassName+'/'+ E.Message+'/'+IntToStr(E.ErrorCode));
        //Self.Menu := nil;
        Form1.MenuConnect.Enabled:=false;
        Form1.MenuView.Enabled:=false;
        Form1.MenuChart.Enabled:=false;
        Form1.TabSheet1.Free;
        Form1.TabSheet2.Free;
        Form1.TabSheet3.Free;
        Form1.TabSheet4.Free;
        Form1.TabSheet5.Free;
        Form1.TabSheet6.Free;
        Form1.OnlinePLC_Timer.Enabled:=false;
        Form1.TCP_UDPPort1.Active:=false;
        Communication_Active:=false;
        FileError:=true;
        File_OK:=false;
      end;
    end;
    if File_OK then
    begin
      //Create Header File
      writeln(fileout, HeaderFile_);
    end;
  end
  else
  begin
    File_OK:=true;
    try
      AssignFile(fileout, S_Name);
      Append(fileout);
    except
      on E: EInOutError do
      begin
        showmessage('AssignFile error: '+ chr(13)+E.ClassName+'/'+ E.Message+'/'+IntToStr(E.ErrorCode));
        //Self.Menu := nil;
        Form1.MenuConnect.Enabled:=false;
        Form1.MenuView.Enabled:=false;
        Form1.MenuChart.Enabled:=false;
        Form1.TabSheet1.Free;
        Form1.TabSheet2.Free;
        Form1.TabSheet3.Free;
        Form1.TabSheet4.Free;
        Form1.TabSheet5.Free;
        Form1.TabSheet6.Free;
        Form1.OnlinePLC_Timer.Enabled:=false;
        Form1.TCP_UDPPort1.Active:=false;
        Communication_Active:=false;
        FileError:=true;
        File_OK:=false;
      end;
    end;
  end;

  if File_OK then
  begin
    writeln(fileout, 'Software Close:,'+FormatDateTime('DD/MM/YYYY',Now)+','+FormatDateTime('hh:nn:ss',Now));
    CloseFile(fileout);
  end;
end;



end.

