unit UTestWinapi_CommDlg;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_CommDlg = class(TTest)
  published
    procedure TestWinapi_CommDlg;
  end;

implementation

procedure TTestWinapi_CommDlg.TestWinapi_CommDlg;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.CommDlg.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_CommDlg.Suite);
end.
