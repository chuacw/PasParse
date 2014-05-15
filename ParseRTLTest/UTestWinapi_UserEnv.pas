unit UTestWinapi_UserEnv;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_UserEnv = class(TTest)
  published
    procedure TestWinapi_UserEnv;
  end;

implementation

procedure TTestWinapi_UserEnv.TestWinapi_UserEnv;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.UserEnv.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_UserEnv.Suite);
end.
