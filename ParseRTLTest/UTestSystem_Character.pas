unit UTestSystem_Character;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_Character = class(TTest)
  published
    procedure TestSystem_Character;
  end;

implementation

procedure TTestSystem_Character.TestSystem_Character;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.Character.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_Character.Suite);
end.
