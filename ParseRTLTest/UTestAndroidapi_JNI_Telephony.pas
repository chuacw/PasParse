unit UTestAndroidapi_JNI_Telephony;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_JNI_Telephony = class(TTest)
  published
    procedure TestAndroidapi_JNI_Telephony;
  end;

implementation

procedure TTestAndroidapi_JNI_Telephony.TestAndroidapi_JNI_Telephony;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.JNI.Telephony.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_JNI_Telephony.Suite);
end.
