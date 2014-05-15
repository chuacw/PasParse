unit UTestSystem_RegularExpressions;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_RegularExpressions = class(TTest)
  published
    procedure TestSystem_RegularExpressions;
  end;

implementation

procedure TTestSystem_RegularExpressions.TestSystem_RegularExpressions;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.RegularExpressions.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_RegularExpressions.Suite);
end.
