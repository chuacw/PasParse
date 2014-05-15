unit UTestAndroidapi_AppGlue;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_AppGlue = class(TTest)
  published
    procedure TestAndroidapi_AppGlue;
  end;

implementation

procedure TTestAndroidapi_AppGlue.TestAndroidapi_AppGlue;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.AppGlue.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_AppGlue.Suite);
end.
