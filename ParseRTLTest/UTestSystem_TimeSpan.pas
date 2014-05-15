unit UTestSystem_TimeSpan;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_TimeSpan = class(TTest)
  published
    procedure TestSystem_TimeSpan;
  end;

implementation

procedure TTestSystem_TimeSpan.TestSystem_TimeSpan;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.TimeSpan.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_TimeSpan.Suite);
end.
