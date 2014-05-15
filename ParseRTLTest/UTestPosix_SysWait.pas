unit UTestPosix_SysWait;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestPosix_SysWait = class(TTest)
  published
    procedure TestPosix_SysWait;
  end;

implementation

procedure TTestPosix_SysWait.TestPosix_SysWait;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\posix\Posix.SysWait.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestPosix_SysWait.Suite);
end.
