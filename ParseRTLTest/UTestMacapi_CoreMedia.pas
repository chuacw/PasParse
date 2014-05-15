unit UTestMacapi_CoreMedia;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestMacapi_CoreMedia = class(TTest)
  published
    procedure TestMacapi_CoreMedia;
  end;

implementation

procedure TTestMacapi_CoreMedia.TestMacapi_CoreMedia;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\osx\Macapi.CoreMedia.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestMacapi_CoreMedia.Suite);
end.
