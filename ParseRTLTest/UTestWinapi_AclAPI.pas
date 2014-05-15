unit UTestWinapi_AclAPI;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_AclAPI = class(TTest)
  published
    procedure TestWinapi_AclAPI;
  end;

implementation

procedure TTestWinapi_AclAPI.TestWinapi_AclAPI;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.AclAPI.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_AclAPI.Suite);
end.
