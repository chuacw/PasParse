unit UTestSystem_Sensors;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_Sensors = class(TTest)
  published
    procedure TestSystem_Sensors;
  end;

implementation

procedure TTestSystem_Sensors.TestSystem_Sensors;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.Sensors.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_Sensors.Suite);
end.
