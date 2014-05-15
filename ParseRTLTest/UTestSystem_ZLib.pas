unit UTestSystem_ZLib;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_ZLib = class(TTest)
  published
    procedure TestSystem_ZLib;
  end;

implementation

procedure TTestSystem_ZLib.TestSystem_ZLib;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.ZLib.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_ZLib.Suite);
end.
