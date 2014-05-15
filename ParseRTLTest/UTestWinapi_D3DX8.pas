unit UTestWinapi_D3DX8;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_D3DX8 = class(TTest)
  published
    procedure TestWinapi_D3DX8;
  end;

implementation

procedure TTestWinapi_D3DX8.TestWinapi_D3DX8;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.D3DX8.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_D3DX8.Suite);
end.
