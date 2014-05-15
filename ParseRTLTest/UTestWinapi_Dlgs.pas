unit UTestWinapi_Dlgs;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_Dlgs = class(TTest)
  published
    procedure TestWinapi_Dlgs;
  end;

implementation

procedure TTestWinapi_Dlgs.TestWinapi_Dlgs;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.Dlgs.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_Dlgs.Suite);
end.
