unit UTestWinapi_MsInkAut;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_MsInkAut = class(TTest)
  published
    procedure TestWinapi_MsInkAut;
  end;

implementation

procedure TTestWinapi_MsInkAut.TestWinapi_MsInkAut;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.MsInkAut.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_MsInkAut.Suite);
end.
