unit UTestAndroidapi_Helpers;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_Helpers = class(TTest)
  published
    procedure TestAndroidapi_Helpers;
  end;

implementation

procedure TTestAndroidapi_Helpers.TestAndroidapi_Helpers;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.Helpers.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_Helpers.Suite);
end.
