unit UTestSystem_WideStrings;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_WideStrings = class(TTest)
  published
    procedure TestSystem_WideStrings;
  end;

implementation

procedure TTestSystem_WideStrings.TestSystem_WideStrings;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.WideStrings.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_WideStrings.Suite);
end.
