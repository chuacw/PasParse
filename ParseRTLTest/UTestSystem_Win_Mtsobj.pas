unit UTestSystem_Win_Mtsobj;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_Win_Mtsobj = class(TTest)
  published
    procedure TestSystem_Win_Mtsobj;
  end;

implementation

procedure TTestSystem_Win_Mtsobj.TestSystem_Win_Mtsobj;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.Win.Mtsobj.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_Win_Mtsobj.Suite);
end.
