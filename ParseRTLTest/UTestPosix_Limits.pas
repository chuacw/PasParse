unit UTestPosix_Limits;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestPosix_Limits = class(TTest)
  published
    procedure TestPosix_Limits;
  end;

implementation

procedure TTestPosix_Limits.TestPosix_Limits;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\posix\Posix.Limits.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestPosix_Limits.Suite);
end.
