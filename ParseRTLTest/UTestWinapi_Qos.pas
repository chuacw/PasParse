unit UTestWinapi_Qos;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_Qos = class(TTest)
  published
    procedure TestWinapi_Qos;
  end;

implementation

procedure TTestWinapi_Qos.TestWinapi_Qos;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.Qos.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_Qos.Suite);
end.
