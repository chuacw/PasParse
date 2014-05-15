unit UTestWinapi_PropSys;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_PropSys = class(TTest)
  published
    procedure TestWinapi_PropSys;
  end;

implementation

procedure TTestWinapi_PropSys.TestWinapi_PropSys;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.PropSys.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_PropSys.Suite);
end.
