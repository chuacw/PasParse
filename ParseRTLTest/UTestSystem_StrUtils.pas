unit UTestSystem_StrUtils;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_StrUtils = class(TTest)
  published
    procedure TestSystem_StrUtils;
  end;

implementation

procedure TTestSystem_StrUtils.TestSystem_StrUtils;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.StrUtils.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_StrUtils.Suite);
end.
