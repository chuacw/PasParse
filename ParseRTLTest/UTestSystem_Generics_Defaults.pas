unit UTestSystem_Generics_Defaults;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_Generics_Defaults = class(TTest)
  published
    procedure TestSystem_Generics_Defaults;
  end;

implementation

procedure TTestSystem_Generics_Defaults.TestSystem_Generics_Defaults;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.Generics.Defaults.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_Generics_Defaults.Suite);
end.
