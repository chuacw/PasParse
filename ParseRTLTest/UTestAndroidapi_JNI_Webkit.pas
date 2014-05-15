unit UTestAndroidapi_JNI_Webkit;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_JNI_Webkit = class(TTest)
  published
    procedure TestAndroidapi_JNI_Webkit;
  end;

implementation

procedure TTestAndroidapi_JNI_Webkit.TestAndroidapi_JNI_Webkit;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.JNI.Webkit.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_JNI_Webkit.Suite);
end.
