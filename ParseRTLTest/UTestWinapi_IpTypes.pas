unit UTestWinapi_IpTypes;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_IpTypes = class(TTest)
  published
    procedure TestWinapi_IpTypes;
  end;

implementation

procedure TTestWinapi_IpTypes.TestWinapi_IpTypes;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.IpTypes.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_IpTypes.Suite);
end.
