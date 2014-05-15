unit UTestPosix_Grp;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestPosix_Grp = class(TTest)
  published
    procedure TestPosix_Grp;
  end;

implementation

procedure TTestPosix_Grp.TestPosix_Grp;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\posix\Posix.Grp.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestPosix_Grp.Suite);
end.
