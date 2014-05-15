unit UTestiOSapi_CoreAudio;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestiOSapi_CoreAudio = class(TTest)
  published
    procedure TestiOSapi_CoreAudio;
  end;

implementation

procedure TTestiOSapi_CoreAudio.TestiOSapi_CoreAudio;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\ios\iOSapi.CoreAudio.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestiOSapi_CoreAudio.Suite);
end.
