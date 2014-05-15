unit UTestAndroidapi_JNI_InputMethodService;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_JNI_InputMethodService = class(TTest)
  published
    procedure TestAndroidapi_JNI_InputMethodService;
  end;

implementation

procedure TTestAndroidapi_JNI_InputMethodService.TestAndroidapi_JNI_InputMethodService;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.JNI.InputMethodService.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_JNI_InputMethodService.Suite);
end.
