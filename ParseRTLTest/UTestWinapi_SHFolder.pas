unit UTestWinapi_SHFolder;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_SHFolder = class(TTest)
  published
    procedure TestWinapi_SHFolder;
  end;

implementation

procedure TTestWinapi_SHFolder.TestWinapi_SHFolder;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.SHFolder.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_SHFolder.Suite);
end.
