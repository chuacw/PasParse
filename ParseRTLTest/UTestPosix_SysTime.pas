unit UTestPosix_SysTime;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestPosix_SysTime = class(TTest)
  published
    procedure TestPosix_SysTime;
  end;

implementation

procedure TTestPosix_SysTime.TestPosix_SysTime;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\posix\Posix.SysTime.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestPosix_SysTime.Suite);
end.
