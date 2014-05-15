unit UTestAndroidapi_NativeWindowJni;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_NativeWindowJni = class(TTest)
  published
    procedure TestAndroidapi_NativeWindowJni;
  end;

implementation

procedure TTestAndroidapi_NativeWindowJni.TestAndroidapi_NativeWindowJni;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.NativeWindowJni.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_NativeWindowJni.Suite);
end.
