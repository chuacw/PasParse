unit UTestAndroidapi_Consts;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_Consts = class(TTest)
  published
    procedure TestAndroidapi_Consts;
  end;

implementation

procedure TTestAndroidapi_Consts.TestAndroidapi_Consts;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\ja\Androidapi.Consts.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_Consts.Suite);
end.
