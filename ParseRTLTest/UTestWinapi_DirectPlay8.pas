unit UTestWinapi_DirectPlay8;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_DirectPlay8 = class(TTest)
  published
    procedure TestWinapi_DirectPlay8;
  end;

implementation

procedure TTestWinapi_DirectPlay8.TestWinapi_DirectPlay8;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.DirectPlay8.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_DirectPlay8.Suite);
end.
