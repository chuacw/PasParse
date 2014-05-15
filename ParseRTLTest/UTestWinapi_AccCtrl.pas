unit UTestWinapi_AccCtrl;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_AccCtrl = class(TTest)
  published
    procedure TestWinapi_AccCtrl;
  end;

implementation

procedure TTestWinapi_AccCtrl.TestWinapi_AccCtrl;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.AccCtrl.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_AccCtrl.Suite);
end.
