unit UTestSystem_Generics_Collections;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_Generics_Collections = class(TTest)
  published
    procedure TestSystem_Generics_Collections;
  end;

implementation

procedure TTestSystem_Generics_Collections.TestSystem_Generics_Collections;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.Generics.Collections.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_Generics_Collections.Suite);
end.
