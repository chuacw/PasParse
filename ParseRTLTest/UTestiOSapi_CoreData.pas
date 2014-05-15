unit UTestiOSapi_CoreData;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestiOSapi_CoreData = class(TTest)
  published
    procedure TestiOSapi_CoreData;
  end;

implementation

procedure TTestiOSapi_CoreData.TestiOSapi_CoreData;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\ios\iOSapi.CoreData.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestiOSapi_CoreData.Suite);
end.
