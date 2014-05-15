unit UTestSystem_UITypes;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_UITypes = class(TTest)
  published
    procedure TestSystem_UITypes;
  end;

implementation

procedure TTestSystem_UITypes.TestSystem_UITypes;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.UITypes.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_UITypes.Suite);
end.
