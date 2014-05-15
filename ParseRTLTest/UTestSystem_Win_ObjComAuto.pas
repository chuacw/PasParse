unit UTestSystem_Win_ObjComAuto;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_Win_ObjComAuto = class(TTest)
  published
    procedure TestSystem_Win_ObjComAuto;
  end;

implementation

procedure TTestSystem_Win_ObjComAuto.TestSystem_Win_ObjComAuto;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.Win.ObjComAuto.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_Win_ObjComAuto.Suite);
end.
