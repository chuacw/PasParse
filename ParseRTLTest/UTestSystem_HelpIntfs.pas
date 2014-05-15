unit UTestSystem_HelpIntfs;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_HelpIntfs = class(TTest)
  published
    procedure TestSystem_HelpIntfs;
  end;

implementation

procedure TTestSystem_HelpIntfs.TestSystem_HelpIntfs;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.HelpIntfs.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_HelpIntfs.Suite);
end.
