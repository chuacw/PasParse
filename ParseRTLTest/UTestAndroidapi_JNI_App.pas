unit UTestAndroidapi_JNI_App;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_JNI_App = class(TTest)
  published
    procedure TestAndroidapi_JNI_App;
  end;

implementation

procedure TTestAndroidapi_JNI_App.TestAndroidapi_JNI_App;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.JNI.App.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_JNI_App.Suite);
end.
