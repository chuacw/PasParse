unit UTestMacapi_QTKit;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestMacapi_QTKit = class(TTest)
  published
    procedure TestMacapi_QTKit;
  end;

implementation

procedure TTestMacapi_QTKit.TestMacapi_QTKit;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\osx\Macapi.QTKit.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestMacapi_QTKit.Suite);
end.
