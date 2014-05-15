unit UTestSystem_VarConv;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_VarConv = class(TTest)
  published
    procedure TestSystem_VarConv;
  end;

implementation

procedure TTestSystem_VarConv.TestSystem_VarConv;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.VarConv.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_VarConv.Suite);
end.
