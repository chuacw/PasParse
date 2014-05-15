unit UTestWinapi_UrlMon;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_UrlMon = class(TTest)
  published
    procedure TestWinapi_UrlMon;
  end;

implementation

procedure TTestWinapi_UrlMon.TestWinapi_UrlMon;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.UrlMon.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_UrlMon.Suite);
end.
