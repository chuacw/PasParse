unit UTestiOSapi_CoreTelephony;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestiOSapi_CoreTelephony = class(TTest)
  published
    procedure TestiOSapi_CoreTelephony;
  end;

implementation

procedure TTestiOSapi_CoreTelephony.TestiOSapi_CoreTelephony;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\ios\iOSapi.CoreTelephony.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestiOSapi_CoreTelephony.Suite);
end.
