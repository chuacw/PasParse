unit UTestAndroidapi_JNI_Provider;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_JNI_Provider = class(TTest)
  published
    procedure TestAndroidapi_JNI_Provider;
  end;

implementation

procedure TTestAndroidapi_JNI_Provider.TestAndroidapi_JNI_Provider;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.JNI.Provider.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_JNI_Provider.Suite);
end.
