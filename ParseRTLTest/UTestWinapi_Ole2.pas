unit UTestWinapi_Ole2;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_Ole2 = class(TTest)
  published
    procedure TestWinapi_Ole2;
  end;

implementation

procedure TTestWinapi_Ole2.TestWinapi_Ole2;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.Ole2.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_Ole2.Suite);
end.
