unit UTestWinapi_ShlObj;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_ShlObj = class(TTest)
  published
    procedure TestWinapi_ShlObj;
  end;

implementation

procedure TTestWinapi_ShlObj.TestWinapi_ShlObj;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.ShlObj.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_ShlObj.Suite);
end.
