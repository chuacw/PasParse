unit UTestSimpleExpression;

interface

uses
  UTest;

type
  TTestSimpleExpression = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure Test42;
    procedure Test6Times9;
    procedure Test40Plus2;
    procedure Test30Plus10Plus2;
    procedure Test50Minus8;
    procedure Test1Times2Plus3Times4;
    procedure TestAbsolutePlusIndex;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestSimpleExpression }
{$IF NOT DEFINED(DUNIT)}
class function TTestSimpleExpression.GetName: string;
begin
  Result := 'SimpleExpression';
end;

class procedure TTestSimpleExpression.TestAll;
begin
  OK('42', TTestParser.ParsesAs('42', 'Number |42|', RTSimpleExpression));

  OK('6 * 9', TTestParser.ParsesAs('6 * 9',
    'BinaryOperationNode' + #13#10 +
    '  LeftNode: Number |6|' + #13#10 +
    '  OperatorNode: TimesSign |*|' + #13#10 +
    '  RightNode: Number |9|', RTSimpleExpression));

  OK('40 + 2', TTestParser.ParsesAs('40 + 2',
    'BinaryOperationNode' + #13#10 +
    '  LeftNode: Number |40|' + #13#10 +
    '  OperatorNode: PlusSign |+|' + #13#10 +
    '  RightNode: Number |2|', RTSimpleExpression));

  OK('30 + 10 + 2', TTestParser.ParsesAs('30 + 10 + 2',
    'BinaryOperationNode' + #13#10 +
    '  LeftNode: BinaryOperationNode' + #13#10 +
    '    LeftNode: Number |30|' + #13#10 +
    '    OperatorNode: PlusSign |+|' + #13#10 +
    '    RightNode: Number |10|' + #13#10 +
    '  OperatorNode: PlusSign |+|' + #13#10 +
    '  RightNode: Number |2|', RTSimpleExpression));

  OK('50 - 8', TTestParser.ParsesAs('50 - 8',
    'BinaryOperationNode' + #13#10 +
    '  LeftNode: Number |50|' + #13#10 +
    '  OperatorNode: MinusSign |-|' + #13#10 +
    '  RightNode: Number |8|', RTSimpleExpression));

  OK('1 * 2 + 3 * 4', TTestParser.ParsesAs('1 * 2 + 3 * 4',
    'BinaryOperationNode' + #13#10 +
    '  LeftNode: BinaryOperationNode' + #13#10 +
    '    LeftNode: Number |1|' + #13#10 +
    '    OperatorNode: TimesSign |*|' + #13#10 +
    '    RightNode: Number |2|' + #13#10 +
    '  OperatorNode: PlusSign |+|' + #13#10 +
    '  RightNode: BinaryOperationNode' + #13#10 +
    '    LeftNode: Number |3|' + #13#10 +
    '    OperatorNode: TimesSign |*|' + #13#10 +
    '    RightNode: Number |4|', RTSimpleExpression));

  OK('Absolute + Index', TTestParser.ParsesAs('Absolute + Index',
    'BinaryOperationNode' + #13#10 +
    '  LeftNode: Identifier |Absolute|' + #13#10 +
    '  OperatorNode: PlusSign |+|' + #13#10 +
    '  RightNode: Identifier |Index|', RTSimpleExpression));
end;
{$ELSE}

procedure TTestSimpleExpression.Test42;
begin
  OK('42', TTestParser.ParsesAs('42', 'Number |42|', RTSimpleExpression));
end;

procedure TTestSimpleExpression.Test6Times9;
begin
  OK('6 * 9', TTestParser.ParsesAs('6 * 9',
    'BinaryOperationNode' + #13#10 +
    '  LeftNode: Number |6|' + #13#10 +
    '  OperatorNode: TimesSign |*|' + #13#10 +
    '  RightNode: Number |9|', RTSimpleExpression));
end;

procedure TTestSimpleExpression.Test40Plus2;
begin
  OK('40 + 2', TTestParser.ParsesAs('40 + 2',
    'BinaryOperationNode' + #13#10 +
    '  LeftNode: Number |40|' + #13#10 +
    '  OperatorNode: PlusSign |+|' + #13#10 +
    '  RightNode: Number |2|', RTSimpleExpression));
end;

procedure TTestSimpleExpression.Test30Plus10Plus2;
begin
  OK('30 + 10 + 2', TTestParser.ParsesAs('30 + 10 + 2',
    'BinaryOperationNode' + #13#10 +
    '  LeftNode: BinaryOperationNode' + #13#10 +
    '    LeftNode: Number |30|' + #13#10 +
    '    OperatorNode: PlusSign |+|' + #13#10 +
    '    RightNode: Number |10|' + #13#10 +
    '  OperatorNode: PlusSign |+|' + #13#10 +
    '  RightNode: Number |2|', RTSimpleExpression));
end;

procedure TTestSimpleExpression.Test50Minus8;
begin
  OK('50 - 8', TTestParser.ParsesAs('50 - 8',
    'BinaryOperationNode' + #13#10 +
    '  LeftNode: Number |50|' + #13#10 +
    '  OperatorNode: MinusSign |-|' + #13#10 +
    '  RightNode: Number |8|', RTSimpleExpression));
end;

procedure TTestSimpleExpression.Test1Times2Plus3Times4;
begin
  OK('1 * 2 + 3 * 4', TTestParser.ParsesAs('1 * 2 + 3 * 4',
    'BinaryOperationNode' + #13#10 +
    '  LeftNode: BinaryOperationNode' + #13#10 +
    '    LeftNode: Number |1|' + #13#10 +
    '    OperatorNode: TimesSign |*|' + #13#10 +
    '    RightNode: Number |2|' + #13#10 +
    '  OperatorNode: PlusSign |+|' + #13#10 +
    '  RightNode: BinaryOperationNode' + #13#10 +
    '    LeftNode: Number |3|' + #13#10 +
    '    OperatorNode: TimesSign |*|' + #13#10 +
    '    RightNode: Number |4|', RTSimpleExpression));
end;

procedure TTestSimpleExpression.TestAbsolutePlusIndex;
begin
  OK('Absolute + Index', TTestParser.ParsesAs('Absolute + Index',
    'BinaryOperationNode' + #13#10 +
    '  LeftNode: Identifier |Absolute|' + #13#10 +
    '  OperatorNode: PlusSign |+|' + #13#10 +
    '  RightNode: Identifier |Index|', RTSimpleExpression));
end;

initialization
  RegisterTest(TTestSimpleExpression.Suite);
{$ENDIF}
end.
