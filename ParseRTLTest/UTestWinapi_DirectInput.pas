unit UTestWinapi_DirectInput;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_DirectInput = class(TTest)
  published
    procedure TestWinapi_DirectInput;
  end;

implementation

procedure TTestWinapi_DirectInput.TestWinapi_DirectInput;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.DirectInput.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_DirectInput.Suite);
end.
