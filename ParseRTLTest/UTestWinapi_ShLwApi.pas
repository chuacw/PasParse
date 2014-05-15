unit UTestWinapi_ShLwApi;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_ShLwApi = class(TTest)
  published
    procedure TestWinapi_ShLwApi;
  end;

implementation

procedure TTestWinapi_ShLwApi.TestWinapi_ShLwApi;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.ShLwApi.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_ShLwApi.Suite);
end.
