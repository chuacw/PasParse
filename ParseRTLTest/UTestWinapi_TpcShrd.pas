unit UTestWinapi_TpcShrd;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_TpcShrd = class(TTest)
  published
    procedure TestWinapi_TpcShrd;
  end;

implementation

procedure TTestWinapi_TpcShrd.TestWinapi_TpcShrd;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.TpcShrd.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_TpcShrd.Suite);
end.
