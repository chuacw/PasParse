unit UTestWinapi_Direct3D8;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_Direct3D8 = class(TTest)
  published
    procedure TestWinapi_Direct3D8;
  end;

implementation

procedure TTestWinapi_Direct3D8.TestWinapi_Direct3D8;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.Direct3D8.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_Direct3D8.Suite);
end.
