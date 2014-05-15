unit UTestSystem_RegularExpressionsCore;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_RegularExpressionsCore = class(TTest)
  published
    procedure TestSystem_RegularExpressionsCore;
  end;

implementation

procedure TTestSystem_RegularExpressionsCore.TestSystem_RegularExpressionsCore;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.RegularExpressionsCore.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_RegularExpressionsCore.Suite);
end.
