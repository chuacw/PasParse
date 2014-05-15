unit UTestAndroidapi_JNI_Analytics;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_JNI_Analytics = class(TTest)
  published
    procedure TestAndroidapi_JNI_Analytics;
  end;

implementation

procedure TTestAndroidapi_JNI_Analytics.TestAndroidapi_JNI_Analytics;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.JNI.Analytics.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_JNI_Analytics.Suite);
end.
