unit UTestiOSapi_CoreGraphics;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestiOSapi_CoreGraphics = class(TTest)
  published
    procedure TestiOSapi_CoreGraphics;
  end;

implementation

procedure TTestiOSapi_CoreGraphics.TestiOSapi_CoreGraphics;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\ios\iOSapi.CoreGraphics.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestiOSapi_CoreGraphics.Suite);
end.
