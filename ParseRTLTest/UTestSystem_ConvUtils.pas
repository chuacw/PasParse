unit UTestSystem_ConvUtils;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_ConvUtils = class(TTest)
  published
    procedure TestSystem_ConvUtils;
  end;

implementation

procedure TTestSystem_ConvUtils.TestSystem_ConvUtils;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.ConvUtils.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_ConvUtils.Suite);
end.
