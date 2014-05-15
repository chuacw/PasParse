unit UTestPosix_Pthread;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestPosix_Pthread = class(TTest)
  published
    procedure TestPosix_Pthread;
  end;

implementation

procedure TTestPosix_Pthread.TestPosix_Pthread;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\posix\Posix.Pthread.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestPosix_Pthread.Suite);
end.
