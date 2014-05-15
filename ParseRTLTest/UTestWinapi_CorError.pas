unit UTestWinapi_CorError;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_CorError = class(TTest)
  published
    procedure TestWinapi_CorError;
  end;

implementation

procedure TTestWinapi_CorError.TestWinapi_CorError;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.CorError.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_CorError.Suite);
end.
