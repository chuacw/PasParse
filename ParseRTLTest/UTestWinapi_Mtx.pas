unit UTestWinapi_Mtx;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_Mtx = class(TTest)
  published
    procedure TestWinapi_Mtx;
  end;

implementation

procedure TTestWinapi_Mtx.TestWinapi_Mtx;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.Mtx.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_Mtx.Suite);
end.
