unit UTestWinapi_StructuredQueryCondition;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_StructuredQueryCondition = class(TTest)
  published
    procedure TestWinapi_StructuredQueryCondition;
  end;

implementation

procedure TTestWinapi_StructuredQueryCondition.TestWinapi_StructuredQueryCondition;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.StructuredQueryCondition.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_StructuredQueryCondition.Suite);
end.
