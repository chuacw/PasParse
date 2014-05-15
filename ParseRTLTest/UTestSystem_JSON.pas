unit UTestSystem_JSON;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_JSON = class(TTest)
  published
    procedure TestSystem_JSON;
  end;

implementation

procedure TTestSystem_JSON.TestSystem_JSON;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.JSON.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_JSON.Suite);
end.
