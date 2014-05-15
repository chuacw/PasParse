unit UTestSystem_SyncObjs;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_SyncObjs = class(TTest)
  published
    procedure TestSystem_SyncObjs;
  end;

implementation

procedure TTestSystem_SyncObjs.TestSystem_SyncObjs;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.SyncObjs.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_SyncObjs.Suite);
end.
