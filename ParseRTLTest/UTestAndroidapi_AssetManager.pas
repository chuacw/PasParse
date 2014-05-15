unit UTestAndroidapi_AssetManager;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_AssetManager = class(TTest)
  published
    procedure TestAndroidapi_AssetManager;
  end;

implementation

procedure TTestAndroidapi_AssetManager.TestAndroidapi_AssetManager;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.AssetManager.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_AssetManager.Suite);
end.
