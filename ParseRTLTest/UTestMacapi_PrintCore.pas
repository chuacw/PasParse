unit UTestMacapi_PrintCore;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestMacapi_PrintCore = class(TTest)
  published
    procedure TestMacapi_PrintCore;
  end;

implementation

procedure TTestMacapi_PrintCore.TestMacapi_PrintCore;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\osx\Macapi.PrintCore.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestMacapi_PrintCore.Suite);
end.
