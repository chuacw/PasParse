unit UTestiOSapi_AVFoundation;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestiOSapi_AVFoundation = class(TTest)
  published
    procedure TestiOSapi_AVFoundation;
  end;

implementation

procedure TTestiOSapi_AVFoundation.TestiOSapi_AVFoundation;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\ios\iOSapi.AVFoundation.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestiOSapi_AVFoundation.Suite);
end.
