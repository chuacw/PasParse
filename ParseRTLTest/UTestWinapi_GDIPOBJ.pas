unit UTestWinapi_GDIPOBJ;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_GDIPOBJ = class(TTest)
  published
    procedure TestWinapi_GDIPOBJ;
  end;

implementation

procedure TTestWinapi_GDIPOBJ.TestWinapi_GDIPOBJ;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.GDIPOBJ.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_GDIPOBJ.Suite);
end.
