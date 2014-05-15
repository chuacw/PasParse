unit UTestWithStatement;

interface

uses
  UTest;

type
  TTestWithStatement = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestWithStatement;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestWithStatement }
{$IF NOT DEFINED(DUNIT)}
class function TTestWithStatement.GetName: string;
begin
  Result := 'WithStatement';
end;

class procedure TTestWithStatement.TestAll;
begin
  OK('with Foo do', TTestParser.ParsesAs('with Foo do',
    'WithStatementNode' + #13#10 +
    '  WithKeywordNode: WithKeyword |with|' + #13#10 +
    '  ExpressionListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  DoKeywordNode: DoKeyword |do|' + #13#10 +
    '  StatementNode: (none)', RTWithStatement));

  OK('with Foo do Bar', TTestParser.ParsesAs('with Foo do Bar',
    'WithStatementNode' + #13#10 +
    '  WithKeywordNode: WithKeyword |with|' + #13#10 +
    '  ExpressionListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  DoKeywordNode: DoKeyword |do|' + #13#10 +
    '  StatementNode: Identifier |Bar|', RTWithStatement));
end;
{$ELSE}

procedure TTestWithStatement.TestWithStatement;
begin
  OK('with Foo do', TTestParser.ParsesAs('with Foo do',
    'WithStatementNode' + #13#10 +
    '  WithKeywordNode: WithKeyword |with|' + #13#10 +
    '  ExpressionListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  DoKeywordNode: DoKeyword |do|' + #13#10 +
    '  StatementNode: (none)', RTWithStatement));

  OK('with Foo do Bar', TTestParser.ParsesAs('with Foo do Bar',
    'WithStatementNode' + #13#10 +
    '  WithKeywordNode: WithKeyword |with|' + #13#10 +
    '  ExpressionListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  DoKeywordNode: DoKeyword |do|' + #13#10 +
    '  StatementNode: Identifier |Bar|', RTWithStatement));
end;

initialization
  RegisterTest(TTestWithStatement.Suite);
{$ENDIF}
end.
