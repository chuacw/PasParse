unit UTestMacapi_VecLib;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestMacapi_VecLib = class(TTest)
  published
    procedure TestMacapi_VecLib;
  end;

implementation

procedure TTestMacapi_VecLib.TestMacapi_VecLib;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\osx\Macapi.VecLib.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestMacapi_VecLib.Suite);
end.
