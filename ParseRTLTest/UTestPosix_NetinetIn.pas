unit UTestPosix_NetinetIn;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestPosix_NetinetIn = class(TTest)
  published
    procedure TestPosix_NetinetIn;
  end;

implementation

procedure TTestPosix_NetinetIn.TestPosix_NetinetIn;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\posix\Posix.NetinetIn.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestPosix_NetinetIn.Suite);
end.
