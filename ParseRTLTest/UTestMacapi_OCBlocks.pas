unit UTestMacapi_OCBlocks;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestMacapi_OCBlocks = class(TTest)
  published
    procedure TestMacapi_OCBlocks;
  end;

implementation

procedure TTestMacapi_OCBlocks.TestMacapi_OCBlocks;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\osx\Macapi.OCBlocks.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestMacapi_OCBlocks.Suite);
end.
