unit UTestAndroidapi_NativeWindow;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_NativeWindow = class(TTest)
  published
    procedure TestAndroidapi_NativeWindow;
  end;

implementation

procedure TTestAndroidapi_NativeWindow.TestAndroidapi_NativeWindow;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.NativeWindow.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_NativeWindow.Suite);
end.
