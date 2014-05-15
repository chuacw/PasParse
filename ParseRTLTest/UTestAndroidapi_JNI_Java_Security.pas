unit UTestAndroidapi_JNI_Java_Security;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_JNI_Java_Security = class(TTest)
  published
    procedure TestAndroidapi_JNI_Java_Security;
  end;

implementation

procedure TTestAndroidapi_JNI_Java_Security.TestAndroidapi_JNI_Java_Security;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.JNI.Java.Security.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_JNI_Java_Security.Suite);
end.
