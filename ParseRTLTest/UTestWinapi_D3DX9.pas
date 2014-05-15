unit UTestWinapi_D3DX9;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_D3DX9 = class(TTest)
  published
    procedure TestWinapi_D3DX9;
  end;

implementation

procedure TTestWinapi_D3DX9.TestWinapi_D3DX9;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.D3DX9.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_D3DX9.Suite);
end.
