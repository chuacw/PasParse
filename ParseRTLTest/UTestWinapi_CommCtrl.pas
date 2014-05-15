unit UTestWinapi_CommCtrl;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_CommCtrl = class(TTest)
  published
    procedure TestWinapi_CommCtrl;
  end;

implementation

procedure TTestWinapi_CommCtrl.TestWinapi_CommCtrl;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.CommCtrl.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_CommCtrl.Suite);
end.
