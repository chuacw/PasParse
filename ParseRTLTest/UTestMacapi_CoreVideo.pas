unit UTestMacapi_CoreVideo;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestMacapi_CoreVideo = class(TTest)
  published
    procedure TestMacapi_CoreVideo;
  end;

implementation

procedure TTestMacapi_CoreVideo.TestMacapi_CoreVideo;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\osx\Macapi.CoreVideo.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestMacapi_CoreVideo.Suite);
end.
