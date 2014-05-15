unit UTestSystem_Actions;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_Actions = class(TTest)
  published
    procedure TestSystem_Actions;
  end;

implementation

procedure TTestSystem_Actions.TestSystem_Actions;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.Actions.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_Actions.Suite);
end.
