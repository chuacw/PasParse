unit UTestWinapi_PenInputPanel;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_PenInputPanel = class(TTest)
  published
    procedure TestWinapi_PenInputPanel;
  end;

implementation

procedure TTestWinapi_PenInputPanel.TestWinapi_PenInputPanel;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.PenInputPanel.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_PenInputPanel.Suite);
end.
