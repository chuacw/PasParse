unit UTestSystem_RTLConsts;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_RTLConsts = class(TTest)
  published
    procedure TestSystem_RTLConsts;
  end;

implementation

procedure TTestSystem_RTLConsts.TestSystem_RTLConsts;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.RTLConsts.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_RTLConsts.Suite);
end.
