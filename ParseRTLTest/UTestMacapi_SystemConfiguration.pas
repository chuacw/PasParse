unit UTestMacapi_SystemConfiguration;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestMacapi_SystemConfiguration = class(TTest)
  published
    procedure TestMacapi_SystemConfiguration;
  end;

implementation

procedure TTestMacapi_SystemConfiguration.TestMacapi_SystemConfiguration;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\osx\Macapi.SystemConfiguration.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestMacapi_SystemConfiguration.Suite);
end.
