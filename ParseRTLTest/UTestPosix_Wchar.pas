unit UTestPosix_Wchar;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestPosix_Wchar = class(TTest)
  published
    procedure TestPosix_Wchar;
  end;

implementation

procedure TTestPosix_Wchar.TestPosix_Wchar;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\posix\Posix.Wchar.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestPosix_Wchar.Suite);
end.
