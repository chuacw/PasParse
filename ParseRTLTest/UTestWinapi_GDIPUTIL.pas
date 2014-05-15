unit UTestWinapi_GDIPUTIL;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_GDIPUTIL = class(TTest)
  published
    procedure TestWinapi_GDIPUTIL;
  end;

implementation

procedure TTestWinapi_GDIPUTIL.TestWinapi_GDIPUTIL;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.GDIPUTIL.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_GDIPUTIL.Suite);
end.
