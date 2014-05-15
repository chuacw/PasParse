unit UTestPosix_Termios;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestPosix_Termios = class(TTest)
  published
    procedure TestPosix_Termios;
  end;

implementation

procedure TTestPosix_Termios.TestPosix_Termios;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\posix\Posix.Termios.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestPosix_Termios.Suite);
end.
