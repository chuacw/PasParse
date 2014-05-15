unit UTestSystem_Internal_Unwinder;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_Internal_Unwinder = class(TTest)
  published
    procedure TestSystem_Internal_Unwinder;
  end;

implementation

procedure TTestSystem_Internal_Unwinder.TestSystem_Internal_Unwinder;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\sys\System.Internal.Unwinder.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_Internal_Unwinder.Suite);
end.
