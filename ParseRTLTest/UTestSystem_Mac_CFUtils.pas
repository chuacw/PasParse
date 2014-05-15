unit UTestSystem_Mac_CFUtils;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_Mac_CFUtils = class(TTest)
  published
    procedure TestSystem_Mac_CFUtils;
  end;

implementation

procedure TTestSystem_Mac_CFUtils.TestSystem_Mac_CFUtils;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\osx\System.Mac.CFUtils.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_Mac_CFUtils.Suite);
end.
