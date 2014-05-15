unit UTestAndroidapi_Gles;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_Gles = class(TTest)
  published
    procedure TestAndroidapi_Gles;
  end;

implementation

procedure TTestAndroidapi_Gles.TestAndroidapi_Gles;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.Gles.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_Gles.Suite);
end.
