unit UTestWinapi_ComSvcs;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_ComSvcs = class(TTest)
  published
    procedure TestWinapi_ComSvcs;
  end;

implementation

procedure TTestWinapi_ComSvcs.TestWinapi_ComSvcs;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.ComSvcs.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_ComSvcs.Suite);
end.
