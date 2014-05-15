unit UTestSystem_AnsiStrings;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_AnsiStrings = class(TTest)
  published
    procedure TestSystem_AnsiStrings;
  end;

implementation

procedure TTestSystem_AnsiStrings.TestSystem_AnsiStrings;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.AnsiStrings.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_AnsiStrings.Suite);
end.
