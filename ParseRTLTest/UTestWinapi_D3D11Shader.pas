unit UTestWinapi_D3D11Shader;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_D3D11Shader = class(TTest)
  published
    procedure TestWinapi_D3D11Shader;
  end;

implementation

procedure TTestWinapi_D3D11Shader.TestWinapi_D3D11Shader;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.D3D11Shader.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_D3D11Shader.Suite);
end.
