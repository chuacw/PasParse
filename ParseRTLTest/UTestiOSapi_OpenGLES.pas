unit UTestiOSapi_OpenGLES;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestiOSapi_OpenGLES = class(TTest)
  published
    procedure TestiOSapi_OpenGLES;
  end;

implementation

procedure TTestiOSapi_OpenGLES.TestiOSapi_OpenGLES;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\ios\iOSapi.OpenGLES.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestiOSapi_OpenGLES.Suite);
end.
