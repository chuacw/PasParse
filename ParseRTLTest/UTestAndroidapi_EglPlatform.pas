unit UTestAndroidapi_EglPlatform;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_EglPlatform = class(TTest)
  published
    procedure TestAndroidapi_EglPlatform;
  end;

implementation

procedure TTestAndroidapi_EglPlatform.TestAndroidapi_EglPlatform;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.EglPlatform.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_EglPlatform.Suite);
end.
