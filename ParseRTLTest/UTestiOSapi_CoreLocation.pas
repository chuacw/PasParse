unit UTestiOSapi_CoreLocation;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestiOSapi_CoreLocation = class(TTest)
  published
    procedure TestiOSapi_CoreLocation;
  end;

implementation

procedure TTestiOSapi_CoreLocation.TestiOSapi_CoreLocation;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\ios\iOSapi.CoreLocation.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestiOSapi_CoreLocation.Suite);
end.
