unit UTestWinapi_DXTypes;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_DXTypes = class(TTest)
  published
    procedure TestWinapi_DXTypes;
  end;

implementation

procedure TTestWinapi_DXTypes.TestWinapi_DXTypes;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.DXTypes.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_DXTypes.Suite);
end.
