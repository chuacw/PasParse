unit UTestSystem_StartUpCopy;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_StartUpCopy = class(TTest)
  published
    procedure TestSystem_StartUpCopy;
  end;

implementation

procedure TTestSystem_StartUpCopy.TestSystem_StartUpCopy;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.StartUpCopy.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_StartUpCopy.Suite);
end.
