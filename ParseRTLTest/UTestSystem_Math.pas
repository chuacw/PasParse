unit UTestSystem_Math;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_Math = class(TTest)
  published
    procedure TestSystem_Math;
  end;

implementation

procedure TTestSystem_Math.TestSystem_Math;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.Math.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_Math.Suite);
end.
