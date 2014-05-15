unit UTestWinapi_D3DX10;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_D3DX10 = class(TTest)
  published
    procedure TestWinapi_D3DX10;
  end;

implementation

procedure TTestWinapi_D3DX10.TestWinapi_D3DX10;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.D3DX10.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_D3DX10.Suite);
end.
