unit UTestAndroidapi_JNI_Embarcadero;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_JNI_Embarcadero = class(TTest)
  published
    procedure TestAndroidapi_JNI_Embarcadero;
  end;

implementation

procedure TTestAndroidapi_JNI_Embarcadero.TestAndroidapi_JNI_Embarcadero;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.JNI.Embarcadero.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_JNI_Embarcadero.Suite);
end.
