unit UTestSystem_Win_Registry;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_Win_Registry = class(TTest)
  published
    procedure TestSystem_Win_Registry;
  end;

implementation

procedure TTestSystem_Win_Registry.TestSystem_Win_Registry;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.Win.Registry.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_Win_Registry.Suite);
end.
