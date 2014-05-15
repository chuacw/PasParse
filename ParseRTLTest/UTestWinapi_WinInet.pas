unit UTestWinapi_WinInet;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_WinInet = class(TTest)
  published
    procedure TestWinapi_WinInet;
  end;

implementation

procedure TTestWinapi_WinInet.TestWinapi_WinInet;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.WinInet.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_WinInet.Suite);
end.
