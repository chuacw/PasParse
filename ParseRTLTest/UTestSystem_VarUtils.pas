unit UTestSystem_VarUtils;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_VarUtils = class(TTest)
  published
    procedure TestSystem_VarUtils;
  end;

implementation

procedure TTestSystem_VarUtils.TestSystem_VarUtils;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\sys\System.VarUtils.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_VarUtils.Suite);
end.
