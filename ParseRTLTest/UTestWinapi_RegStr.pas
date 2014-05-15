unit UTestWinapi_RegStr;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_RegStr = class(TTest)
  published
    procedure TestWinapi_RegStr;
  end;

implementation

procedure TTestWinapi_RegStr.TestWinapi_RegStr;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.RegStr.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_RegStr.Suite);
end.
