unit UTestSystem_Win_VCLCom;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_Win_VCLCom = class(TTest)
  published
    procedure TestSystem_Win_VCLCom;
  end;

implementation

procedure TTestSystem_Win_VCLCom.TestSystem_Win_VCLCom;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.Win.VCLCom.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_Win_VCLCom.Suite);
end.
