unit UTestPosix_SysStat;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestPosix_SysStat = class(TTest)
  published
    procedure TestPosix_SysStat;
  end;

implementation

procedure TTestPosix_SysStat.TestPosix_SysStat;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\posix\Posix.SysStat.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestPosix_SysStat.Suite);
end.
