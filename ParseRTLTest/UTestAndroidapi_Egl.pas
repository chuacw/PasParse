unit UTestAndroidapi_Egl;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_Egl = class(TTest)
  published
    procedure TestAndroidapi_Egl;
  end;

implementation

procedure TTestAndroidapi_Egl.TestAndroidapi_Egl;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.Egl.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_Egl.Suite);
end.
