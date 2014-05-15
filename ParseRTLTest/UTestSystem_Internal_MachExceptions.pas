unit UTestSystem_Internal_MachExceptions;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_Internal_MachExceptions = class(TTest)
  published
    procedure TestSystem_Internal_MachExceptions;
  end;

implementation

procedure TTestSystem_Internal_MachExceptions.TestSystem_Internal_MachExceptions;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\sys\System.Internal.MachExceptions.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_Internal_MachExceptions.Suite);
end.
