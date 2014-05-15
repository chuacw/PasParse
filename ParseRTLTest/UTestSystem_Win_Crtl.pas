unit UTestSystem_Win_Crtl;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_Win_Crtl = class(TTest)
  published
    procedure TestSystem_Win_Crtl;
  end;

implementation

procedure TTestSystem_Win_Crtl.TestSystem_Win_Crtl;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.Win.Crtl.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_Win_Crtl.Suite);
end.