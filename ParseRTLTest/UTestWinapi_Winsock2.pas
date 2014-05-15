unit UTestWinapi_Winsock2;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_Winsock2 = class(TTest)
  published
    procedure TestWinapi_Winsock2;
  end;

implementation

procedure TTestWinapi_Winsock2.TestWinapi_Winsock2;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.Winsock2.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_Winsock2.Suite);
end.
