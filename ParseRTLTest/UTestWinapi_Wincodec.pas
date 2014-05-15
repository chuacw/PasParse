unit UTestWinapi_Wincodec;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_Wincodec = class(TTest)
  published
    procedure TestWinapi_Wincodec;
  end;

implementation

procedure TTestWinapi_Wincodec.TestWinapi_Wincodec;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.Wincodec.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_Wincodec.Suite);
end.
