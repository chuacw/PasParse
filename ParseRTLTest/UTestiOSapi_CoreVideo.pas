unit UTestiOSapi_CoreVideo;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestiOSapi_CoreVideo = class(TTest)
  published
    procedure TestiOSapi_CoreVideo;
  end;

implementation

procedure TTestiOSapi_CoreVideo.TestiOSapi_CoreVideo;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\ios\iOSapi.CoreVideo.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestiOSapi_CoreVideo.Suite);
end.
