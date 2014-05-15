unit UTestiOSapi_CoreMedia;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestiOSapi_CoreMedia = class(TTest)
  published
    procedure TestiOSapi_CoreMedia;
  end;

implementation

procedure TTestiOSapi_CoreMedia.TestiOSapi_CoreMedia;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\ios\iOSapi.CoreMedia.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestiOSapi_CoreMedia.Suite);
end.
