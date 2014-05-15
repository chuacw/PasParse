unit UTestWinapi_msxml;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_msxml = class(TTest)
  published
    procedure TestWinapi_msxml;
  end;

implementation

procedure TTestWinapi_msxml.TestWinapi_msxml;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.msxml.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_msxml.Suite);
end.
