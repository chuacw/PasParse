unit UTestPosix_Pwd;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestPosix_Pwd = class(TTest)
  published
    procedure TestPosix_Pwd;
  end;

implementation

procedure TTestPosix_Pwd.TestPosix_Pwd;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\posix\Posix.Pwd.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestPosix_Pwd.Suite);
end.
