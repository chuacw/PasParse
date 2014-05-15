unit UTestWinapi_PsAPI;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_PsAPI = class(TTest)
  published
    procedure TestWinapi_PsAPI;
  end;

implementation

procedure TTestWinapi_PsAPI.TestWinapi_PsAPI;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.PsAPI.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_PsAPI.Suite);
end.
