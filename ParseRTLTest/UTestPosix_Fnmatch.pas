unit UTestPosix_Fnmatch;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestPosix_Fnmatch = class(TTest)
  published
    procedure TestPosix_Fnmatch;
  end;

implementation

procedure TTestPosix_Fnmatch.TestPosix_Fnmatch;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\posix\Posix.Fnmatch.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestPosix_Fnmatch.Suite);
end.
