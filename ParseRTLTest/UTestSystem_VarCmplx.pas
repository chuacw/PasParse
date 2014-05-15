unit UTestSystem_VarCmplx;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_VarCmplx = class(TTest)
  published
    procedure TestSystem_VarCmplx;
  end;

implementation

procedure TTestSystem_VarCmplx.TestSystem_VarCmplx;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.VarCmplx.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_VarCmplx.Suite);
end.
