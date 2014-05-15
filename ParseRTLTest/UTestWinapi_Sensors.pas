unit UTestWinapi_Sensors;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_Sensors = class(TTest)
  published
    procedure TestWinapi_Sensors;
  end;

implementation

procedure TTestWinapi_Sensors.TestWinapi_Sensors;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.Sensors.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_Sensors.Suite);
end.
