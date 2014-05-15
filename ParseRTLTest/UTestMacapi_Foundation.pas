unit UTestMacapi_Foundation;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestMacapi_Foundation = class(TTest)
  published
    procedure TestMacapi_Foundation;
  end;

implementation

procedure TTestMacapi_Foundation.TestMacapi_Foundation;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\osx\Macapi.Foundation.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestMacapi_Foundation.Suite);
end.
