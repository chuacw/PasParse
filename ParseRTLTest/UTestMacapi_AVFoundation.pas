unit UTestMacapi_AVFoundation;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestMacapi_AVFoundation = class(TTest)
  published
    procedure TestMacapi_AVFoundation;
  end;

implementation

procedure TTestMacapi_AVFoundation.TestMacapi_AVFoundation;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\osx\Macapi.AVFoundation.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestMacapi_AVFoundation.Suite);
end.
