unit UTestPosix_Sched;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestPosix_Sched = class(TTest)
  published
    procedure TestPosix_Sched;
  end;

implementation

procedure TTestPosix_Sched.TestPosix_Sched;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\posix\Posix.Sched.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestPosix_Sched.Suite);
end.
