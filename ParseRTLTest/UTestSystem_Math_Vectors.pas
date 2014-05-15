unit UTestSystem_Math_Vectors;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_Math_Vectors = class(TTest)
  published
    procedure TestSystem_Math_Vectors;
  end;

implementation

procedure TTestSystem_Math_Vectors.TestSystem_Math_Vectors;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\sys\System.Math.Vectors.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_Math_Vectors.Suite);
end.
