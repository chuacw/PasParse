unit UTestPosix_Iconv;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestPosix_Iconv = class(TTest)
  published
    procedure TestPosix_Iconv;
  end;

implementation

procedure TTestPosix_Iconv.TestPosix_Iconv;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\posix\Posix.Iconv.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestPosix_Iconv.Suite);
end.
