unit UTestSystem_Odbc;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_Odbc = class(TTest)
  published
    procedure TestSystem_Odbc;
  end;

implementation

procedure TTestSystem_Odbc.TestSystem_Odbc;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.Odbc.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_Odbc.Suite);
end.
