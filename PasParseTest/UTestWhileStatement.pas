unit UTestWhileStatement;

interface

uses
  UTest;

type
  TTestWhileStatement = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestWhileStatement;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestWhileStatement }
{$IF NOT DEFINED(DUNIT)}
class function TTestWhileStatement.GetName: string;
begin
  Result := 'WhileStatement';
end;

class procedure TTestWhileStatement.TestAll;
begin
  OK('while Foo do', TTestParser.ParsesAs('while Foo do',
    'WhileStatementNode' + #13#10 +
    '  WhileKeywordNode: WhileKeyword |while|' + #13#10 +
    '  ConditionNode: Identifier |Foo|' + #13#10 +
    '  DoKeywordNode: DoKeyword |do|' + #13#10 +
    '  StatementNode: (none)', RTWhileStatement));

  OK('while Foo do Bar', TTestParser.ParsesAs('while Foo do Bar',
    'WhileStatementNode' + #13#10 +
    '  WhileKeywordNode: WhileKeyword |while|' + #13#10 +
    '  ConditionNode: Identifier |Foo|' + #13#10 +
    '  DoKeywordNode: DoKeyword |do|' + #13#10 +
    '  StatementNode: Identifier |Bar|', RTWhileStatement));
end;
{$ELSE}

procedure TTestWhileStatement.TestWhileStatement;
begin
  OK('while Foo do', TTestParser.ParsesAs('while Foo do',
    'WhileStatementNode' + #13#10 +
    '  WhileKeywordNode: WhileKeyword |while|' + #13#10 +
    '  ConditionNode: Identifier |Foo|' + #13#10 +
    '  DoKeywordNode: DoKeyword |do|' + #13#10 +
    '  StatementNode: (none)', RTWhileStatement));

  OK('while Foo do Bar', TTestParser.ParsesAs('while Foo do Bar',
    'WhileStatementNode' + #13#10 +
    '  WhileKeywordNode: WhileKeyword |while|' + #13#10 +
    '  ConditionNode: Identifier |Foo|' + #13#10 +
    '  DoKeywordNode: DoKeyword |do|' + #13#10 +
    '  StatementNode: Identifier |Bar|', RTWhileStatement));
end;

initialization
  RegisterTest(TTestWhileStatement.Suite);
{$ENDIF}
end.
