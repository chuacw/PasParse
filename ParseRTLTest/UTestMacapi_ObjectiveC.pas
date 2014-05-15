unit UTestMacapi_ObjectiveC;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestMacapi_ObjectiveC = class(TTest)
  published
    procedure TestMacapi_ObjectiveC;
  end;

implementation

procedure TTestMacapi_ObjectiveC.TestMacapi_ObjectiveC;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\osx\Macapi.ObjectiveC.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestMacapi_ObjectiveC.Suite);
end.
