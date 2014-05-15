unit UTestPosix_SysSocket;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestPosix_SysSocket = class(TTest)
  published
    procedure TestPosix_SysSocket;
  end;

implementation

procedure TTestPosix_SysSocket.TestPosix_SysSocket;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\posix\Posix.SysSocket.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestPosix_SysSocket.Suite);
end.
