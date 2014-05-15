unit UTestWinapi_Wbem;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_Wbem = class(TTest)
  published
    procedure TestWinapi_Wbem;
  end;

implementation

procedure TTestWinapi_Wbem.TestWinapi_Wbem;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.Wbem.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_Wbem.Suite);
end.
