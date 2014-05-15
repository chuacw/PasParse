unit UTestSystem_Messaging;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_Messaging = class(TTest)
  published
    procedure TestSystem_Messaging;
  end;

implementation

procedure TTestSystem_Messaging.TestSystem_Messaging;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.Messaging.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_Messaging.Suite);
end.
