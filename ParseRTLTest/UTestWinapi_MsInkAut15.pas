unit UTestWinapi_MsInkAut15;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_MsInkAut15 = class(TTest)
  published
    procedure TestWinapi_MsInkAut15;
  end;

implementation

procedure TTestWinapi_MsInkAut15.TestWinapi_MsInkAut15;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.MsInkAut15.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_MsInkAut15.Suite);
end.
