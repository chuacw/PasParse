unit UTestSystem_Internal_ICU;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_Internal_ICU = class(TTest)
  published
    procedure TestSystem_Internal_ICU;
  end;

implementation

procedure TTestSystem_Internal_ICU.TestSystem_Internal_ICU;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.Internal.ICU.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_Internal_ICU.Suite);
end.
