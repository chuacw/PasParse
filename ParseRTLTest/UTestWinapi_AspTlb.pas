unit UTestWinapi_AspTlb;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_AspTlb = class(TTest)
  published
    procedure TestWinapi_AspTlb;
  end;

implementation

procedure TTestWinapi_AspTlb.TestWinapi_AspTlb;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.AspTlb.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_AspTlb.Suite);
end.
