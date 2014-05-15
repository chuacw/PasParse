unit UTestWinapi_Isapi;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_Isapi = class(TTest)
  published
    procedure TestWinapi_Isapi;
  end;

implementation

procedure TTestWinapi_Isapi.TestWinapi_Isapi;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.Isapi.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_Isapi.Suite);
end.
