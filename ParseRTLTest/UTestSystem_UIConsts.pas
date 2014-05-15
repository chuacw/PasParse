unit UTestSystem_UIConsts;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_UIConsts = class(TTest)
  published
    procedure TestSystem_UIConsts;
  end;

implementation

procedure TTestSystem_UIConsts.TestSystem_UIConsts;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.UIConsts.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_UIConsts.Suite);
end.
