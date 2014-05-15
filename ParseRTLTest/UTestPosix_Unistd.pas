unit UTestPosix_Unistd;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestPosix_Unistd = class(TTest)
  published
    procedure TestPosix_Unistd;
  end;

implementation

procedure TTestPosix_Unistd.TestPosix_Unistd;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\posix\Posix.Unistd.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestPosix_Unistd.Suite);
end.
