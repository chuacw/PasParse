unit UTestAndroidapi_KeyCodes;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_KeyCodes = class(TTest)
  published
    procedure TestAndroidapi_KeyCodes;
  end;

implementation

procedure TTestAndroidapi_KeyCodes.TestAndroidapi_KeyCodes;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.KeyCodes.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_KeyCodes.Suite);
end.
