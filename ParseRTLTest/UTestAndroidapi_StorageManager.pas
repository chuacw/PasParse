unit UTestAndroidapi_StorageManager;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_StorageManager = class(TTest)
  published
    procedure TestAndroidapi_StorageManager;
  end;

implementation

procedure TTestAndroidapi_StorageManager.TestAndroidapi_StorageManager;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.StorageManager.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_StorageManager.Suite);
end.
