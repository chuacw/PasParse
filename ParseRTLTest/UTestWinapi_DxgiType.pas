unit UTestWinapi_DxgiType;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_DxgiType = class(TTest)
  published
    procedure TestWinapi_DxgiType;
  end;

implementation

procedure TTestWinapi_DxgiType.TestWinapi_DxgiType;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.DxgiType.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_DxgiType.Suite);
end.
