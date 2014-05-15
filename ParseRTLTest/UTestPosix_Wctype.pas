unit UTestPosix_Wctype;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestPosix_Wctype = class(TTest)
  published
    procedure TestPosix_Wctype;
  end;

implementation

procedure TTestPosix_Wctype.TestPosix_Wctype;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\posix\Posix.Wctype.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestPosix_Wctype.Suite);
end.
