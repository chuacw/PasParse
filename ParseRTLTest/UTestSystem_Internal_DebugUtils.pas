unit UTestSystem_Internal_DebugUtils;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_Internal_DebugUtils = class(TTest)
  published
    procedure TestSystem_Internal_DebugUtils;
  end;

implementation

procedure TTestSystem_Internal_DebugUtils.TestSystem_Internal_DebugUtils;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.Internal.DebugUtils.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_Internal_DebugUtils.Suite);
end.
