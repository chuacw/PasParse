unit UTestMacapi_Dispatch;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestMacapi_Dispatch = class(TTest)
  published
    procedure TestMacapi_Dispatch;
  end;

implementation

procedure TTestMacapi_Dispatch.TestMacapi_Dispatch;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\osx\Macapi.Dispatch.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestMacapi_Dispatch.Suite);
end.
