unit UTestSystem_MaskUtils;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_MaskUtils = class(TTest)
  published
    procedure TestSystem_MaskUtils;
  end;

implementation

procedure TTestSystem_MaskUtils.TestSystem_MaskUtils;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.MaskUtils.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_MaskUtils.Suite);
end.
