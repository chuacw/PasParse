unit UTestWinapi_OleCtl;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_OleCtl = class(TTest)
  published
    procedure TestWinapi_OleCtl;
  end;

implementation

procedure TTestWinapi_OleCtl.TestWinapi_OleCtl;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.OleCtl.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_OleCtl.Suite);
end.
