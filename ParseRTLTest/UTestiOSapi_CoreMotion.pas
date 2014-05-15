unit UTestiOSapi_CoreMotion;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestiOSapi_CoreMotion = class(TTest)
  published
    procedure TestiOSapi_CoreMotion;
  end;

implementation

procedure TTestiOSapi_CoreMotion.TestiOSapi_CoreMotion;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\ios\iOSapi.CoreMotion.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestiOSapi_CoreMotion.Suite);
end.
