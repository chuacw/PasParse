unit UTestSystem_IniFiles;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_IniFiles = class(TTest)
  published
    procedure TestSystem_IniFiles;
  end;

implementation

procedure TTestSystem_IniFiles.TestSystem_IniFiles;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.IniFiles.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_IniFiles.Suite);
end.
