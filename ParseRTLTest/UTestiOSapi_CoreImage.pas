unit UTestiOSapi_CoreImage;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestiOSapi_CoreImage = class(TTest)
  published
    procedure TestiOSapi_CoreImage;
  end;

implementation

procedure TTestiOSapi_CoreImage.TestiOSapi_CoreImage;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\ios\iOSapi.CoreImage.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestiOSapi_CoreImage.Suite);
end.
