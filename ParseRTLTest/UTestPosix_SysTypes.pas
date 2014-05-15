unit UTestPosix_SysTypes;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestPosix_SysTypes = class(TTest)
  published
    procedure TestPosix_SysTypes;
  end;

implementation

procedure TTestPosix_SysTypes.TestPosix_SysTypes;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\posix\Posix.SysTypes.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestPosix_SysTypes.Suite);
end.
