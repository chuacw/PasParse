unit UTestSystem_Diagnostics;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_Diagnostics = class(TTest)
  published
    procedure TestSystem_Diagnostics;
  end;

implementation

procedure TTestSystem_Diagnostics.TestSystem_Diagnostics;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.Diagnostics.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_Diagnostics.Suite);
end.
