unit UTestAndroidapi_JNI_PlayServices;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_JNI_PlayServices = class(TTest)
  published
    procedure TestAndroidapi_JNI_PlayServices;
  end;

implementation

procedure TTestAndroidapi_JNI_PlayServices.TestAndroidapi_JNI_PlayServices;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.JNI.PlayServices.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_JNI_PlayServices.Suite);
end.
