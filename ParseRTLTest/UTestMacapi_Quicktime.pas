unit UTestMacapi_Quicktime;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestMacapi_Quicktime = class(TTest)
  published
    procedure TestMacapi_Quicktime;
  end;

implementation

procedure TTestMacapi_Quicktime.TestMacapi_Quicktime;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\osx\Macapi.Quicktime.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestMacapi_Quicktime.Suite);
end.
