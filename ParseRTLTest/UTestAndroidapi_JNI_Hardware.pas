unit UTestAndroidapi_JNI_Hardware;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_JNI_Hardware = class(TTest)
  published
    procedure TestAndroidapi_JNI_Hardware;
  end;

implementation

procedure TTestAndroidapi_JNI_Hardware.TestAndroidapi_JNI_Hardware;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.JNI.Hardware.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_JNI_Hardware.Suite);
end.
