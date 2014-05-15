unit UTestWinapi_OpenGLext;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_OpenGLext = class(TTest)
  published
    procedure TestWinapi_OpenGLext;
  end;

implementation

procedure TTestWinapi_OpenGLext.TestWinapi_OpenGLext;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.OpenGLext.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_OpenGLext.Suite);
end.
