unit UTestiOSapi_StoreKit;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestiOSapi_StoreKit = class(TTest)
  published
    procedure TestiOSapi_StoreKit;
  end;

implementation

procedure TTestiOSapi_StoreKit.TestiOSapi_StoreKit;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\ios\iOSapi.StoreKit.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestiOSapi_StoreKit.Suite);
end.
