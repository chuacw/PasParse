unit UTestWinapi_D3D10;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_D3D10 = class(TTest)
  published
    procedure TestWinapi_D3D10;
  end;

implementation

procedure TTestWinapi_D3D10.TestWinapi_D3D10;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.D3D10.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_D3D10.Suite);
end.
