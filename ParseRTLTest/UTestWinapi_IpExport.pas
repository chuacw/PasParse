unit UTestWinapi_IpExport;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_IpExport = class(TTest)
  published
    procedure TestWinapi_IpExport;
  end;

implementation

procedure TTestWinapi_IpExport.TestWinapi_IpExport;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.IpExport.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_IpExport.Suite);
end.
