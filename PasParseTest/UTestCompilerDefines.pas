unit UTestCompilerDefines;

interface

uses
  UTest, UCompilerDefines;

type
  TTestCompilerDefines = class(TTest)
  private
    class function DefineIsTrue(ACompilerDefines: TCompilerDefines;
      const ACompilerDirective: string): Boolean;

  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestCompilerDefines;
{$ENDIF}
  end;

implementation

uses
  ULocation, UPreprocessorException{$IF DEFINED(DUNIT)}, System.SysUtils, TestFramework{$ENDIF};

{ TTestCompilerDefines }

class function TTestCompilerDefines.DefineIsTrue(
  ACompilerDefines: TCompilerDefines; const ACompilerDirective: string): Boolean;
var
  ALocation: TLocation;
begin
  ALocation := TLocation.Create('', '', 0, 0);
  try
    Result := ACompilerDefines.IsTrue(ACompilerDirective, ALocation);
  finally
    ALocation.Free;
  end;
end;

{$IF NOT DEFINED(DUNIT)}
class function TTestCompilerDefines.GetName: string;
begin
  Result := 'CompilerDefines';
end;

class procedure TTestCompilerDefines.TestAll;
var
  ADefines, AClone: TCompilerDefines;
begin
  ADefines := TCompilerDefines.Create;

  // Test for False if undefined IfDef
  OK(not DefineIsTrue(ADefines, 'IFDEF FOO'), 'not IFDEF FOO');
  OK(not DefineIsTrue(ADefines, 'ifdef FOO'), 'not ifdef FOO');

  // Test for True if undefined IfNDef
  OK(DefineIsTrue(ADefines, 'IFNDEF FOO'), 'IFNDEF FOO');
  OK(DefineIsTrue(ADefines, 'ifndef FOO'), 'ifndef FOO');

  // Test for exception on undefined if
  try
    DefineIsTrue(ADefines, 'IF Foo');
    OK(False, 'IF Foo');
  except
    on ETestException do;
    on EPreprocessorException do
      OK(True, 'IF Foo');
  else
    OK(False, 'IF Foo');
  end;

  // Test DefineDirectiveAsTrue
  ADefines.DefineDirectiveAsTrue('IFDEF FOO');
  OK(DefineIsTrue(ADefines, 'IFDEF FOO'), 'IFDEF FOO');

  // Test DefineDirectiveAsFalse
  ADefines.DefineDirectiveAsFalse('IFDEF FOO');
  OK(not DefineIsTrue(ADefines, 'IFDEF FOO'), 'not IFDEF FOO');

  // Test DefineSymbol
  ADefines.DefineSymbol('FOO');
  OK(DefineIsTrue(ADefines, 'IFDEF FOO'), 'IFDEF FOO');
  OK(not DefineIsTrue(ADefines, 'IFNDEF FOO'), 'not IFNDEF FOO');

  // Test UndefineSymbol
  ADefines.UndefineSymbol('FOO');
  OK(not DefineIsTrue(ADefines, 'IFDEF FOO'), 'not IFDEF FOO');
  OK(DefineIsTrue(ADefines, 'IFNDEF FOO'), 'IFNDEF FOO');

  // Test case-insensitivity
  ADefines.DefineDirectiveAsTrue('IFDEF FOO');
  OK(DefineIsTrue(ADefines, 'IfDef Foo'), 'IfDef Foo');

  AClone := ADefines.Clone;
  ADefines.Free;

  OK(DefineIsTrue(AClone, 'IfDef Foo'), 'Clone');

  AClone.Free;
end;
{$ELSE}
var
  ADefines, AClone: TCompilerDefines;

procedure TTestCompilerDefines.TestCompilerDefines;
begin
  // Test for False if undefined IfDef
  OK(not DefineIsTrue(ADefines, 'IFDEF FOO'), 'not IFDEF FOO');
  OK(not DefineIsTrue(ADefines, 'ifdef FOO'), 'not ifdef FOO');

  // Test for True if undefined IfNDef
  OK(DefineIsTrue(ADefines, 'IFNDEF FOO'), 'IFNDEF FOO');
  OK(DefineIsTrue(ADefines, 'ifndef FOO'), 'ifndef FOO');

  // Test for exception on undefined if
  try
    DefineIsTrue(ADefines, 'IF Foo');
    OK(False, 'IF Foo');
  except
    on ETestException do;
    on EPreprocessorException do
      OK(True, 'IF Foo');
  else
    OK(False, 'IF Foo');
  end;

  // Test DefineDirectiveAsTrue
  ADefines.DefineDirectiveAsTrue('IFDEF FOO');
  OK(DefineIsTrue(ADefines, 'IFDEF FOO'), 'IFDEF FOO');

  // Test DefineDirectiveAsFalse
  ADefines.DefineDirectiveAsFalse('IFDEF FOO');
  OK(not DefineIsTrue(ADefines, 'IFDEF FOO'), 'not IFDEF FOO');

  // Test DefineSymbol
  ADefines.DefineSymbol('FOO');
  OK(DefineIsTrue(ADefines, 'IFDEF FOO'), 'IFDEF FOO');
  OK(not DefineIsTrue(ADefines, 'IFNDEF FOO'), 'not IFNDEF FOO');

  // Test UndefineSymbol
  ADefines.UndefineSymbol('FOO');
  OK(not DefineIsTrue(ADefines, 'IFDEF FOO'), 'not IFDEF FOO');
  OK(DefineIsTrue(ADefines, 'IFNDEF FOO'), 'IFNDEF FOO');

  // Test case-insensitivity
  ADefines.DefineDirectiveAsTrue('IFDEF FOO');
  OK(DefineIsTrue(ADefines, 'IfDef Foo'), 'IfDef Foo');

  AClone := ADefines.Clone;
  FreeAndNil(ADefines);

  OK(DefineIsTrue(AClone, 'IfDef Foo'), 'Clone');
end;

procedure TTestCompilerDefines.SetUp;
begin
  ADefines := TCompilerDefines.Create;
end;

procedure TTestCompilerDefines.TearDown;
begin
  FreeAndNil(ADefines);
  FreeAndNil(AClone);
end;

initialization
  RegisterTest(TTestCompilerDefines.Suite);
{$ENDIF}
end.

