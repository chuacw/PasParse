unit UTestSystem_ObjAuto;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_ObjAuto = class(TTest)
  published
    procedure TestSystem_ObjAuto;
  end;

implementation

procedure TTestSystem_ObjAuto.TestSystem_ObjAuto;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.ObjAuto.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_ObjAuto.Suite);
end.
