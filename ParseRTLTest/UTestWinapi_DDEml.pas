unit UTestWinapi_DDEml;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_DDEml = class(TTest)
  published
    procedure TestWinapi_DDEml;
  end;

implementation

procedure TTestWinapi_DDEml.TestWinapi_DDEml;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.DDEml.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_DDEml.Suite);
end.
