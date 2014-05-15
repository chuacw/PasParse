unit UTestWinapi_D3DCommon;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_D3DCommon = class(TTest)
  published
    procedure TestWinapi_D3DCommon;
  end;

implementation

procedure TTestWinapi_D3DCommon.TestWinapi_D3DCommon;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.D3DCommon.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_D3DCommon.Suite);
end.
