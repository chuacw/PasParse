unit UTestMacapi_QuartzCore;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestMacapi_QuartzCore = class(TTest)
  published
    procedure TestMacapi_QuartzCore;
  end;

implementation

procedure TTestMacapi_QuartzCore.TestMacapi_QuartzCore;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\osx\Macapi.QuartzCore.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestMacapi_QuartzCore.Suite);
end.
