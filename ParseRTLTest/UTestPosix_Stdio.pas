unit UTestPosix_Stdio;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestPosix_Stdio = class(TTest)
  published
    procedure TestPosix_Stdio;
  end;

implementation

procedure TTestPosix_Stdio.TestPosix_Stdio;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\posix\Posix.Stdio.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestPosix_Stdio.Suite);
end.
