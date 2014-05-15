unit UTestWinapi_DirectDraw;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_DirectDraw = class(TTest)
  published
    procedure TestWinapi_DirectDraw;
  end;

implementation

procedure TTestWinapi_DirectDraw.TestWinapi_DirectDraw;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.DirectDraw.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_DirectDraw.Suite);
end.
