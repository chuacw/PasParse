unit UTestAndroidapi_AssetManagerJni;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_AssetManagerJni = class(TTest)
  published
    procedure TestAndroidapi_AssetManagerJni;
  end;

implementation

procedure TTestAndroidapi_AssetManagerJni.TestAndroidapi_AssetManagerJni;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.AssetManagerJni.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_AssetManagerJni.Suite);
end.
