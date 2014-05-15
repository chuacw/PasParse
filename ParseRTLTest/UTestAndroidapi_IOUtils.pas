unit UTestAndroidapi_IOUtils;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_IOUtils = class(TTest)
  published
    procedure TestAndroidapi_IOUtils;
  end;

implementation

procedure TTestAndroidapi_IOUtils.TestAndroidapi_IOUtils;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.IOUtils.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_IOUtils.Suite);
end.
