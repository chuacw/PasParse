unit UTestWinapi_WinSock;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_WinSock = class(TTest)
  published
    procedure TestWinapi_WinSock;
  end;

implementation

procedure TTestWinapi_WinSock.TestWinapi_WinSock;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.WinSock.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_WinSock.Suite);
end.
