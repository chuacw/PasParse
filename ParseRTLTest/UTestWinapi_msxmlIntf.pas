unit UTestWinapi_msxmlIntf;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestWinapi_msxmlIntf = class(TTest)
  published
    procedure TestWinapi_msxmlIntf;
  end;

implementation

procedure TTestWinapi_msxmlIntf.TestWinapi_msxmlIntf;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\win\Winapi.msxmlIntf.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestWinapi_msxmlIntf.Suite);
end.
