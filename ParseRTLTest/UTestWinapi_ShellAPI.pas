unit UTestWinapi_ShellAPI;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_ShellAPI = class(TTest)
  published
    procedure TestWinapi_ShellAPI;
  end;

implementation

procedure TTestWinapi_ShellAPI.TestWinapi_ShellAPI;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.ShellAPI.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_ShellAPI.Suite);
end.
