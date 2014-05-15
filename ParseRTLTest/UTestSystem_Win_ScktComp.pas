unit UTestSystem_Win_ScktComp;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_Win_ScktComp = class(TTest)
  published
    procedure TestSystem_Win_ScktComp;
  end;

implementation

procedure TTestSystem_Win_ScktComp.TestSystem_Win_ScktComp;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.Win.ScktComp.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_Win_ScktComp.Suite);
end.
