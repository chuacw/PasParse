unit UTestPosix_String_;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestPosix_String_ = class(TTest)
  published
    procedure TestPosix_String_;
  end;

implementation

procedure TTestPosix_String_.TestPosix_String_;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\posix\Posix.String_.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestPosix_String_.Suite);
end.
