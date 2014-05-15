unit UTestAndroidapi_JNI_Os;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_JNI_Os = class(TTest)
  published
    procedure TestAndroidapi_JNI_Os;
  end;

implementation

procedure TTestAndroidapi_JNI_Os.TestAndroidapi_JNI_Os;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.JNI.Os.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_JNI_Os.Suite);
end.
