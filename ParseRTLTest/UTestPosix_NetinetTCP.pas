unit UTestPosix_NetinetTCP;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestPosix_NetinetTCP = class(TTest)
  published
    procedure TestPosix_NetinetTCP;
  end;

implementation

procedure TTestPosix_NetinetTCP.TestPosix_NetinetTCP;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\posix\Posix.NetinetTCP.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestPosix_NetinetTCP.Suite);
end.
