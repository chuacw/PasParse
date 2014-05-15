unit UTestBareInherited;

interface

uses
  UTest;

type
  TTestBareInherited = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestBareInherited;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType, UParseException{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestBareInherited }
{$IF NOT DEFINED(DUNIT)}
class function TTestBareInherited.GetName: string;
begin
  Result := 'BareInherited';
end;

class procedure TTestBareInherited.TestAll;
begin
  OK('inherited', TTestParser.ParsesAs('inherited',
    'InheritedKeyword |inherited|', RTBareInherited));

  try
    TTestParser.ParsesAs('inherited Foo',
      'InheritedKeyword |inherited|', RTBareInherited);
    OK(False, 'inherited Foo exception');
  except
    on ETestException do;
    on EParseException do
      OK(True, 'inherited Foo exception');
  else
    OK(False, 'inherited Foo exception');
  end;
end;
{$ELSE}

procedure TTestBareInherited.TestBareInherited;
begin
  OK('inherited', TTestParser.ParsesAs('inherited',
    'InheritedKeyword |inherited|', RTBareInherited));

  try
    TTestParser.ParsesAs('inherited Foo',
      'InheritedKeyword |inherited|', RTBareInherited);
    OK(False, 'inherited Foo exception');
  except
    on ETestException do;
    on EParseException do
      OK(True, 'inherited Foo exception');
  else
    OK(False, 'inherited Foo exception');
  end;
end;

initialization
  RegisterTest(TTestBareInherited.Suite);
{$ENDIF}
end.
