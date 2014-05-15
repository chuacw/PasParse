unit UTestAndroidapi_JNI_Net;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_JNI_Net = class(TTest)
  published
    procedure TestAndroidapi_JNI_Net;
  end;

implementation

procedure TTestAndroidapi_JNI_Net.TestAndroidapi_JNI_Net;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.JNI.Net.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_JNI_Net.Suite);
end.
