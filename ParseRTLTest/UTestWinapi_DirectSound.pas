unit UTestWinapi_DirectSound;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_DirectSound = class(TTest)
  published
    procedure TestWinapi_DirectSound;
  end;

implementation

procedure TTestWinapi_DirectSound.TestWinapi_DirectSound;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.DirectSound.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_DirectSound.Suite);
end.
