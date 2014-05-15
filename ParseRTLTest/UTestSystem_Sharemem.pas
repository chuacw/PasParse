unit UTestSystem_Sharemem;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_Sharemem = class(TTest)
  published
    procedure TestSystem_Sharemem;
  end;

implementation

procedure TTestSystem_Sharemem.TestSystem_Sharemem;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\sys\System.Sharemem.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_Sharemem.Suite);
end.
