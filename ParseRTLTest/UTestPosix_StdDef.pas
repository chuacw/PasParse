unit UTestPosix_StdDef;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestPosix_StdDef = class(TTest)
  published
    procedure TestPosix_StdDef;
  end;

implementation

procedure TTestPosix_StdDef.TestPosix_StdDef;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\posix\Posix.StdDef.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestPosix_StdDef.Suite);
end.
