unit UTestWinapi_ObjectArray;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_ObjectArray = class(TTest)
  published
    procedure TestWinapi_ObjectArray;
  end;

implementation

procedure TTestWinapi_ObjectArray.TestWinapi_ObjectArray;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.ObjectArray.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_ObjectArray.Suite);
end.
