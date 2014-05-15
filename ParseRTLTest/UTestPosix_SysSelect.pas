unit UTestPosix_SysSelect;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestPosix_SysSelect = class(TTest)
  published
    procedure TestPosix_SysSelect;
  end;

implementation

procedure TTestPosix_SysSelect.TestPosix_SysSelect;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\posix\Posix.SysSelect.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestPosix_SysSelect.Suite);
end.
