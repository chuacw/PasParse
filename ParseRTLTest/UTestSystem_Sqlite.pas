unit UTestSystem_Sqlite;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_Sqlite = class(TTest)
  published
    procedure TestSystem_Sqlite;
  end;

implementation

procedure TTestSystem_Sqlite.TestSystem_Sqlite;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.Sqlite.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_Sqlite.Suite);
end.
