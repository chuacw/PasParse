unit UTestMacapi_CocoaTypes;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestMacapi_CocoaTypes = class(TTest)
  published
    procedure TestMacapi_CocoaTypes;
  end;

implementation

procedure TTestMacapi_CocoaTypes.TestMacapi_CocoaTypes;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\osx\Macapi.CocoaTypes.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestMacapi_CocoaTypes.Suite);
end.
