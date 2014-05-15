unit UTestAndroidapi_JNIBridge;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_JNIBridge = class(TTest)
  published
    procedure TestAndroidapi_JNIBridge;
  end;

implementation

procedure TTestAndroidapi_JNIBridge.TestAndroidapi_JNIBridge;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.JNIBridge.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_JNIBridge.Suite);
end.
