unit UTestAndroidapi_JNI_AdMob;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_JNI_AdMob = class(TTest)
  published
    procedure TestAndroidapi_JNI_AdMob;
  end;

implementation

procedure TTestAndroidapi_JNI_AdMob.TestAndroidapi_JNI_AdMob;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.JNI.AdMob.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_JNI_AdMob.Suite);
end.
