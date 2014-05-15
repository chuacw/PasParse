unit UTestWinapi_Portabledevicetypes;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_Portabledevicetypes = class(TTest)
  published
    procedure TestWinapi_Portabledevicetypes;
  end;

implementation

procedure TTestWinapi_Portabledevicetypes.TestWinapi_Portabledevicetypes;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.Portabledevicetypes.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_Portabledevicetypes.Suite);
end.
