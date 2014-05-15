unit UTestWinapi_DirectShow9;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_DirectShow9 = class(TTest)
  published
    procedure TestWinapi_DirectShow9;
  end;

implementation

procedure TTestWinapi_DirectShow9.TestWinapi_DirectShow9;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.DirectShow9.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_DirectShow9.Suite);
end.
