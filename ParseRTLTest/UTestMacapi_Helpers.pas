unit UTestMacapi_Helpers;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestMacapi_Helpers = class(TTest)
  published
    procedure TestMacapi_Helpers;
  end;

implementation

procedure TTestMacapi_Helpers.TestMacapi_Helpers;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\osx\Macapi.Helpers.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestMacapi_Helpers.Suite);
end.
