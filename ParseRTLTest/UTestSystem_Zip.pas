unit UTestSystem_Zip;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_Zip = class(TTest)
  published
    procedure TestSystem_Zip;
  end;

implementation

procedure TTestSystem_Zip.TestSystem_Zip;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.Zip.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_Zip.Suite);
end.
