unit UTestiOSapi_UIKit;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestiOSapi_UIKit = class(TTest)
  published
    procedure TestiOSapi_UIKit;
  end;

implementation

procedure TTestiOSapi_UIKit.TestiOSapi_UIKit;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\ios\iOSapi.UIKit.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestiOSapi_UIKit.Suite);
end.
