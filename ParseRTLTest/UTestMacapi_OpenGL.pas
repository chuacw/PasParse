unit UTestMacapi_OpenGL;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestMacapi_OpenGL = class(TTest)
  published
    procedure TestMacapi_OpenGL;
  end;

implementation

procedure TTestMacapi_OpenGL.TestMacapi_OpenGL;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\osx\Macapi.OpenGL.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestMacapi_OpenGL.Suite);
end.
