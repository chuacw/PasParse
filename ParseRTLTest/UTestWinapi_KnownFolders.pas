unit UTestWinapi_KnownFolders;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_KnownFolders = class(TTest)
  published
    procedure TestWinapi_KnownFolders;
  end;

implementation

procedure TTestWinapi_KnownFolders.TestWinapi_KnownFolders;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.KnownFolders.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_KnownFolders.Suite);
end.
