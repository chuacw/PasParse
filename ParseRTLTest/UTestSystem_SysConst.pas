unit UTestSystem_SysConst;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_SysConst = class(TTest)
  published
    procedure TestSystem_SysConst;
  end;

implementation

procedure TTestSystem_SysConst.TestSystem_SysConst;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\sys\System.SysConst.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_SysConst.Suite);
end.
