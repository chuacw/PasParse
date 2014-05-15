unit UTestRepeatStatement;

interface

uses
  UTest;

type
  TTestRepeatStatement = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestRepeatStatement;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestRepeatStatement }
{$IF NOT DEFINED(DUNIT)}
class function TTestRepeatStatement.GetName: string;
begin
  Result := 'RepeatStatement';
end;

class procedure TTestRepeatStatement.TestAll;
begin
  OK('repeat until Doomsday', TTestParser.ParsesAs('repeat until Doomsday',
    'RepeatStatementNode' + #13#10 +
    '  RepeatKeywordNode: RepeatKeyword |repeat|' + #13#10 +
    '  StatementListNode: ListNode' + #13#10 +
    '  UntilKeywordNode: UntilKeyword |until|' + #13#10 +
    '  ConditionNode: Identifier |Doomsday|', RTRepeatStatement));

  OK('repeat Foo; Bar; until Doomsday',
    TTestParser.ParsesAs('repeat Foo; Bar; until Doomsday',
    'RepeatStatementNode' + #13#10 +
    '  RepeatKeywordNode: RepeatKeyword |repeat|' + #13#10 +
    '  StatementListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: Semicolon |;|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Bar|' + #13#10 +
    '      DelimiterNode: Semicolon |;|' + #13#10 +
    '  UntilKeywordNode: UntilKeyword |until|' + #13#10 +
    '  ConditionNode: Identifier |Doomsday|', RTRepeatStatement));
end;
{$ELSE}

procedure TTestRepeatStatement.TestRepeatStatement;
begin
  OK('repeat until Doomsday', TTestParser.ParsesAs('repeat until Doomsday',
    'RepeatStatementNode' + #13#10 +
    '  RepeatKeywordNode: RepeatKeyword |repeat|' + #13#10 +
    '  StatementListNode: (none)' + #13#10 +
    '  UntilKeywordNode: UntilKeyword |until|' + #13#10 +
    '  ConditionNode: Identifier |Doomsday|', RTRepeatStatement));

  OK('repeat Foo; Bar; until Doomsday',
    TTestParser.ParsesAs('repeat Foo; Bar; until Doomsday',
    'RepeatStatementNode' + #13#10 +
    '  RepeatKeywordNode: RepeatKeyword |repeat|' + #13#10 +
    '  StatementListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: Semicolon |;|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Bar|' + #13#10 +
    '      DelimiterNode: Semicolon |;|' + #13#10 +
    '  UntilKeywordNode: UntilKeyword |until|' + #13#10 +
    '  ConditionNode: Identifier |Doomsday|', RTRepeatStatement));
end;

initialization
  RegisterTest(TTestRepeatStatement.Suite);
{$ENDIF}
end.
