unit UTestAndroidapi_Rect;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_Rect = class(TTest)
  published
    procedure TestAndroidapi_Rect;
  end;

implementation

procedure TTestAndroidapi_Rect.TestAndroidapi_Rect;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.Rect.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_Rect.Suite);
end.
