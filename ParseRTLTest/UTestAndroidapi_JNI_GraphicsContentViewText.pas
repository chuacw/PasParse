unit UTestAndroidapi_JNI_GraphicsContentViewText;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_JNI_GraphicsContentViewText = class(TTest)
  published
    procedure TestAndroidapi_JNI_GraphicsContentViewText;
  end;

implementation

procedure TTestAndroidapi_JNI_GraphicsContentViewText.TestAndroidapi_JNI_GraphicsContentViewText;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.JNI.GraphicsContentViewText.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_JNI_GraphicsContentViewText.Suite);
end.
