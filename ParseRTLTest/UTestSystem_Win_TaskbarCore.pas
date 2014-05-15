unit UTestSystem_Win_TaskbarCore;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_Win_TaskbarCore = class(TTest)
  published
    procedure TestSystem_Win_TaskbarCore;
  end;

implementation

procedure TTestSystem_Win_TaskbarCore.TestSystem_Win_TaskbarCore;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.Win.TaskbarCore.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_Win_TaskbarCore.Suite);
end.
