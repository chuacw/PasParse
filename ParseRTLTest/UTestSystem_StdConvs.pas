unit UTestSystem_StdConvs;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_StdConvs = class(TTest)
  published
    procedure TestSystem_StdConvs;
  end;

implementation

procedure TTestSystem_StdConvs.TestSystem_StdConvs;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.StdConvs.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_StdConvs.Suite);
end.
