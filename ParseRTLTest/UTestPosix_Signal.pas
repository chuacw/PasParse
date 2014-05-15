unit UTestPosix_Signal;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestPosix_Signal = class(TTest)
  published
    procedure TestPosix_Signal;
  end;

implementation

procedure TTestPosix_Signal.TestPosix_Signal;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\posix\Posix.Signal.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestPosix_Signal.Suite);
end.
