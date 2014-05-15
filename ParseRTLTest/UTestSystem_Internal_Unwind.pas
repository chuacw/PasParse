unit UTestSystem_Internal_Unwind;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_Internal_Unwind = class(TTest)
  published
    procedure TestSystem_Internal_Unwind;
  end;

implementation

procedure TTestSystem_Internal_Unwind.TestSystem_Internal_Unwind;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\sys\System.Internal.Unwind.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_Internal_Unwind.Suite);
end.
