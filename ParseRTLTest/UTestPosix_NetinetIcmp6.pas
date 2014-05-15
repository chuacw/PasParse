unit UTestPosix_NetinetIcmp6;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestPosix_NetinetIcmp6 = class(TTest)
  published
    procedure TestPosix_NetinetIcmp6;
  end;

implementation

procedure TTestPosix_NetinetIcmp6.TestPosix_NetinetIcmp6;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\posix\Posix.NetinetIcmp6.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestPosix_NetinetIcmp6.Suite);
end.
