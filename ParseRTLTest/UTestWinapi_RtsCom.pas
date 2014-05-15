unit UTestWinapi_RtsCom;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_RtsCom = class(TTest)
  published
    procedure TestWinapi_RtsCom;
  end;

implementation

procedure TTestWinapi_RtsCom.TestWinapi_RtsCom;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.RtsCom.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_RtsCom.Suite);
end.
