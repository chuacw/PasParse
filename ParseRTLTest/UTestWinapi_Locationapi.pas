unit UTestWinapi_Locationapi;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_Locationapi = class(TTest)
  published
    procedure TestWinapi_Locationapi;
  end;

implementation

procedure TTestWinapi_Locationapi.TestWinapi_Locationapi;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.Locationapi.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_Locationapi.Suite);
end.
