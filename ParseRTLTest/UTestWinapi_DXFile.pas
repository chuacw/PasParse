unit UTestWinapi_DXFile;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_DXFile = class(TTest)
  published
    procedure TestWinapi_DXFile;
  end;

implementation

procedure TTestWinapi_DXFile.TestWinapi_DXFile;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.DXFile.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_DXFile.Suite);
end.
