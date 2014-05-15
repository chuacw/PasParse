unit UTestAndroidapi_JNI_Licensing;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_JNI_Licensing = class(TTest)
  published
    procedure TestAndroidapi_JNI_Licensing;
  end;

implementation

procedure TTestAndroidapi_JNI_Licensing.TestAndroidapi_JNI_Licensing;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.JNI.Licensing.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_JNI_Licensing.Suite);
end.
