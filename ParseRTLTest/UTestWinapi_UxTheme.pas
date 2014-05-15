unit UTestWinapi_UxTheme;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_UxTheme = class(TTest)
  published
    procedure TestWinapi_UxTheme;
  end;

implementation

procedure TTestWinapi_UxTheme.TestWinapi_UxTheme;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.UxTheme.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_UxTheme.Suite);
end.
