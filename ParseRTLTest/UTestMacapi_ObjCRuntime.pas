unit UTestMacapi_ObjCRuntime;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestMacapi_ObjCRuntime = class(TTest)
  published
    procedure TestMacapi_ObjCRuntime;
  end;

implementation

procedure TTestMacapi_ObjCRuntime.TestMacapi_ObjCRuntime;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\osx\Macapi.ObjCRuntime.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestMacapi_ObjCRuntime.Suite);
end.
