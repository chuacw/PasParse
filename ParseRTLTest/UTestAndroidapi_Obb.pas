unit UTestAndroidapi_Obb;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_Obb = class(TTest)
  published
    procedure TestAndroidapi_Obb;
  end;

implementation

procedure TTestAndroidapi_Obb.TestAndroidapi_Obb;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.Obb.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_Obb.Suite);
end.
