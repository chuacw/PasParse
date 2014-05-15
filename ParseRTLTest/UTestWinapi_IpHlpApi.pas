unit UTestWinapi_IpHlpApi;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_IpHlpApi = class(TTest)
  published
    procedure TestWinapi_IpHlpApi;
  end;

implementation

procedure TTestWinapi_IpHlpApi.TestWinapi_IpHlpApi;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.IpHlpApi.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_IpHlpApi.Suite);
end.
