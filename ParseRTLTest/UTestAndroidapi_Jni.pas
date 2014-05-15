unit UTestAndroidapi_Jni;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_Jni = class(TTest)
  published
    procedure TestAndroidapi_Jni;
  end;

implementation

procedure TTestAndroidapi_Jni.TestAndroidapi_Jni;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.Jni.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_Jni.Suite);
end.
