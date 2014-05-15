unit UTestWinapi_IpRtrMib;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_IpRtrMib = class(TTest)
  published
    procedure TestWinapi_IpRtrMib;
  end;

implementation

procedure TTestWinapi_IpRtrMib.TestWinapi_IpRtrMib;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.IpRtrMib.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_IpRtrMib.Suite);
end.
