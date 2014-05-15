unit UTestCaseStatement;

interface

uses
  UTest;

type
  TTestCaseStatement = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestCaseStatement;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestCaseStatement }
{$IF NOT DEFINED(DUNIT)}
class function TTestCaseStatement.GetName: string;
begin
  Result := 'CaseStatement';
end;

class procedure TTestCaseStatement.TestAll;
begin
  OK('case Foo of 1: end', TTestParser.ParsesAs('case Foo of 1: end',
    'CaseStatementNode' + #13#10 +
    '  CaseKeywordNode: CaseKeyword |case|' + #13#10 +
    '  ExpressionNode: Identifier |Foo|' + #13#10 +
    '  OfKeywordNode: OfKeyword |of|' + #13#10 +
    '  SelectorListNode: ListNode' + #13#10 +
    '    Items[0]: CaseSelectorNode' + #13#10 +
    '      ValueListNode: ListNode' + #13#10 +
    '        Items[0]: DelimitedItemNode' + #13#10 +
    '          ItemNode: Number |1|' + #13#10 +
    '          DelimiterNode: (none)' + #13#10 +
    '      ColonNode: Colon |:|' + #13#10 +
    '      StatementNode: (none)' + #13#10 +
    '      SemicolonNode: (none)' + #13#10 +
    '  ElseKeywordNode: (none)' + #13#10 +
    '  ElseStatementListNode: ListNode' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTCaseStatement));

  OK('case Foo of 1: else end', TTestParser.ParsesAs('case Foo of 1: else end',
    'CaseStatementNode' + #13#10 +
    '  CaseKeywordNode: CaseKeyword |case|' + #13#10 +
    '  ExpressionNode: Identifier |Foo|' + #13#10 +
    '  OfKeywordNode: OfKeyword |of|' + #13#10 +
    '  SelectorListNode: ListNode' + #13#10 +
    '    Items[0]: CaseSelectorNode' + #13#10 +
    '      ValueListNode: ListNode' + #13#10 +
    '        Items[0]: DelimitedItemNode' + #13#10 +
    '          ItemNode: Number |1|' + #13#10 +
    '          DelimiterNode: (none)' + #13#10 +
    '      ColonNode: Colon |:|' + #13#10 +
    '      StatementNode: (none)' + #13#10 +
    '      SemicolonNode: (none)' + #13#10 +
    '  ElseKeywordNode: ElseKeyword |else|' + #13#10 +
    '  ElseStatementListNode: ListNode' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTCaseStatement));

  OK('case Foo of 1: else Foo; Bar; end',
    TTestParser.ParsesAs('case Foo of 1: else Foo; Bar; end',
    'CaseStatementNode' + #13#10 +
    '  CaseKeywordNode: CaseKeyword |case|' + #13#10 +
    '  ExpressionNode: Identifier |Foo|' + #13#10 +
    '  OfKeywordNode: OfKeyword |of|' + #13#10 +
    '  SelectorListNode: ListNode' + #13#10 +
    '    Items[0]: CaseSelectorNode' + #13#10 +
    '      ValueListNode: ListNode' + #13#10 +
    '        Items[0]: DelimitedItemNode' + #13#10 +
    '          ItemNode: Number |1|' + #13#10 +
    '          DelimiterNode: (none)' + #13#10 +
    '      ColonNode: Colon |:|' + #13#10 +
    '      StatementNode: (none)' + #13#10 +
    '      SemicolonNode: (none)' + #13#10 +
    '  ElseKeywordNode: ElseKeyword |else|' + #13#10 +
    '  ElseStatementListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: Semicolon |;|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Bar|' + #13#10 +
    '      DelimiterNode: Semicolon |;|' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTCaseStatement));
end;
{$ELSE}

procedure TTestCaseStatement.TestCaseStatement;
begin
  OK('case Foo of 1: end', TTestParser.ParsesAs('case Foo of 1: end',
    'CaseStatementNode' + #13#10 +
    '  CaseKeywordNode: CaseKeyword |case|' + #13#10 +
    '  ExpressionNode: Identifier |Foo|' + #13#10 +
    '  OfKeywordNode: OfKeyword |of|' + #13#10 +
    '  SelectorListNode: ListNode' + #13#10 +
    '    Items[0]: CaseSelectorNode' + #13#10 +
    '      ValueListNode: ListNode' + #13#10 +
    '        Items[0]: DelimitedItemNode' + #13#10 +
    '          ItemNode: Number |1|' + #13#10 +
    '          DelimiterNode: (none)' + #13#10 +
    '      ColonNode: Colon |:|' + #13#10 +
    '      StatementNode: (none)' + #13#10 +
    '      SemicolonNode: (none)' + #13#10 +
    '  ElseKeywordNode: (none)' + #13#10 +
    '  ElseStatementListNode: (none)' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTCaseStatement));

  OK('case Foo of 1: else end', TTestParser.ParsesAs('case Foo of 1: else end',
    'CaseStatementNode'+ #13#10 +
    '  CaseKeywordNode: CaseKeyword |case|'+ #13#10 +
    '  ExpressionNode: Identifier |Foo|'+ #13#10 +
    '  OfKeywordNode: OfKeyword |of|'+ #13#10 +
    '  SelectorListNode: ListNode'+ #13#10 +
    '    Items[0]: CaseSelectorNode'+ #13#10 +
    '      ValueListNode: ListNode'+ #13#10 +
    '        Items[0]: DelimitedItemNode'+ #13#10 +
    '          ItemNode: Number |1|'+ #13#10 +
    '          DelimiterNode: (none)'+ #13#10 +
    '      ColonNode: Colon |:|'+ #13#10 +
    '      StatementNode: (none)'+ #13#10 +
    '      SemicolonNode: (none)'+ #13#10 +
    '  ElseKeywordNode: ElseKeyword |else|'+ #13#10 +
    '  ElseStatementListNode: (none)'+ #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTCaseStatement));

  OK('case Foo of 1: else Foo; Bar; end',
    TTestParser.ParsesAs('case Foo of 1: else Foo; Bar; end',
    'CaseStatementNode' + #13#10 +
    '  CaseKeywordNode: CaseKeyword |case|' + #13#10 +
    '  ExpressionNode: Identifier |Foo|' + #13#10 +
    '  OfKeywordNode: OfKeyword |of|' + #13#10 +
    '  SelectorListNode: ListNode' + #13#10 +
    '    Items[0]: CaseSelectorNode' + #13#10 +
    '      ValueListNode: ListNode' + #13#10 +
    '        Items[0]: DelimitedItemNode' + #13#10 +
    '          ItemNode: Number |1|' + #13#10 +
    '          DelimiterNode: (none)' + #13#10 +
    '      ColonNode: Colon |:|' + #13#10 +
    '      StatementNode: (none)' + #13#10 +
    '      SemicolonNode: (none)' + #13#10 +
    '  ElseKeywordNode: ElseKeyword |else|' + #13#10 +
    '  ElseStatementListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: Semicolon |;|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Bar|' + #13#10 +
    '      DelimiterNode: Semicolon |;|' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTCaseStatement));
end;

initialization
  RegisterTest(TTestCaseStatement.Suite);
{$ENDIF}
end.
