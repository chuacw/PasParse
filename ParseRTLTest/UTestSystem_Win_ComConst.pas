unit UTestSystem_Win_ComConst;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_Win_ComConst = class(TTest)
  published
    procedure TestSystem_Win_ComConst;
  end;

implementation

procedure TTestSystem_Win_ComConst.TestSystem_Win_ComConst;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.Win.ComConst.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_Win_ComConst.Suite);
end.
