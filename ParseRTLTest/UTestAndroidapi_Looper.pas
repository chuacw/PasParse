unit UTestAndroidapi_Looper;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_Looper = class(TTest)
  published
    procedure TestAndroidapi_Looper;
  end;

implementation

procedure TTestAndroidapi_Looper.TestAndroidapi_Looper;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.Looper.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_Looper.Suite);
end.
