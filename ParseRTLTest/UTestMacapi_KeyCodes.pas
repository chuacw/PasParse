unit UTestMacapi_KeyCodes;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestMacapi_KeyCodes = class(TTest)
  published
    procedure TestMacapi_KeyCodes;
  end;

implementation

procedure TTestMacapi_KeyCodes.TestMacapi_KeyCodes;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\osx\Macapi.KeyCodes.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestMacapi_KeyCodes.Suite);
end.
