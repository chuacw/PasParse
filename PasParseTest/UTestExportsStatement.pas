unit UTestExportsStatement;

interface

uses
  UTest;

type
  TTestExportsStatement = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestExportsStatement;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestExportsStatement }
{$IF NOT DEFINED(DUNIT)}
class function TTestExportsStatement.GetName: string;
begin
  Result := 'ExportsStatement';
end;

class procedure TTestExportsStatement.TestAll;
begin
  OK('exports Foo;', TTestParser.ParsesAs('exports Foo;',
    'ExportsStatementNode' + #13#10 +
    '  ExportsKeywordNode: ExportsKeyword |exports|' + #13#10 +
    '  ItemListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: ExportsItemNode' + #13#10 +
    '        NameNode: Identifier |Foo|' + #13#10 +
    '        SpecifierListNode: ListNode' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTExportsStatement));

  OK('exports Foo index 42, Bar name ''Baz'';', 
    TTestParser.ParsesAs('exports Foo index 42, Bar name ''Baz'';',
    'ExportsStatementNode' + #13#10 +
    '  ExportsKeywordNode: ExportsKeyword |exports|' + #13#10 +
    '  ItemListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: ExportsItemNode' + #13#10 +
    '        NameNode: Identifier |Foo|' + #13#10 +
    '        SpecifierListNode: ListNode' + #13#10 +
    '          Items[0]: ExportsSpecifierNode' + #13#10 +
    '            KeywordNode: IndexSemikeyword |index|' + #13#10 +
    '            ValueNode: Number |42|' + #13#10 +
    '      DelimiterNode: Comma |,|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: ExportsItemNode' + #13#10 +
    '        NameNode: Identifier |Bar|' + #13#10 +
    '        SpecifierListNode: ListNode' + #13#10 +
    '          Items[0]: ExportsSpecifierNode' + #13#10 +
    '            KeywordNode: NameSemikeyword |name|' + #13#10 +
    '            ValueNode: StringLiteral |''Baz''|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTExportsStatement));
end;
{$ELSE}

procedure TTestExportsStatement.TestExportsStatement;
begin
  OK('exports Foo;', TTestParser.ParsesAs('exports Foo;',
    'ExportsStatementNode' + #13#10 +
    '  ExportsKeywordNode: ExportsKeyword |exports|' + #13#10 +
    '  ItemListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: ExportsItemNode' + #13#10 +
    '        NameNode: Identifier |Foo|' + #13#10 +
    '        SpecifierListNode: (none)' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTExportsStatement));

  OK('exports Foo index 42, Bar name ''Baz'';',
    TTestParser.ParsesAs('exports Foo index 42, Bar name ''Baz'';',
    'ExportsStatementNode' + #13#10 +
    '  ExportsKeywordNode: ExportsKeyword |exports|' + #13#10 +
    '  ItemListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: ExportsItemNode' + #13#10 +
    '        NameNode: Identifier |Foo|' + #13#10 +
    '        SpecifierListNode: ListNode' + #13#10 +
    '          Items[0]: ExportsSpecifierNode' + #13#10 +
    '            KeywordNode: IndexSemikeyword |index|' + #13#10 +
    '            ValueNode: Number |42|' + #13#10 +
    '      DelimiterNode: Comma |,|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: ExportsItemNode' + #13#10 +
    '        NameNode: Identifier |Bar|' + #13#10 +
    '        SpecifierListNode: ListNode' + #13#10 +
    '          Items[0]: ExportsSpecifierNode' + #13#10 +
    '            KeywordNode: NameSemikeyword |name|' + #13#10 +
    '            ValueNode: StringLiteral |''Baz''|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTExportsStatement));
end;

initialization
  RegisterTest(TTestExportsStatement.Suite);
{$ENDIF}
end.
