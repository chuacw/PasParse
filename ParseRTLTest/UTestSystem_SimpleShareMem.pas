unit UTestSystem_SimpleShareMem;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_SimpleShareMem = class(TTest)
  published
    procedure TestSystem_SimpleShareMem;
  end;

implementation

procedure TTestSystem_SimpleShareMem.TestSystem_SimpleShareMem;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\sys\System.SimpleShareMem.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_SimpleShareMem.Suite);
end.
