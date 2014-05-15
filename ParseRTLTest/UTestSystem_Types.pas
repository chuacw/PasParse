unit UTestSystem_Types;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_Types = class(TTest)
  published
    procedure TestSystem_Types;
  end;

implementation

procedure TTestSystem_Types.TestSystem_Types;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\sys\System.Types.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_Types.Suite);
end.
