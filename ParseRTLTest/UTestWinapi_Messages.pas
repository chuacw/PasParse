unit UTestWinapi_Messages;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_Messages = class(TTest)
  published
    procedure TestWinapi_Messages;
  end;

implementation

procedure TTestWinapi_Messages.TestWinapi_Messages;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.Messages.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_Messages.Suite);
end.
