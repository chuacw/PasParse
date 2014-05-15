unit UTestSystem_Win_StdVCL;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_Win_StdVCL = class(TTest)
  published
    procedure TestSystem_Win_StdVCL;
  end;

implementation

procedure TTestSystem_Win_StdVCL.TestSystem_Win_StdVCL;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.Win.StdVCL.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_Win_StdVCL.Suite);
end.
