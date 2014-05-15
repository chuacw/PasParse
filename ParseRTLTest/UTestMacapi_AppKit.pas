unit UTestMacapi_AppKit;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestMacapi_AppKit = class(TTest)
  published
    procedure TestMacapi_AppKit;
  end;

implementation

procedure TTestMacapi_AppKit.TestMacapi_AppKit;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\osx\Macapi.AppKit.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestMacapi_AppKit.Suite);
end.
