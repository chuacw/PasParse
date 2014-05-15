unit UTestAndroidapi_Timer;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_Timer = class(TTest)
  published
    procedure TestAndroidapi_Timer;
  end;

implementation

procedure TTestAndroidapi_Timer.TestAndroidapi_Timer;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.Timer.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_Timer.Suite);
end.
