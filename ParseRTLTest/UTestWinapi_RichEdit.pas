unit UTestWinapi_RichEdit;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_RichEdit = class(TTest)
  published
    procedure TestWinapi_RichEdit;
  end;

implementation

procedure TTestWinapi_RichEdit.TestWinapi_RichEdit;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.RichEdit.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_RichEdit.Suite);
end.
