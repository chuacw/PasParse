unit UTestSystem_Win_ComObjWrapper;
interface
uses
  System.SysUtils, TestFramework, UTest;

type

  TTestSystem_Win_ComObjWrapper = class(TTest)
  published
    procedure TestSystem_Win_ComObjWrapper;
  end;

implementation

procedure TTestSystem_Win_ComObjWrapper.TestSystem_Win_ComObjWrapper;
const
  CRTLFilename = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.Win.ComObjWrapper.pas';
begin
  ParseFile(CRTLFilename);
end;

initialization
  RegisterTest(TTestSystem_Win_ComObjWrapper.Suite);
end.
