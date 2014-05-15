unit UTestWinapi_StructuredQuery;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_StructuredQuery = class(TTest)
  published
    procedure TestWinapi_StructuredQuery;
  end;

implementation

procedure TTestWinapi_StructuredQuery.TestWinapi_StructuredQuery;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.StructuredQuery.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_StructuredQuery.Suite);
end.
