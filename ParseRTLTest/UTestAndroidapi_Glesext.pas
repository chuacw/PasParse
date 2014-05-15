unit UTestAndroidapi_Glesext;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_Glesext = class(TTest)
  published
    procedure TestAndroidapi_Glesext;
  end;

implementation

procedure TTestAndroidapi_Glesext.TestAndroidapi_Glesext;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.Glesext.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_Glesext.Suite);
end.
