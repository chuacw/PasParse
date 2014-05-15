unit UTestPosix_NetIf;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestPosix_NetIf = class(TTest)
  published
    procedure TestPosix_NetIf;
  end;

implementation

procedure TTestPosix_NetIf.TestPosix_NetIf;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\posix\Posix.NetIf.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestPosix_NetIf.Suite);
end.
