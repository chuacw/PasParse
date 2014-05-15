unit UTestSystem_Win_Taskbar;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_Win_Taskbar = class(TTest)
  published
    procedure TestSystem_Win_Taskbar;
  end;

implementation

procedure TTestSystem_Win_Taskbar.TestSystem_Win_Taskbar;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.Win.Taskbar.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_Win_Taskbar.Suite);
end.
