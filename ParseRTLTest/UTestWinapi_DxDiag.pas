unit UTestWinapi_DxDiag;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_DxDiag = class(TTest)
  published
    procedure TestWinapi_DxDiag;
  end;

implementation

procedure TTestWinapi_DxDiag.TestWinapi_DxDiag;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.DxDiag.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_DxDiag.Suite);
end.
