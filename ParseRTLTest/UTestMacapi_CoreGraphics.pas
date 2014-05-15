unit UTestMacapi_CoreGraphics;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestMacapi_CoreGraphics = class(TTest)
  published
    procedure TestMacapi_CoreGraphics;
  end;

implementation

procedure TTestMacapi_CoreGraphics.TestMacapi_CoreGraphics;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\osx\Macapi.CoreGraphics.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestMacapi_CoreGraphics.Suite);
end.
