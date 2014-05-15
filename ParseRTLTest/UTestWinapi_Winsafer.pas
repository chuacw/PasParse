unit UTestWinapi_Winsafer;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_Winsafer = class(TTest)
  published
    procedure TestWinapi_Winsafer;
  end;

implementation

procedure TTestWinapi_Winsafer.TestWinapi_Winsafer;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.Winsafer.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_Winsafer.Suite);
end.
