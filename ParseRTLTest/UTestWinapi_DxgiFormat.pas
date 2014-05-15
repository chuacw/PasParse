unit UTestWinapi_DxgiFormat;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_DxgiFormat = class(TTest)
  published
    procedure TestWinapi_DxgiFormat;
  end;

implementation

procedure TTestWinapi_DxgiFormat.TestWinapi_DxgiFormat;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.DxgiFormat.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_DxgiFormat.Suite);
end.
