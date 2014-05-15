unit UTestSystem_Internal_ExcUtils;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_Internal_ExcUtils = class(TTest)
  published
    procedure TestSystem_Internal_ExcUtils;
  end;

implementation

procedure TTestSystem_Internal_ExcUtils.TestSystem_Internal_ExcUtils;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\sys\System.Internal.ExcUtils.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_Internal_ExcUtils.Suite);
end.
