unit UTestSystem_Rtti;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_Rtti = class(TTest)
  published
    procedure TestSystem_Rtti;
  end;

implementation

procedure TTestSystem_Rtti.TestSystem_Rtti;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.Rtti.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_Rtti.Suite);
end.
