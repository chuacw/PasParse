unit UTestAndroidapi_KhrPlatform;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_KhrPlatform = class(TTest)
  published
    procedure TestAndroidapi_KhrPlatform;
  end;

implementation

procedure TTestAndroidapi_KhrPlatform.TestAndroidapi_KhrPlatform;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.KhrPlatform.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_KhrPlatform.Suite);
end.
