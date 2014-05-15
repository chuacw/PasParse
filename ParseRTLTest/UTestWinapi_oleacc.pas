unit UTestWinapi_oleacc;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_oleacc = class(TTest)
  published
    procedure TestWinapi_oleacc;
  end;

implementation

procedure TTestWinapi_oleacc.TestWinapi_oleacc;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.oleacc.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_oleacc.Suite);
end.
