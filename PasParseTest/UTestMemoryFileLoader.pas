unit UTestMemoryFileLoader;

interface

uses
  UTest;

type
  TTestMemoryFileLoader = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestMemoryFileLoader;
{$ENDIF}
  end;

implementation

uses
  UMemoryFileLoader, System.SysUtils{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestMemoryFileLoader }
{$IF NOT DEFINED(DUNIT)}
class function TTestMemoryFileLoader.GetName: string;
begin
  Result := 'MemoryFileLoader';
end;

class procedure TTestMemoryFileLoader.TestAll;
var
  ALoader: TMemoryFileLoader;
begin
  ALoader := TMemoryFileLoader.Create;

  try
    ALoader.Load('Foo.pas');
    OK(False, 'Load exception');
  except
    on ETestException do;
    on EInOutError do
      OK(True, 'Load exception');
  else
    OK(False, 'Load exception');
  end;

  OK(not ALoader.Exists('Foo.pas'), 'not Exists()');

  ALoader['Foo.pas'] := 'Bar';
  OK(ALoader.Load('Foo.pas') = 'Bar', 'Load()');
  OK(ALoader['Foo.pas'] = 'Bar', '[]');

  OK(ALoader.Exists('Foo.pas'), 'Exists()');

  OK(ALoader.LoadFromParentDirs('Bar\Foo.pas') = 'Bar', 'LoadFromParentDirs()');

  ALoader['FOO.PAS'] := 'Baz';
  OK(ALoader['Foo.pas'] = 'Baz', 'CaseInvariant');

  ALoader.Free;
end;
{$ELSE}

var
  ALoader: TMemoryFileLoader;

procedure TTestMemoryFileLoader.TestMemoryFileLoader;
begin

  try
    ALoader.Load('Foo.pas');
    OK(False, 'Load exception');
  except
    on ETestException do;
    on EInOutError do
      OK(True, 'Load exception');
  else
    OK(False, 'Load exception');
  end;

  OK(not ALoader.Exists('Foo.pas'), 'not Exists()');

  ALoader['Foo.pas'] := 'Bar';
  OK(ALoader.Load('Foo.pas') = 'Bar', 'Load()');
  OK(ALoader['Foo.pas'] = 'Bar', '[]');

  OK(ALoader.Exists('Foo.pas'), 'Exists()');

  OK(ALoader.LoadFromParentDirs('Bar\Foo.pas') = 'Bar', 'LoadFromParentDirs()');

  ALoader['FOO.PAS'] := 'Baz';
  OK(ALoader['Foo.pas'] = 'Baz', 'CaseInvariant');

end;

procedure TTestMemoryFileLoader.SetUp;
begin
  ALoader := TMemoryFileLoader.Create;
end;

procedure TTestMemoryFileLoader.TearDown;
begin
  ALoader.Free;
end;

initialization
  RegisterTest(TTestMemoryFileLoader.Suite);
{$ENDIF}
end.
