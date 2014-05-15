unit UTestPosix_Fcntl;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestPosix_Fcntl = class(TTest)
  published
    procedure TestPosix_Fcntl;
  end;

implementation

procedure TTestPosix_Fcntl.TestPosix_Fcntl;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\posix\Posix.Fcntl.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestPosix_Fcntl.Suite);
end.
