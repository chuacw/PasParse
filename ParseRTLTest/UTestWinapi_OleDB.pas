unit UTestWinapi_OleDB;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_OleDB = class(TTest)
  published
    procedure TestWinapi_OleDB;
  end;

implementation

procedure TTestWinapi_OleDB.TestWinapi_OleDB;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.OleDB.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_OleDB.Suite);
end.
