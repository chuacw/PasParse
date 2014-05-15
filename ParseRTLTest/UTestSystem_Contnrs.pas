unit UTestSystem_Contnrs;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_Contnrs = class(TTest)
  published
    procedure TestSystem_Contnrs;
  end;

implementation

procedure TTestSystem_Contnrs.TestSystem_Contnrs;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.Contnrs.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_Contnrs.Suite);
end.
