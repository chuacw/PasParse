unit UTestSystem_Classes;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_Classes = class(TTest)
  published
    procedure TestSystem_Classes;
  end;

implementation

procedure TTestSystem_Classes.TestSystem_Classes;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.Classes.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_Classes.Suite);
end.
