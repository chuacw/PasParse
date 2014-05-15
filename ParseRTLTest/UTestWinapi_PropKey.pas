unit UTestWinapi_PropKey;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_PropKey = class(TTest)
  published
    procedure TestWinapi_PropKey;
  end;

implementation

procedure TTestWinapi_PropKey.TestWinapi_PropKey;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.PropKey.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_PropKey.Suite);
end.
