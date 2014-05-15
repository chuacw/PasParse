unit UTestMacapi_CoreLocation;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestMacapi_CoreLocation = class(TTest)
  published
    procedure TestMacapi_CoreLocation;
  end;

implementation

procedure TTestMacapi_CoreLocation.TestMacapi_CoreLocation;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\osx\Macapi.CoreLocation.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestMacapi_CoreLocation.Suite);
end.
