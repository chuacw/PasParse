unit UTestAndroidapi_JNI_OpenGL;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_JNI_OpenGL = class(TTest)
  published
    procedure TestAndroidapi_JNI_OpenGL;
  end;

implementation

procedure TTestAndroidapi_JNI_OpenGL.TestAndroidapi_JNI_OpenGL;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.JNI.OpenGL.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_JNI_OpenGL.Suite);
end.
