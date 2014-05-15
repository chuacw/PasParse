unit UTestPosix_Errno;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestPosix_Errno = class(TTest)
  published
    procedure TestPosix_Errno;
  end;

implementation

procedure TTestPosix_Errno.TestPosix_Errno;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\posix\Posix.Errno.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestPosix_Errno.Suite);
end.
