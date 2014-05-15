unit UTestWinapi_TlHelp32;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_TlHelp32 = class(TTest)
  published
    procedure TestWinapi_TlHelp32;
  end;

implementation

procedure TTestWinapi_TlHelp32.TestWinapi_TlHelp32;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.TlHelp32.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_TlHelp32.Suite);
end.
