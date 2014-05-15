unit UTestAndroidapi_Gles2ext;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_Gles2ext = class(TTest)
  published
    procedure TestAndroidapi_Gles2ext;
  end;

implementation

procedure TTestAndroidapi_Gles2ext.TestAndroidapi_Gles2ext;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.Gles2ext.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_Gles2ext.Suite);
end.
