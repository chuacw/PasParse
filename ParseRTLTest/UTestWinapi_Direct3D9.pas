unit UTestWinapi_Direct3D9;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_Direct3D9 = class(TTest)
  published
    procedure TestWinapi_Direct3D9;
  end;

implementation

procedure TTestWinapi_Direct3D9.TestWinapi_Direct3D9;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.Direct3D9.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_Direct3D9.Suite);
end.
