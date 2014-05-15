unit UTestAndroidapi_Log;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_Log = class(TTest)
  published
    procedure TestAndroidapi_Log;
  end;

implementation

procedure TTestAndroidapi_Log.TestAndroidapi_Log;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.Log.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_Log.Suite);
end.
