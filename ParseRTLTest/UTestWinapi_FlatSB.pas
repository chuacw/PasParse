unit UTestWinapi_FlatSB;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_FlatSB = class(TTest)
  published
    procedure TestWinapi_FlatSB;
  end;

implementation

procedure TTestWinapi_FlatSB.TestWinapi_FlatSB;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.FlatSB.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_FlatSB.Suite);
end.
