unit UTestFactor;

interface

uses
  UTest;

type
  TTestFactor = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestFactor;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType, UParseException{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestFactor }
{$IF NOT DEFINED(DUNIT)}
class function TTestFactor.GetName: string;
begin
  Result := 'Factor';
end;

class procedure TTestFactor.TestAll;
begin
  OK('42', TTestParser.ParsesAs('42', 'Number |42|', RTFactor));
  OK('not not 42', TTestParser.ParsesAs('not not 42',
    'UnaryOperationNode' + #13#10 +
    '  OperatorNode: NotKeyword |not|' + #13#10 +
    '  OperandNode: UnaryOperationNode' + #13#10 +
    '    OperatorNode: NotKeyword |not|' + #13#10 +
    '    OperandNode: Number |42|', RTFactor));

  try
    TTestParser.ParsesAs('not', 'NotKeyword |not|', RTFactor);
    OK(False, 'not exception');
  except
    on ETestException do;
    on EParseException do
      OK(True, 'not exception');
  else
    OK(False, 'not exception');
  end;

  OK('Foo.Bar', TTestParser.ParsesAs('Foo.Bar',
    'BinaryOperationNode' + #13#10 +
    '  LeftNode: Identifier |Foo|' + #13#10 +
    '  OperatorNode: Dot |.|' + #13#10 +
    '  RightNode: Identifier |Bar|', RTFactor));
end;
{$ELSE}

procedure TTestFactor.TestFactor;
begin
  OK('42', TTestParser.ParsesAs('42', 'Number |42|', RTFactor));
  OK('not not 42', TTestParser.ParsesAs('not not 42',
    'UnaryOperationNode' + #13#10 +
    '  OperatorNode: NotKeyword |not|' + #13#10 +
    '  OperandNode: UnaryOperationNode' + #13#10 +
    '    OperatorNode: NotKeyword |not|' + #13#10 +
    '    OperandNode: Number |42|', RTFactor));

  try
    TTestParser.ParsesAs('not', 'NotKeyword |not|', RTFactor);
    OK(False, 'not exception');
  except
    on ETestException do;
    on EParseException do
      OK(True, 'not exception');
  else
    OK(False, 'not exception');
  end;

  OK('Foo.Bar', TTestParser.ParsesAs('Foo.Bar',
    'BinaryOperationNode' + #13#10 +
    '  LeftNode: Identifier |Foo|' + #13#10 +
    '  OperatorNode: Dot |.|' + #13#10 +
    '  RightNode: Identifier |Bar|', RTFactor));
end;

initialization
  RegisterTest(TTestFactor.Suite);
{$ENDIF}
end.
