unit UTestiOSapi_Foundation;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestiOSapi_Foundation = class(TTest)
  published
    procedure TestiOSapi_Foundation;
  end;

implementation

procedure TTestiOSapi_Foundation.TestiOSapi_Foundation;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\ios\iOSapi.Foundation.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestiOSapi_Foundation.Suite);
end.
