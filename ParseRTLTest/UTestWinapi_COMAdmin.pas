unit UTestWinapi_COMAdmin;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_COMAdmin = class(TTest)
  published
    procedure TestWinapi_COMAdmin;
  end;

implementation

procedure TTestWinapi_COMAdmin.TestWinapi_COMAdmin;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.COMAdmin.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_COMAdmin.Suite);
end.
