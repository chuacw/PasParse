unit UTestWinapi_DirectMusic;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_DirectMusic = class(TTest)
  published
    procedure TestWinapi_DirectMusic;
  end;

implementation

procedure TTestWinapi_DirectMusic.TestWinapi_DirectMusic;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.DirectMusic.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_DirectMusic.Suite);
end.
