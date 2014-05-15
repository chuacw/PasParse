unit UTestPosix_SysTimes;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestPosix_SysTimes = class(TTest)
  published
    procedure TestPosix_SysTimes;
  end;

implementation

procedure TTestPosix_SysTimes.TestPosix_SysTimes;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\posix\Posix.SysTimes.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestPosix_SysTimes.Suite);
end.
