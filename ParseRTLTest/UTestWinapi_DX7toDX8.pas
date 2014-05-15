unit UTestWinapi_DX7toDX8;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_DX7toDX8 = class(TTest)
  published
    procedure TestWinapi_DX7toDX8;
  end;

implementation

procedure TTestWinapi_DX7toDX8.TestWinapi_DX7toDX8;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.DX7toDX8.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_DX7toDX8.Suite);
end.
