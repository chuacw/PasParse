unit UTestWinapi_GDIPAPI;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_GDIPAPI = class(TTest)
  published
    procedure TestWinapi_GDIPAPI;
  end;

implementation

procedure TTestWinapi_GDIPAPI.TestWinapi_GDIPAPI;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.GDIPAPI.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_GDIPAPI.Suite);
end.
