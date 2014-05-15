unit UTestSystem_Android_Sensors;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_Android_Sensors = class(TTest)
  published
    procedure TestSystem_Android_Sensors;
  end;

implementation

procedure TTestSystem_Android_Sensors.TestSystem_Android_Sensors;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.Android.Sensors.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_Android_Sensors.Suite);
end.
