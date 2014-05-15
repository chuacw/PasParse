unit UTestPosix_Locale;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestPosix_Locale = class(TTest)
  published
    procedure TestPosix_Locale;
  end;

implementation

procedure TTestPosix_Locale.TestPosix_Locale;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\posix\Posix.Locale.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestPosix_Locale.Suite);
end.
