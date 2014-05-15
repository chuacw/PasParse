unit UTestSystem_RegularExpressionsAPI;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_RegularExpressionsAPI = class(TTest)
  published
    procedure TestSystem_RegularExpressionsAPI;
  end;

implementation

procedure TTestSystem_RegularExpressionsAPI.TestSystem_RegularExpressionsAPI;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.RegularExpressionsAPI.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_RegularExpressionsAPI.Suite);
end.
