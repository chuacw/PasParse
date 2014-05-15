unit UTestWinapi_OpenGL;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_OpenGL = class(TTest)
  published
    procedure TestWinapi_OpenGL;
  end;

implementation

procedure TTestWinapi_OpenGL.TestWinapi_OpenGL;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.OpenGL.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_OpenGL.Suite);
end.
