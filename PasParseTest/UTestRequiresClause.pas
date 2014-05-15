unit UTestRequiresClause;

interface

uses
  UTest;

type
  TTestRequiresClause = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestRequiresClause;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestRequiresClause }
{$IF NOT DEFINED(DUNIT)}
class function TTestRequiresClause.GetName: string;
begin
  Result := 'RequiresClause';
end;

class procedure TTestRequiresClause.TestAll;
begin
  OK('requires Foo;', TTestParser.ParsesAs('requires Foo;',
    'RequiresClauseNode' + #13#10 +  
    '  RequiresSemikeywordNode: RequiresSemikeyword |requires|' + #13#10 +
    '  PackageListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTRequiresClause));

  OK('requires Foo, Bar;', TTestParser.ParsesAs('requires Foo, Bar;',
    'RequiresClauseNode' + #13#10 +
    '  RequiresSemikeywordNode: RequiresSemikeyword |requires|' + #13#10 +
    '  PackageListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: Comma |,|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Bar|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTRequiresClause));

  OK('requires Foo.Bar;', TTestParser.ParsesAs('requires Foo.Bar;',
    'RequiresClauseNode' + #13#10 +
    '  RequiresSemikeywordNode: RequiresSemikeyword |requires|' + #13#10 +
    '  PackageListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: BinaryOperationNode' + #13#10 +
    '        LeftNode: Identifier |Foo|' + #13#10 +
    '        OperatorNode: Dot |.|' + #13#10 +
    '        RightNode: Identifier |Bar|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTRequiresClause));
end;
{$ELSE}

procedure TTestRequiresClause.TestRequiresClause;
begin
  OK('requires Foo;', TTestParser.ParsesAs('requires Foo;',
    'RequiresClauseNode' + #13#10 +
    '  RequiresSemikeywordNode: RequiresSemikeyword |requires|' + #13#10 +
    '  PackageListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTRequiresClause));

  OK('requires Foo, Bar;', TTestParser.ParsesAs('requires Foo, Bar;',
    'RequiresClauseNode' + #13#10 +
    '  RequiresSemikeywordNode: RequiresSemikeyword |requires|' + #13#10 +
    '  PackageListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: Comma |,|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Bar|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTRequiresClause));

  OK('requires Foo.Bar;', TTestParser.ParsesAs('requires Foo.Bar;',
    'RequiresClauseNode' + #13#10 +
    '  RequiresSemikeywordNode: RequiresSemikeyword |requires|' + #13#10 +
    '  PackageListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: BinaryOperationNode' + #13#10 +
    '        LeftNode: Identifier |Foo|' + #13#10 +
    '        OperatorNode: Dot |.|' + #13#10 +
    '        RightNode: Identifier |Bar|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTRequiresClause));
end;

initialization
  RegisterTest(TTestRequiresClause.Suite);
{$ENDIF}
end.
