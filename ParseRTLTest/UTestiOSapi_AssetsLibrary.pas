unit UTestiOSapi_AssetsLibrary;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestiOSapi_AssetsLibrary = class(TTest)
  published
    procedure TestiOSapi_AssetsLibrary;
  end;

implementation

procedure TTestiOSapi_AssetsLibrary.TestiOSapi_AssetsLibrary;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\ios\iOSapi.AssetsLibrary.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestiOSapi_AssetsLibrary.Suite);
end.
