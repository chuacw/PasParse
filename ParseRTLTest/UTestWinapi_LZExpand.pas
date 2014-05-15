unit UTestWinapi_LZExpand;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_LZExpand = class(TTest)
  published
    procedure TestWinapi_LZExpand;
  end;

implementation

procedure TTestWinapi_LZExpand.TestWinapi_LZExpand;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.LZExpand.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_LZExpand.Suite);
end.
