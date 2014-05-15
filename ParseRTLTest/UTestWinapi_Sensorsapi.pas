unit UTestWinapi_Sensorsapi;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_Sensorsapi = class(TTest)
  published
    procedure TestWinapi_Sensorsapi;
  end;

implementation

procedure TTestWinapi_Sensorsapi.TestWinapi_Sensorsapi;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.Sensorsapi.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_Sensorsapi.Suite);
end.
