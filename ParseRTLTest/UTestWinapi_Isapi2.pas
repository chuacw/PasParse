unit UTestWinapi_Isapi2;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_Isapi2 = class(TTest)
  published
    procedure TestWinapi_Isapi2;
  end;

implementation

procedure TTestWinapi_Isapi2.TestWinapi_Isapi2;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.Isapi2.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_Isapi2.Suite);
end.
