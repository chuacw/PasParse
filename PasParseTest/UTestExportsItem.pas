unit UTestExportsItem;

interface

uses
  UTest;

type
  TTestExportsItem = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestExportsItem;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestExportsItem }
{$IF NOT DEFINED(DUNIT)}
class function TTestExportsItem.GetName: string;
begin
  Result := 'ExportsItem';
end;

class procedure TTestExportsItem.TestAll;
begin
  OK('Foo', TTestParser.ParsesAs('Foo',
    'ExportsItemNode' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  SpecifierListNode: ListNode', RTExportsItem));

  OK('Foo.Bar', TTestParser.ParsesAs('Foo.Bar',
    'ExportsItemNode' + #13#10 +
    '  NameNode: BinaryOperationNode' + #13#10 +
    '    LeftNode: Identifier |Foo|' + #13#10 +
    '    OperatorNode: Dot |.|' + #13#10 +
    '    RightNode: Identifier |Bar|' + #13#10 +
    '  SpecifierListNode: ListNode', RTExportsItem));

  OK('Foo index 42', TTestParser.ParsesAs('Foo index 42',
    'ExportsItemNode' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  SpecifierListNode: ListNode' + #13#10 +
    '    Items[0]: ExportsSpecifierNode' + #13#10 +
    '      KeywordNode: IndexSemikeyword |index|' + #13#10 +
    '      ValueNode: Number |42|', RTExportsItem));

  OK('Foo name ''Foo''', TTestParser.ParsesAs('Foo name ''Foo''',
    'ExportsItemNode' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  SpecifierListNode: ListNode' + #13#10 +
    '    Items[0]: ExportsSpecifierNode' + #13#10 +
    '      KeywordNode: NameSemikeyword |name|' + #13#10 +
    '      ValueNode: StringLiteral |''Foo''|', RTExportsItem));

  OK('Foo index 42 name ''Foo''',
    TTestParser.ParsesAs('Foo index 42 name ''Foo''',
    'ExportsItemNode' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  SpecifierListNode: ListNode' + #13#10 +
    '    Items[0]: ExportsSpecifierNode' + #13#10 +
    '      KeywordNode: IndexSemikeyword |index|' + #13#10 +
    '      ValueNode: Number |42|' + #13#10 +
    '    Items[1]: ExportsSpecifierNode' + #13#10 +
    '      KeywordNode: NameSemikeyword |name|' + #13#10 +
    '      ValueNode: StringLiteral |''Foo''|', RTExportsItem));

  OK('Foo name ''Foo'' index 42',
    TTestParser.ParsesAs('Foo name ''Foo'' index 42',
    'ExportsItemNode' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  SpecifierListNode: ListNode' + #13#10 +
    '    Items[0]: ExportsSpecifierNode' + #13#10 +
    '      KeywordNode: NameSemikeyword |name|' + #13#10 +
    '      ValueNode: StringLiteral |''Foo''|' + #13#10 +
    '    Items[1]: ExportsSpecifierNode' + #13#10 +
    '      KeywordNode: IndexSemikeyword |index|' + #13#10 +
    '      ValueNode: Number |42|', RTExportsItem));

end;
{$ELSE}

procedure TTestExportsItem.TestExportsItem;
begin
  OK('Foo', TTestParser.ParsesAs('Foo',
    'ExportsItemNode' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  SpecifierListNode: (none)', RTExportsItem));

  OK('Foo.Bar', TTestParser.ParsesAs('Foo.Bar',
    'ExportsItemNode' + #13#10 +
    '  NameNode: BinaryOperationNode' + #13#10 +
    '    LeftNode: Identifier |Foo|' + #13#10 +
    '    OperatorNode: Dot |.|' + #13#10 +
    '    RightNode: Identifier |Bar|' + #13#10 +
    '  SpecifierListNode: (none)', RTExportsItem));

  OK('Foo index 42', TTestParser.ParsesAs('Foo index 42',
    'ExportsItemNode' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  SpecifierListNode: ListNode' + #13#10 +
    '    Items[0]: ExportsSpecifierNode' + #13#10 +
    '      KeywordNode: IndexSemikeyword |index|' + #13#10 +
    '      ValueNode: Number |42|', RTExportsItem));

  OK('Foo name ''Foo''', TTestParser.ParsesAs('Foo name ''Foo''',
    'ExportsItemNode' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  SpecifierListNode: ListNode' + #13#10 +
    '    Items[0]: ExportsSpecifierNode' + #13#10 +
    '      KeywordNode: NameSemikeyword |name|' + #13#10 +
    '      ValueNode: StringLiteral |''Foo''|', RTExportsItem));

  OK('Foo index 42 name ''Foo''',
    TTestParser.ParsesAs('Foo index 42 name ''Foo''',
    'ExportsItemNode' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  SpecifierListNode: ListNode' + #13#10 +
    '    Items[0]: ExportsSpecifierNode' + #13#10 +
    '      KeywordNode: IndexSemikeyword |index|' + #13#10 +
    '      ValueNode: Number |42|' + #13#10 +
    '    Items[1]: ExportsSpecifierNode' + #13#10 +
    '      KeywordNode: NameSemikeyword |name|' + #13#10 +
    '      ValueNode: StringLiteral |''Foo''|', RTExportsItem));

  OK('Foo name ''Foo'' index 42',
    TTestParser.ParsesAs('Foo name ''Foo'' index 42',
    'ExportsItemNode' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  SpecifierListNode: ListNode' + #13#10 +
    '    Items[0]: ExportsSpecifierNode' + #13#10 +
    '      KeywordNode: NameSemikeyword |name|' + #13#10 +
    '      ValueNode: StringLiteral |''Foo''|' + #13#10 +
    '    Items[1]: ExportsSpecifierNode' + #13#10 +
    '      KeywordNode: IndexSemikeyword |index|' + #13#10 +
    '      ValueNode: Number |42|', RTExportsItem));

end;

initialization
  RegisterTest(TTestExportsItem.Suite);
{$ENDIF}
end.
