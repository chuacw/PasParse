unit UTestiOSapi_MediaPlayer;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestiOSapi_MediaPlayer = class(TTest)
  published
    procedure TestiOSapi_MediaPlayer;
  end;

implementation

procedure TTestiOSapi_MediaPlayer.TestiOSapi_MediaPlayer;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\ios\iOSapi.MediaPlayer.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestiOSapi_MediaPlayer.Suite);
end.
