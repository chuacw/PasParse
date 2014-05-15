unit UTestPosix_SysUio;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestPosix_SysUio = class(TTest)
  published
    procedure TestPosix_SysUio;
  end;

implementation

procedure TTestPosix_SysUio.TestPosix_SysUio;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\posix\Posix.SysUio.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestPosix_SysUio.Suite);
end.
