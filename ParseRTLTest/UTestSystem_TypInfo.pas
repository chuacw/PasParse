unit UTestSystem_TypInfo;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_TypInfo = class(TTest)
  published
    procedure TestSystem_TypInfo;
  end;

implementation

procedure TTestSystem_TypInfo.TestSystem_TypInfo;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.TypInfo.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_TypInfo.Suite);
end.
