unit UTestPosix_Base;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestPosix_Base = class(TTest)
  published
    procedure TestPosix_Base;
  end;

implementation

procedure TTestPosix_Base.TestPosix_Base;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\posix\Posix.Base.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestPosix_Base.Suite);
end.
