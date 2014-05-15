unit UTestWinapi_ADOInt;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_ADOInt = class(TTest)
  published
    procedure TestWinapi_ADOInt;
  end;

implementation

procedure TTestWinapi_ADOInt.TestWinapi_ADOInt;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.ADOInt.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_ADOInt.Suite);
end.
