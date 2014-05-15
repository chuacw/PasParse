unit UTestMacapi_ImageIO;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestMacapi_ImageIO = class(TTest)
  published
    procedure TestMacapi_ImageIO;
  end;

implementation

procedure TTestMacapi_ImageIO.TestMacapi_ImageIO;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\osx\Macapi.ImageIO.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestMacapi_ImageIO.Suite);
end.
