unit UTestMacapi_Security;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestMacapi_Security = class(TTest)
  published
    procedure TestMacapi_Security;
  end;

implementation

procedure TTestMacapi_Security.TestMacapi_Security;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\osx\Macapi.Security.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestMacapi_Security.Suite);
end.
