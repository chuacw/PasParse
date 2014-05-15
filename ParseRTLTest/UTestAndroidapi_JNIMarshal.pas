unit UTestAndroidapi_JNIMarshal;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_JNIMarshal = class(TTest)
  published
    procedure TestAndroidapi_JNIMarshal;
  end;

implementation

procedure TTestAndroidapi_JNIMarshal.TestAndroidapi_JNIMarshal;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.JNIMarshal.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_JNIMarshal.Suite);
end.
