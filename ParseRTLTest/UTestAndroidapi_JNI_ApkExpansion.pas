unit UTestAndroidapi_JNI_ApkExpansion;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_JNI_ApkExpansion = class(TTest)
  published
    procedure TestAndroidapi_JNI_ApkExpansion;
  end;

implementation

procedure TTestAndroidapi_JNI_ApkExpansion.TestAndroidapi_JNI_ApkExpansion;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.JNI.ApkExpansion.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_JNI_ApkExpansion.Suite);
end.
