unit UTestSystem_SysUtils;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_SysUtils = class(TTest)
  published
    procedure TestSystem_SysUtils;
  end;

implementation

procedure TTestSystem_SysUtils.TestSystem_SysUtils;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\sys\System.SysUtils.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_SysUtils.Suite);
end.
