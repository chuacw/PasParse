unit UTestSystem_Sensors_Components;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_Sensors_Components = class(TTest)
  published
    procedure TestSystem_Sensors_Components;
  end;

implementation

procedure TTestSystem_Sensors_Components.TestSystem_Sensors_Components;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.Sensors.Components.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_Sensors_Components.Suite);
end.
