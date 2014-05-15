unit UTestAndroidapi_JNI_Widget;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_JNI_Widget = class(TTest)
  published
    procedure TestAndroidapi_JNI_Widget;
  end;

implementation

procedure TTestAndroidapi_JNI_Widget.TestAndroidapi_JNI_Widget;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.JNI.Widget.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_JNI_Widget.Suite);
end.
