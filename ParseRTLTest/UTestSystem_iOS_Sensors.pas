unit UTestSystem_iOS_Sensors;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_iOS_Sensors = class(TTest)
  published
    procedure TestSystem_iOS_Sensors;
  end;

implementation

procedure TTestSystem_iOS_Sensors.TestSystem_iOS_Sensors;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.iOS.Sensors.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_iOS_Sensors.Suite);
end.
