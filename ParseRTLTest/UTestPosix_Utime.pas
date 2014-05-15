unit UTestPosix_Utime;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestPosix_Utime = class(TTest)
  published
    procedure TestPosix_Utime;
  end;

implementation

procedure TTestPosix_Utime.TestPosix_Utime;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\posix\Posix.Utime.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestPosix_Utime.Suite);
end.
