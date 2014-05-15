unit UTestWinapi_Imm;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_Imm = class(TTest)
  published
    procedure TestWinapi_Imm;
  end;

implementation

procedure TTestWinapi_Imm.TestWinapi_Imm;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.Imm.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_Imm.Suite);
end.
