unit UTestMacapi_Mach;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestMacapi_Mach = class(TTest)
  published
    procedure TestMacapi_Mach;
  end;

implementation

procedure TTestMacapi_Mach.TestMacapi_Mach;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\osx\Macapi.Mach.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestMacapi_Mach.Suite);
end.
