unit UTestMacapi_CoreFoundation;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestMacapi_CoreFoundation = class(TTest)
  published
    procedure TestMacapi_CoreFoundation;
  end;

implementation

procedure TTestMacapi_CoreFoundation.TestMacapi_CoreFoundation;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\osx\Macapi.CoreFoundation.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestMacapi_CoreFoundation.Suite);
end.
