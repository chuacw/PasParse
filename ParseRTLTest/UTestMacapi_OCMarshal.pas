unit UTestMacapi_OCMarshal;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestMacapi_OCMarshal = class(TTest)
  published
    procedure TestMacapi_OCMarshal;
  end;

implementation

procedure TTestMacapi_OCMarshal.TestMacapi_OCMarshal;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\osx\Macapi.OCMarshal.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestMacapi_OCMarshal.Suite);
end.
