unit UTestWinapi_DwmApi;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_DwmApi = class(TTest)
  published
    procedure TestWinapi_DwmApi;
  end;

implementation

procedure TTestWinapi_DwmApi.TestWinapi_DwmApi;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.DwmApi.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_DwmApi.Suite);
end.
