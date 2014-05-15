unit UTestWinapi_MultiMon;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_MultiMon = class(TTest)
  published
    procedure TestWinapi_MultiMon;
  end;

implementation

procedure TTestWinapi_MultiMon.TestWinapi_MultiMon;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.MultiMon.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_MultiMon.Suite);
end.
