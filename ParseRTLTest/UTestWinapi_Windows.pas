unit UTestWinapi_Windows;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_Windows = class(TTest)
  published
    procedure TestWinapi_Windows;
  end;

implementation

procedure TTestWinapi_Windows.TestWinapi_Windows;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.Windows.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_Windows.Suite);
end.
