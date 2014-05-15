unit UTestSystem_ZLibConst;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_ZLibConst = class(TTest)
  published
    procedure TestSystem_ZLibConst;
  end;

implementation

procedure TTestSystem_ZLibConst.TestSystem_ZLibConst;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.ZLibConst.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_ZLibConst.Suite);
end.
