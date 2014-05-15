unit UTestWinapi_Penwin;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_Penwin = class(TTest)
  published
    procedure TestWinapi_Penwin;
  end;

implementation

procedure TTestWinapi_Penwin.TestWinapi_Penwin;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.Penwin.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_Penwin.Suite);
end.
