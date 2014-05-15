unit UTestSystem_Masks;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_Masks = class(TTest)
  published
    procedure TestSystem_Masks;
  end;

implementation

procedure TTestSystem_Masks.TestSystem_Masks;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.Masks.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_Masks.Suite);
end.
