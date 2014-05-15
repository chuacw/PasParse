unit UTestAndroidapi_JNI_Media;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_JNI_Media = class(TTest)
  published
    procedure TestAndroidapi_JNI_Media;
  end;

implementation

procedure TTestAndroidapi_JNI_Media.TestAndroidapi_JNI_Media;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.JNI.Media.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_JNI_Media.Suite);
end.
