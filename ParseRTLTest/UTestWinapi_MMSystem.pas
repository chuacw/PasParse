unit UTestWinapi_MMSystem;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_MMSystem = class(TTest)
  published
    procedure TestWinapi_MMSystem;
  end;

implementation

procedure TTestWinapi_MMSystem.TestWinapi_MMSystem;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.MMSystem.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_MMSystem.Suite);
end.
