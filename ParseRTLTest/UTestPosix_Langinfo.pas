unit UTestPosix_Langinfo;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestPosix_Langinfo = class(TTest)
  published
    procedure TestPosix_Langinfo;
  end;

implementation

procedure TTestPosix_Langinfo.TestPosix_Langinfo;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\posix\Posix.Langinfo.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestPosix_Langinfo.Suite);
end.
