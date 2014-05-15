unit UTestSystem;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem = class(TTest)
  published
    procedure TestSystem;
  end;

implementation

procedure TTestSystem.TestSystem;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\sys\System.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem.Suite);
end.
