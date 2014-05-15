unit UTestWinapi_D3D11sdklayers;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_D3D11sdklayers = class(TTest)
  published
    procedure TestWinapi_D3D11sdklayers;
  end;

implementation

procedure TTestWinapi_D3D11sdklayers.TestWinapi_D3D11sdklayers;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.D3D11sdklayers.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_D3D11sdklayers.Suite);
end.
