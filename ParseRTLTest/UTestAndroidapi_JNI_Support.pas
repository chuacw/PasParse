unit UTestAndroidapi_JNI_Support;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_JNI_Support = class(TTest)
  published
    procedure TestAndroidapi_JNI_Support;
  end;

implementation

procedure TTestAndroidapi_JNI_Support.TestAndroidapi_JNI_Support;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.JNI.Support.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_JNI_Support.Suite);
end.
