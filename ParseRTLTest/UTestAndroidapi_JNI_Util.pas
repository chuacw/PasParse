unit UTestAndroidapi_JNI_Util;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_JNI_Util = class(TTest)
  published
    procedure TestAndroidapi_JNI_Util;
  end;

implementation

procedure TTestAndroidapi_JNI_Util.TestAndroidapi_JNI_Util;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.JNI.Util.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_JNI_Util.Suite);
end.
