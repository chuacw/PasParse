unit UTestAndroidapi_NativeActivity;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_NativeActivity = class(TTest)
  published
    procedure TestAndroidapi_NativeActivity;
  end;

implementation

procedure TTestAndroidapi_NativeActivity.TestAndroidapi_NativeActivity;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.NativeActivity.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_NativeActivity.Suite);
end.
