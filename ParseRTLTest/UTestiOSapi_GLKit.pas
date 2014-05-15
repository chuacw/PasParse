unit UTestiOSapi_GLKit;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestiOSapi_GLKit = class(TTest)
  published
    procedure TestiOSapi_GLKit;
  end;

implementation

procedure TTestiOSapi_GLKit.TestiOSapi_GLKit;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\ios\iOSapi.GLKit.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestiOSapi_GLKit.Suite);
end.
