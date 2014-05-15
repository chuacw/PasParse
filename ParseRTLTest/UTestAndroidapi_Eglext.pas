unit UTestAndroidapi_Eglext;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_Eglext = class(TTest)
  published
    procedure TestAndroidapi_Eglext;
  end;

implementation

procedure TTestAndroidapi_Eglext.TestAndroidapi_Eglext;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.Eglext.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_Eglext.Suite);
end.
