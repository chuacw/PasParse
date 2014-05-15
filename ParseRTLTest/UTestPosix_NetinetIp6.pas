unit UTestPosix_NetinetIp6;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestPosix_NetinetIp6 = class(TTest)
  published
    procedure TestPosix_NetinetIp6;
  end;

implementation

procedure TTestPosix_NetinetIp6.TestPosix_NetinetIp6;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\posix\Posix.NetinetIp6.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestPosix_NetinetIp6.Suite);
end.
