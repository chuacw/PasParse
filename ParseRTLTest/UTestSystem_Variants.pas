unit UTestSystem_Variants;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_Variants = class(TTest)
  published
    procedure TestSystem_Variants;
  end;

implementation

procedure TTestSystem_Variants.TestSystem_Variants;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\sys\System.Variants.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_Variants.Suite);
end.
