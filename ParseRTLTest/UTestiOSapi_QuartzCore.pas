unit UTestiOSapi_QuartzCore;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestiOSapi_QuartzCore = class(TTest)
  published
    procedure TestiOSapi_QuartzCore;
  end;

implementation

procedure TTestiOSapi_QuartzCore.TestiOSapi_QuartzCore;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\ios\iOSapi.QuartzCore.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestiOSapi_QuartzCore.Suite);
end.
