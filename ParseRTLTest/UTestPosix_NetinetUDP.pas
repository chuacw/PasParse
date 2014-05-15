unit UTestPosix_NetinetUDP;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestPosix_NetinetUDP = class(TTest)
  published
    procedure TestPosix_NetinetUDP;
  end;

implementation

procedure TTestPosix_NetinetUDP.TestPosix_NetinetUDP;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\posix\Posix.NetinetUDP.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestPosix_NetinetUDP.Suite);
end.
