unit UTestAndroidapi_JNI_JavaTypes;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_JNI_JavaTypes = class(TTest)
  published
    procedure TestAndroidapi_JNI_JavaTypes;
  end;

implementation

procedure TTestAndroidapi_JNI_JavaTypes.TestAndroidapi_JNI_JavaTypes;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.JNI.JavaTypes.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_JNI_JavaTypes.Suite);
end.
