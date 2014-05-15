unit UTestWinapi_Manipulations;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_Manipulations = class(TTest)
  published
    procedure TestWinapi_Manipulations;
  end;

implementation

procedure TTestWinapi_Manipulations.TestWinapi_Manipulations;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.Manipulations.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_Manipulations.Suite);
end.
