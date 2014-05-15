unit UTestSystem_IOUtils;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_IOUtils = class(TTest)
  published
    procedure TestSystem_IOUtils;
  end;

implementation

procedure TTestSystem_IOUtils.TestSystem_IOUtils;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.IOUtils.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_IOUtils.Suite);
end.
