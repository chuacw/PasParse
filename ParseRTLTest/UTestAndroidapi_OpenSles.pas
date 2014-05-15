unit UTestAndroidapi_OpenSles;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_OpenSles = class(TTest)
  published
    procedure TestAndroidapi_OpenSles;
  end;

implementation

procedure TTestAndroidapi_OpenSles.TestAndroidapi_OpenSles;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.OpenSles.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_OpenSles.Suite);
end.
