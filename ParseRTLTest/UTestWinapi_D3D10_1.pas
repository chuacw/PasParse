unit UTestWinapi_D3D10_1;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_D3D10_1 = class(TTest)
  published
    procedure TestWinapi_D3D10_1;
  end;

implementation

procedure TTestWinapi_D3D10_1.TestWinapi_D3D10_1;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.D3D10_1.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_D3D10_1.Suite);
end.
