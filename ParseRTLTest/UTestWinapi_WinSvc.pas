unit UTestWinapi_WinSvc;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_WinSvc = class(TTest)
  published
    procedure TestWinapi_WinSvc;
  end;

implementation

procedure TTestWinapi_WinSvc.TestWinapi_WinSvc;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.WinSvc.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_WinSvc.Suite);
end.
