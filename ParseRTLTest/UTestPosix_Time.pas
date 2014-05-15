unit UTestPosix_Time;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestPosix_Time = class(TTest)
  published
    procedure TestPosix_Time;
  end;

implementation

procedure TTestPosix_Time.TestPosix_Time;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\posix\Posix.Time.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestPosix_Time.Suite);
end.
