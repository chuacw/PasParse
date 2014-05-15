unit UTestWinapi_D2D1;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_D2D1 = class(TTest)
  published
    procedure TestWinapi_D2D1;
  end;

implementation

procedure TTestWinapi_D2D1.TestWinapi_D2D1;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.D2D1.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_D2D1.Suite);
end.
