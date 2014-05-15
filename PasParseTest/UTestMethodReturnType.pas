unit UTestMethodReturnType;

interface

uses
  UTest;

type
  TTestMethodReturnType = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestMethodReturnType;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestMethodReturnType }
{$IF NOT DEFINED(DUNIT)}
class function TTestMethodReturnType.GetName: string;
begin
  Result := 'MethodReturnType';
end;

class procedure TTestMethodReturnType.TestAll;
begin
  OK('Foo', TTestParser.ParsesAs('Foo', 'Identifier |Foo|', RTMethodReturnType));

  OK('Foo.TBar', TTestParser.ParsesAs('Foo.TBar',
    'BinaryOperationNode' + #13#10 +
    '  LeftNode: Identifier |Foo|' + #13#10 +
    '  OperatorNode: Dot |.|' + #13#10 +
    '  RightNode: Identifier |TBar|', RTMethodReturnType));

  OK('string', TTestParser.ParsesAs('string',
    'StringKeyword |string|', RTMethodReturnType));
end;
{$ELSE}

procedure TTestMethodReturnType.TestMethodReturnType;
begin
  OK('Foo', TTestParser.ParsesAs('Foo', 'Identifier |Foo|', RTMethodReturnType));

  OK('Foo.TBar', TTestParser.ParsesAs('Foo.TBar',
    'BinaryOperationNode' + #13#10 +
    '  LeftNode: Identifier |Foo|' + #13#10 +
    '  OperatorNode: Dot |.|' + #13#10 +
    '  RightNode: Identifier |TBar|', RTMethodReturnType));

  OK('string', TTestParser.ParsesAs('string',
    'StringKeyword |string|', RTMethodReturnType));
end;

initialization
  RegisterTest(TTestMethodReturnType.Suite);
{$ENDIF}
end.
