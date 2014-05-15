unit UTestWinapi_Cpl;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_Cpl = class(TTest)
  published
    procedure TestWinapi_Cpl;
  end;

implementation

procedure TTestWinapi_Cpl.TestWinapi_Cpl;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.Cpl.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_Cpl.Suite);
end.
