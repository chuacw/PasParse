unit UTestSystem_Internal_VarHlpr;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_Internal_VarHlpr = class(TTest)
  published
    procedure TestSystem_Internal_VarHlpr;
  end;

implementation

procedure TTestSystem_Internal_VarHlpr.TestSystem_Internal_VarHlpr;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\sys\System.Internal.VarHlpr.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_Internal_VarHlpr.Suite);
end.
