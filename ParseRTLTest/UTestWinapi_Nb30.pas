unit UTestWinapi_Nb30;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_Nb30 = class(TTest)
  published
    procedure TestWinapi_Nb30;
  end;

implementation

procedure TTestWinapi_Nb30.TestWinapi_Nb30;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.Nb30.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_Nb30.Suite);
end.
