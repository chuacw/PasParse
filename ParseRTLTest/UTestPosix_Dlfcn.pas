unit UTestPosix_Dlfcn;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestPosix_Dlfcn = class(TTest)
  published
    procedure TestPosix_Dlfcn;
  end;

implementation

procedure TTestPosix_Dlfcn.TestPosix_Dlfcn;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\posix\Posix.Dlfcn.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestPosix_Dlfcn.Suite);
end.
