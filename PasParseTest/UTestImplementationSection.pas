unit UTestImplementationSection;

interface

uses
  UTest;

type
  TTestImplementationSection = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestEmptyImplementationSection;
    procedure TestSingleUsesClause;
    procedure TestConstSection;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestImplementationSection }
{$IF NOT DEFINED(DUNIT)}
class function TTestImplementationSection.GetName: string;
begin
  Result := 'ImplementationSection';
end;

class procedure TTestImplementationSection.TestAll;
begin
  OK('implementation', TTestParser.ParsesAs('implementation',
    'UnitSectionNode' + #13#10 +
    '  HeaderKeywordNode: ImplementationKeyword |implementation|' + #13#10 +
    '  UsesClauseNode: (none)' + #13#10 +
    '  ContentListNode: ListNode', RTImplementationSection));

  OK('implementation uses Foo;', TTestParser.ParsesAs('implementation uses Foo;',
    'UnitSectionNode' + #13#10 +
    '  HeaderKeywordNode: ImplementationKeyword |implementation|' + #13#10 +
    '  UsesClauseNode: UsesClauseNode' + #13#10 +
    '    UsesKeywordNode: UsesKeyword |uses|' + #13#10 +
    '    UnitListNode: ListNode' + #13#10 +
    '      Items[0]: DelimitedItemNode' + #13#10 +
    '        ItemNode: UsedUnitNode' + #13#10 +
    '          NameNode: Identifier |Foo|' + #13#10 +
    '          InKeywordNode: (none)' + #13#10 +
    '          FileNameNode: (none)' + #13#10 +
    '        DelimiterNode: (none)' + #13#10 +
    '    SemicolonNode: Semicolon |;|' + #13#10 +
    '  ContentListNode: ListNode', RTImplementationSection));

  OK('implementation const Foo = 42;', 
    TTestParser.ParsesAs('implementation const Foo = 42;',
    'UnitSectionNode' + #13#10 +
    '  HeaderKeywordNode: ImplementationKeyword |implementation|' + #13#10 +
    '  UsesClauseNode: (none)' + #13#10 +
    '  ContentListNode: ListNode' + #13#10 +
    '    Items[0]: ConstSectionNode' + #13#10 +
    '      ConstKeywordNode: ConstKeyword |const|' + #13#10 +
    '      ConstListNode: ListNode' + #13#10 +
    '        Items[0]: ConstantDeclNode' + #13#10 +
    '          NameNode: Identifier |Foo|' + #13#10 +
    '          ColonNode: (none)' + #13#10 +
    '          TypeNode: (none)' + #13#10 +
    '          EqualSignNode: EqualSign |=|' + #13#10 +
    '          ValueNode: Number |42|' + #13#10 +
    '          PortabilityDirectiveListNode: ListNode' + #13#10 +
    '          SemicolonNode: Semicolon |;|', RTImplementationSection));
end;
{$ELSE}

procedure TTestImplementationSection.TestEmptyImplementationSection;
begin
  OK('implementation', TTestParser.ParsesAs('implementation',
    'UnitSectionNode' + #13#10 +
    '  HeaderKeywordNode: ImplementationKeyword |implementation|' + #13#10 +
    '  UsesClauseNode: (none)' + #13#10 +
    '  ContentListNode: (none)', RTImplementationSection));
end;

procedure TTestImplementationSection.TestSingleUsesClause;
begin
  OK('implementation uses Foo;', TTestParser.ParsesAs('implementation uses Foo;',
    'UnitSectionNode' + #13#10 +
    '  HeaderKeywordNode: ImplementationKeyword |implementation|' + #13#10 +
    '  UsesClauseNode: UsesClauseNode' + #13#10 +
    '    UsesKeywordNode: UsesKeyword |uses|' + #13#10 +
    '    UnitListNode: ListNode' + #13#10 +
    '      Items[0]: DelimitedItemNode' + #13#10 +
    '        ItemNode: UsedUnitNode' + #13#10 +
    '          NameNode: Identifier |Foo|' + #13#10 +
    '          InKeywordNode: (none)' + #13#10 +
    '          FileNameNode: (none)' + #13#10 +
    '        DelimiterNode: (none)' + #13#10 +
    '    SemicolonNode: Semicolon |;|' + #13#10 +
    '  ContentListNode: (none)', RTImplementationSection));
end;

procedure TTestImplementationSection.TestConstSection;
begin
  OK('implementation const Foo = 42;',
    TTestParser.ParsesAs('implementation const Foo = 42;',
    'UnitSectionNode' + #13#10 +
    '  HeaderKeywordNode: ImplementationKeyword |implementation|' + #13#10 +
    '  UsesClauseNode: (none)' + #13#10 +
    '  ContentListNode: ListNode' + #13#10 +
    '    Items[0]: ConstSectionNode' + #13#10 +
    '      ConstKeywordNode: ConstKeyword |const|' + #13#10 +
    '      ConstListNode: ListNode' + #13#10 +
    '        Items[0]: ConstantDeclNode' + #13#10 +
    '          NameNode: Identifier |Foo|' + #13#10 +
    '          ColonNode: (none)' + #13#10 +
    '          TypeNode: (none)' + #13#10 +
    '          EqualSignNode: EqualSign |=|' + #13#10 +
    '          ValueNode: Number |42|' + #13#10 +
    '          PortabilityDirectiveListNode: (none)' + #13#10 +
    '          SemicolonNode: Semicolon |;|', RTImplementationSection));
end;

initialization
  RegisterTest(TTestImplementationSection.Suite);
{$ENDIF}
end.
