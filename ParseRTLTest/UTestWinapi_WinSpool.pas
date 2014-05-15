unit UTestWinapi_WinSpool;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_WinSpool = class(TTest)
  published
    procedure TestWinapi_WinSpool;
  end;

implementation

procedure TTestWinapi_WinSpool.TestWinapi_WinSpool;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.WinSpool.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_WinSpool.Suite);
end.
