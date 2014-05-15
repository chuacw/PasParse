unit UTestPosix_Wordexp;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestPosix_Wordexp = class(TTest)
  published
    procedure TestPosix_Wordexp;
  end;

implementation

procedure TTestPosix_Wordexp.TestPosix_Wordexp;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\posix\Posix.Wordexp.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestPosix_Wordexp.Suite);
end.
