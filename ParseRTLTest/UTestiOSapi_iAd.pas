unit UTestiOSapi_iAd;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestiOSapi_iAd = class(TTest)
  published
    procedure TestiOSapi_iAd;
  end;

implementation

procedure TTestiOSapi_iAd.TestiOSapi_iAd;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\ios\iOSapi.iAd.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestiOSapi_iAd.Suite);
end.
