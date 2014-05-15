unit UTestWinapi_WMF9;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_WMF9 = class(TTest)
  published
    procedure TestWinapi_WMF9;
  end;

implementation

procedure TTestWinapi_WMF9.TestWinapi_WMF9;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.WMF9.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_WMF9.Suite);
end.
