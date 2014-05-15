unit UTestSystem_WideStrUtils;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_WideStrUtils = class(TTest)
  published
    procedure TestSystem_WideStrUtils;
  end;

implementation

procedure TTestSystem_WideStrUtils.TestSystem_WideStrUtils;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.WideStrUtils.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_WideStrUtils.Suite);
end.
