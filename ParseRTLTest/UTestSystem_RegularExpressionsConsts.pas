unit UTestSystem_RegularExpressionsConsts;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_RegularExpressionsConsts = class(TTest)
  published
    procedure TestSystem_RegularExpressionsConsts;
  end;

implementation

procedure TTestSystem_RegularExpressionsConsts.TestSystem_RegularExpressionsConsts;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.RegularExpressionsConsts.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_RegularExpressionsConsts.Suite);
end.
