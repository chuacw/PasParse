unit UTestWinapi_Direct3D;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_Direct3D = class(TTest)
  published
    procedure TestWinapi_Direct3D;
  end;

implementation

procedure TTestWinapi_Direct3D.TestWinapi_Direct3D;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.Direct3D.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_Direct3D.Suite);
end.
