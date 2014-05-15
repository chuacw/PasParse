unit UTestPosix_Semaphore;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestPosix_Semaphore = class(TTest)
  published
    procedure TestPosix_Semaphore;
  end;

implementation

procedure TTestPosix_Semaphore.TestPosix_Semaphore;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\posix\Posix.Semaphore.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestPosix_Semaphore.Suite);
end.
