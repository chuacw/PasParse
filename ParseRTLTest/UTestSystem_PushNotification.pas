unit UTestSystem_PushNotification;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_PushNotification = class(TTest)
  published
    procedure TestSystem_PushNotification;
  end;

implementation

procedure TTestSystem_PushNotification.TestSystem_PushNotification;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.PushNotification.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_PushNotification.Suite);
end.
