unit UTestSystem_JSONConsts;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_JSONConsts = class(TTest)
  published
    procedure TestSystem_JSONConsts;
  end;

implementation

procedure TTestSystem_JSONConsts.TestSystem_JSONConsts;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.JSONConsts.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_JSONConsts.Suite);
end.
