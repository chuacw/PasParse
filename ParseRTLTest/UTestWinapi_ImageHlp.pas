unit UTestWinapi_ImageHlp;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_ImageHlp = class(TTest)
  published
    procedure TestWinapi_ImageHlp;
  end;

implementation

procedure TTestWinapi_ImageHlp.TestWinapi_ImageHlp;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.ImageHlp.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_ImageHlp.Suite);
end.
