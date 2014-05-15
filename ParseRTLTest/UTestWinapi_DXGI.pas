unit UTestWinapi_DXGI;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_DXGI = class(TTest)
  published
    procedure TestWinapi_DXGI;
  end;

implementation

procedure TTestWinapi_DXGI.TestWinapi_DXGI;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.DXGI.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_DXGI.Suite);
end.
