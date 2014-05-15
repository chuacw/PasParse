unit UTestPosix_SysUn;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestPosix_SysUn = class(TTest)
  published
    procedure TestPosix_SysUn;
  end;

implementation

procedure TTestPosix_SysUn.TestPosix_SysUn;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\posix\Posix.SysUn.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestPosix_SysUn.Suite);
end.
