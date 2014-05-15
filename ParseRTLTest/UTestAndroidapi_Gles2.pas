unit UTestAndroidapi_Gles2;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_Gles2 = class(TTest)
  published
    procedure TestAndroidapi_Gles2;
  end;

implementation

procedure TTestAndroidapi_Gles2.TestAndroidapi_Gles2;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.Gles2.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_Gles2.Suite);
end.
