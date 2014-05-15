unit UTestSystem_Win_Sensors;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_Win_Sensors = class(TTest)
  published
    procedure TestSystem_Win_Sensors;
  end;

implementation

procedure TTestSystem_Win_Sensors.TestSystem_Win_Sensors;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.Win.Sensors.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_Win_Sensors.Suite);
end.
