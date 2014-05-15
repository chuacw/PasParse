unit UTestAndroidapi_JNI_InAppBilling;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_JNI_InAppBilling = class(TTest)
  published
    procedure TestAndroidapi_JNI_InAppBilling;
  end;

implementation

procedure TTestAndroidapi_JNI_InAppBilling.TestAndroidapi_JNI_InAppBilling;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.JNI.InAppBilling.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_JNI_InAppBilling.Suite);
end.
