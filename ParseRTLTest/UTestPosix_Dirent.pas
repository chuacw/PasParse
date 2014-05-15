unit UTestPosix_Dirent;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestPosix_Dirent = class(TTest)
  published
    procedure TestPosix_Dirent;
  end;

implementation

procedure TTestPosix_Dirent.TestPosix_Dirent;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\posix\Posix.Dirent.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestPosix_Dirent.Suite);
end.
