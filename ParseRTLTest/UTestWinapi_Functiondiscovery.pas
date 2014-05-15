unit UTestWinapi_Functiondiscovery;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_Functiondiscovery = class(TTest)
  published
    procedure TestWinapi_Functiondiscovery;
  end;

implementation

procedure TTestWinapi_Functiondiscovery.TestWinapi_Functiondiscovery;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.Functiondiscovery.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_Functiondiscovery.Suite);
end.
