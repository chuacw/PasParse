unit UTestAndroidapi_JNI_PlayServices_GCM;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_JNI_PlayServices_GCM = class(TTest)
  published
    procedure TestAndroidapi_JNI_PlayServices_GCM;
  end;

implementation

procedure TTestAndroidapi_JNI_PlayServices_GCM.TestAndroidapi_JNI_PlayServices_GCM;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.JNI.PlayServices.GCM.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_JNI_PlayServices_GCM.Suite);
end.
