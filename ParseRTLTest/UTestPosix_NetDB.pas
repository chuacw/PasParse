unit UTestPosix_NetDB;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestPosix_NetDB = class(TTest)
  published
    procedure TestPosix_NetDB;
  end;

implementation

procedure TTestPosix_NetDB.TestPosix_NetDB;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\posix\Posix.NetDB.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestPosix_NetDB.Suite);
end.
