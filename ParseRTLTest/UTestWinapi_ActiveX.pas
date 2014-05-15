unit UTestWinapi_ActiveX;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_ActiveX = class(TTest)
  published
    procedure TestWinapi_ActiveX;
  end;

implementation

procedure TTestWinapi_ActiveX.TestWinapi_ActiveX;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.ActiveX.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_ActiveX.Suite);
end.
