unit UTestExpressionOrRange;

interface

uses
  UTest;

type
  TTestExpressionOrRange = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestExpressionOrRange;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestExpressionOrRange }
{$IF NOT DEFINED(DUNIT)}
class function TTestExpressionOrRange.GetName: string;
begin
  Result := 'ExpressionOrRange';
end;

class procedure TTestExpressionOrRange.TestAll;
begin
  OK('42', TTestParser.ParsesAs('42',
    'Number |42|', RTExpressionOrRange));

  OK('0..42', TTestParser.ParsesAs('0..42',
    'BinaryOperationNode' + #13#10 +
    '  LeftNode: Number |0|' + #13#10 +
    '  OperatorNode: DotDot |..|' + #13#10 +
    '  RightNode: Number |42|', RTExpressionOrRange));
end;
{$ELSE}

procedure TTestExpressionOrRange.TestExpressionOrRange;
begin
  OK('42', TTestParser.ParsesAs('42',
    'Number |42|', RTExpressionOrRange));

  OK('0..42', TTestParser.ParsesAs('0..42',
    'BinaryOperationNode' + #13#10 +
    '  LeftNode: Number |0|' + #13#10 +
    '  OperatorNode: DotDot |..|' + #13#10 +
    '  RightNode: Number |42|', RTExpressionOrRange));
end;

initialization
  RegisterTest(TTestExpressionOrRange.Suite);
{$ENDIF}
end.
