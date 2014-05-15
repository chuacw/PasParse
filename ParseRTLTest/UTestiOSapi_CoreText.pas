unit UTestiOSapi_CoreText;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestiOSapi_CoreText = class(TTest)
  published
    procedure TestiOSapi_CoreText;
  end;

implementation

procedure TTestiOSapi_CoreText.TestiOSapi_CoreText;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\ios\iOSapi.CoreText.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestiOSapi_CoreText.Suite);
end.
