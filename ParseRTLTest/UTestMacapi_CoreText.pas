unit UTestMacapi_CoreText;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestMacapi_CoreText = class(TTest)
  published
    procedure TestMacapi_CoreText;
  end;

implementation

procedure TTestMacapi_CoreText.TestMacapi_CoreText;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\osx\Macapi.CoreText.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestMacapi_CoreText.Suite);
end.
