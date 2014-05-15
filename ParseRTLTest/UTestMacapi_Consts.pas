unit UTestMacapi_Consts;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestMacapi_Consts = class(TTest)
  published
    procedure TestMacapi_Consts;
  end;

implementation

procedure TTestMacapi_Consts.TestMacapi_Consts;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\osx\Macapi.Consts.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestMacapi_Consts.Suite);
end.
