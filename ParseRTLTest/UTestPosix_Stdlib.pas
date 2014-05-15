unit UTestPosix_Stdlib;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestPosix_Stdlib = class(TTest)
  published
    procedure TestPosix_Stdlib;
  end;

implementation

procedure TTestPosix_Stdlib.TestPosix_Stdlib;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\posix\Posix.Stdlib.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestPosix_Stdlib.Suite);
end.
