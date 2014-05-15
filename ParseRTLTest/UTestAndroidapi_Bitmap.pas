unit UTestAndroidapi_Bitmap;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_Bitmap = class(TTest)
  published
    procedure TestAndroidapi_Bitmap;
  end;

implementation

procedure TTestAndroidapi_Bitmap.TestAndroidapi_Bitmap;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.Bitmap.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_Bitmap.Suite);
end.
