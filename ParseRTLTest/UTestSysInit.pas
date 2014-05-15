unit UTestSysInit;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSysInit = class(TTest)
  published
    procedure TestSysInit;
  end;

implementation

procedure TTestSysInit.TestSysInit;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\sys\SysInit.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSysInit.Suite);
end.
