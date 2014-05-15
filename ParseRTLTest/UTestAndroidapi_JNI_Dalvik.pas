unit UTestAndroidapi_JNI_Dalvik;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_JNI_Dalvik = class(TTest)
  published
    procedure TestAndroidapi_JNI_Dalvik;
  end;

implementation

procedure TTestAndroidapi_JNI_Dalvik.TestAndroidapi_JNI_Dalvik;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.JNI.Dalvik.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_JNI_Dalvik.Suite);
end.
