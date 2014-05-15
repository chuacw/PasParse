unit UTestWinapi_D3D11;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_D3D11 = class(TTest)
  published
    procedure TestWinapi_D3D11;
  end;

implementation

procedure TTestWinapi_D3D11.TestWinapi_D3D11;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.D3D11.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_D3D11.Suite);
end.
