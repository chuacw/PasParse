unit UTestMacapi_CoreServices;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestMacapi_CoreServices = class(TTest)
  published
    procedure TestMacapi_CoreServices;
  end;

implementation

procedure TTestMacapi_CoreServices.TestMacapi_CoreServices;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\osx\Macapi.CoreServices.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestMacapi_CoreServices.Suite);
end.
