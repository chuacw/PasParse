unit UTestAndroidapi_JNI_Location;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_JNI_Location = class(TTest)
  published
    procedure TestAndroidapi_JNI_Location;
  end;

implementation

procedure TTestAndroidapi_JNI_Location.TestAndroidapi_JNI_Location;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.JNI.Location.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_JNI_Location.Suite);
end.
