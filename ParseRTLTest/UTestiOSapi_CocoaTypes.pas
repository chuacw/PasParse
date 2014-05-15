unit UTestiOSapi_CocoaTypes;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestiOSapi_CocoaTypes = class(TTest)
  published
    procedure TestiOSapi_CocoaTypes;
  end;

implementation

procedure TTestiOSapi_CocoaTypes.TestiOSapi_CocoaTypes;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\ios\iOSapi.CocoaTypes.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestiOSapi_CocoaTypes.Suite);
end.
