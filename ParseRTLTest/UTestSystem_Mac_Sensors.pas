unit UTestSystem_Mac_Sensors;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_Mac_Sensors = class(TTest)
  published
    procedure TestSystem_Mac_Sensors;
  end;

implementation

procedure TTestSystem_Mac_Sensors.TestSystem_Mac_Sensors;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.Mac.Sensors.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_Mac_Sensors.Suite);
end.
