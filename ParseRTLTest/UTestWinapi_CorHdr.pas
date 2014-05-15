unit UTestWinapi_CorHdr;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_CorHdr = class(TTest)
  published
    procedure TestWinapi_CorHdr;
  end;

implementation

procedure TTestWinapi_CorHdr.TestWinapi_CorHdr;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.CorHdr.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_CorHdr.Suite);
end.
