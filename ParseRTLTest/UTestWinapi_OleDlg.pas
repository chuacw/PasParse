unit UTestWinapi_OleDlg;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_OleDlg = class(TTest)
  published
    procedure TestWinapi_OleDlg;
  end;

implementation

procedure TTestWinapi_OleDlg.TestWinapi_OleDlg;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.OleDlg.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_OleDlg.Suite);
end.
