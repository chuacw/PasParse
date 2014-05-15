unit UTestAndroidapi_JNI_VideoView;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_JNI_VideoView = class(TTest)
  published
    procedure TestAndroidapi_JNI_VideoView;
  end;

implementation

procedure TTestAndroidapi_JNI_VideoView.TestAndroidapi_JNI_VideoView;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.JNI.VideoView.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_JNI_VideoView.Suite);
end.
