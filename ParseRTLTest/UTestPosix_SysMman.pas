unit UTestPosix_SysMman;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestPosix_SysMman = class(TTest)
  published
    procedure TestPosix_SysMman;
  end;

implementation

procedure TTestPosix_SysMman.TestPosix_SysMman;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\posix\Posix.SysMman.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestPosix_SysMman.Suite);
end.
