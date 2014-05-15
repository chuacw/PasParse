unit UTestSystem_Internal_StrHlpr;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_Internal_StrHlpr = class(TTest)
  published
    procedure TestSystem_Internal_StrHlpr;
  end;

implementation

procedure TTestSystem_Internal_StrHlpr.TestSystem_Internal_StrHlpr;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\sys\System.Internal.StrHlpr.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_Internal_StrHlpr.Suite);
end.
