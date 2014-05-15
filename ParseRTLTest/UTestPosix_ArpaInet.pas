unit UTestPosix_ArpaInet;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestPosix_ArpaInet = class(TTest)
  published
    procedure TestPosix_ArpaInet;
  end;

implementation

procedure TTestPosix_ArpaInet.TestPosix_ArpaInet;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\posix\Posix.ArpaInet.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestPosix_ArpaInet.Suite);
end.
