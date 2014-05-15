unit UTestSystem_Win_ComServ;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_Win_ComServ = class(TTest)
  published
    procedure TestSystem_Win_ComServ;
  end;

implementation

procedure TTestSystem_Win_ComServ.TestSystem_Win_ComServ;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.Win.ComServ.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_Win_ComServ.Suite);
end.
