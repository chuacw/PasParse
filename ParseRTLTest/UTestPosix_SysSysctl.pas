unit UTestPosix_SysSysctl;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestPosix_SysSysctl = class(TTest)
  published
    procedure TestPosix_SysSysctl;
  end;

implementation

procedure TTestPosix_SysSysctl.TestPosix_SysSysctl;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\posix\Posix.SysSysctl.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestPosix_SysSysctl.Suite);
end.
