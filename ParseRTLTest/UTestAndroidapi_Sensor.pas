unit UTestAndroidapi_Sensor;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_Sensor = class(TTest)
  published
    procedure TestAndroidapi_Sensor;
  end;

implementation

procedure TTestAndroidapi_Sensor.TestAndroidapi_Sensor;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.Sensor.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_Sensor.Suite);
end.
