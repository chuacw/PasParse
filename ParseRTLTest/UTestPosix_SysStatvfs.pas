unit UTestPosix_SysStatvfs;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestPosix_SysStatvfs = class(TTest)
  published
    procedure TestPosix_SysStatvfs;
  end;

implementation

procedure TTestPosix_SysStatvfs.TestPosix_SysStatvfs;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\posix\Posix.SysStatvfs.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestPosix_SysStatvfs.Suite);
end.
