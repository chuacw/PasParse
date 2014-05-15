unit UTestAndroidapi_Input;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestAndroidapi_Input = class(TTest)
  published
    procedure TestAndroidapi_Input;
  end;

implementation

procedure TTestAndroidapi_Input.TestAndroidapi_Input;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android\Androidapi.Input.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestAndroidapi_Input.Suite);
end.
