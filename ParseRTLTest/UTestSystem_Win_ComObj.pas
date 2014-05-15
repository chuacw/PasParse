unit UTestSystem_Win_ComObj;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_Win_ComObj = class(TTest)
  published
    procedure TestSystem_Win_ComObj;
  end;

implementation

procedure TTestSystem_Win_ComObj.TestSystem_Win_ComObj;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.Win.ComObj.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_Win_ComObj.Suite);
end.
