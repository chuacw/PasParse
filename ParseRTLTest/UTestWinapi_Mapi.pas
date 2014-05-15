unit UTestWinapi_Mapi;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_Mapi = class(TTest)
  published
    procedure TestWinapi_Mapi;
  end;

implementation

procedure TTestWinapi_Mapi.TestWinapi_Mapi;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.Mapi.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_Mapi.Suite);
end.
