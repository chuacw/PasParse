unit UTestPosix_StrOpts;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestPosix_StrOpts = class(TTest)
  published
    procedure TestPosix_StrOpts;
  end;

implementation

procedure TTestPosix_StrOpts.TestPosix_StrOpts;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\posix\Posix.StrOpts.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestPosix_StrOpts.Suite);
end.
