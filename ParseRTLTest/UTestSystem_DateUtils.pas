unit UTestSystem_DateUtils;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_DateUtils = class(TTest)
  published
    procedure TestSystem_DateUtils;
  end;

implementation

procedure TTestSystem_DateUtils.TestSystem_DateUtils;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.DateUtils.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_DateUtils.Suite);
end.
