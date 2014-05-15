unit UTestAndroidapi_Configuration;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_Configuration = class(TTest)
  published
    procedure TestAndroidapi_Configuration;
  end;

implementation

procedure TTestAndroidapi_Configuration.TestAndroidapi_Configuration;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.Configuration.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_Configuration.Suite);
end.
