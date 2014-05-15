unit UTestExpressionOrAssignment;

interface

uses
  UTest;

type
  TTestExpressionOrAssignment = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestExpressionOrAssignment;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestExpressionOrAssignment }
{$IF NOT DEFINED(DUNIT)}
class function TTestExpressionOrAssignment.GetName: string;
begin
  Result := 'ExpressionOrAssignment';
end;

class procedure TTestExpressionOrAssignment.TestAll;
begin
  OK('Foo', TTestParser.ParsesAs('Foo',
    'Identifier |Foo|', RTExpressionOrAssignment));

  OK('Foo := 42', TTestParser.ParsesAs('Foo := 42',
    'BinaryOperationNode' + #13#10 +
    '  LeftNode: Identifier |Foo|' + #13#10 +
    '  OperatorNode: ColonEquals |:=|' + #13#10 +
    '  RightNode: Number |42|', RTExpressionOrAssignment));
end;
{$ELSE}

procedure TTestExpressionOrAssignment.TestExpressionOrAssignment;
begin
  OK('Foo', TTestParser.ParsesAs('Foo',
    'Identifier |Foo|', RTExpressionOrAssignment));

  OK('Foo := 42', TTestParser.ParsesAs('Foo := 42',
    'BinaryOperationNode' + #13#10 +
    '  LeftNode: Identifier |Foo|' + #13#10 +
    '  OperatorNode: ColonEquals |:=|' + #13#10 +
    '  RightNode: Number |42|', RTExpressionOrAssignment));
end;

initialization
  RegisterTest(TTestExpressionOrAssignment.Suite);
{$ENDIF}
end.
