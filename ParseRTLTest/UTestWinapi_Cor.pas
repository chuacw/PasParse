unit UTestWinapi_Cor;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_Cor = class(TTest)
  published
    procedure TestWinapi_Cor;
  end;

implementation

procedure TTestWinapi_Cor.TestWinapi_Cor;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.Cor.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_Cor.Suite);
end.
