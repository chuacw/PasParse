unit UTestInterfaceSection;

interface

uses
  UTest;

type
  TTestInterfaceSection = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestInterfaceSection;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestInterfaceSection }
{$IF NOT DEFINED(DUNIT)}
class function TTestInterfaceSection.GetName: string;
begin
  Result := 'InterfaceSection';
end;

class procedure TTestInterfaceSection.TestAll;
begin
  OK('interface', TTestParser.ParsesAs('interface',
    'UnitSectionNode' + #13#10 +
    '  HeaderKeywordNode: InterfaceKeyword |interface|' + #13#10 +
    '  UsesClauseNode: (none)' + #13#10 +
    '  ContentListNode: ListNode', RTInterfaceSection));

  OK('interface uses Foo;', TTestParser.ParsesAs('interface uses Foo;',
    'UnitSectionNode' + #13#10 +
    '  HeaderKeywordNode: InterfaceKeyword |interface|' + #13#10 +
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
    '  ContentListNode: ListNode', RTInterfaceSection));

  OK('interface resourcestring Foo = ''Bar'';', 
    TTestParser.ParsesAs('interface resourcestring Foo = ''Bar'';',
    'UnitSectionNode' + #13#10 +
    '  HeaderKeywordNode: InterfaceKeyword |interface|' + #13#10 +
    '  UsesClauseNode: (none)' + #13#10 +
    '  ContentListNode: ListNode' + #13#10 +
    '    Items[0]: ConstSectionNode' + #13#10 +
    '      ConstKeywordNode: ResourceStringKeyword |resourcestring|' + #13#10 +
    '      ConstListNode: ListNode' + #13#10 +
    '        Items[0]: ConstantDeclNode' + #13#10 +
    '          NameNode: Identifier |Foo|' + #13#10 +
    '          ColonNode: (none)' + #13#10 +
    '          TypeNode: (none)' + #13#10 +
    '          EqualSignNode: EqualSign |=|' + #13#10 +
    '          ValueNode: StringLiteral |''Bar''|' + #13#10 +
    '          PortabilityDirectiveListNode: ListNode' + #13#10 +
    '          SemicolonNode: Semicolon |;|', RTInterfaceSection));
end;
{$ELSE}

procedure TTestInterfaceSection.TestInterfaceSection;
begin
  OK('interface', TTestParser.ParsesAs('interface',
    'UnitSectionNode' + #13#10 +
    '  HeaderKeywordNode: InterfaceKeyword |interface|' + #13#10 +
    '  UsesClauseNode: (none)' + #13#10 +
    '  ContentListNode: (none)', RTInterfaceSection));

  OK('interface uses Foo;', TTestParser.ParsesAs('interface uses Foo;',
    'UnitSectionNode' + #13#10 +
    '  HeaderKeywordNode: InterfaceKeyword |interface|' + #13#10 +
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
    '  ContentListNode: (none)', RTInterfaceSection));

  OK('interface resourcestring Foo = ''Bar'';',
    TTestParser.ParsesAs('interface resourcestring Foo = ''Bar'';',
    'UnitSectionNode' + #13#10 +
    '  HeaderKeywordNode: InterfaceKeyword |interface|' + #13#10 +
    '  UsesClauseNode: (none)' + #13#10 +
    '  ContentListNode: ListNode' + #13#10 +
    '    Items[0]: ConstSectionNode' + #13#10 +
    '      ConstKeywordNode: ResourceStringKeyword |resourcestring|' + #13#10 +
    '      ConstListNode: ListNode' + #13#10 +
    '        Items[0]: ConstantDeclNode' + #13#10 +
    '          NameNode: Identifier |Foo|' + #13#10 +
    '          ColonNode: (none)' + #13#10 +
    '          TypeNode: (none)' + #13#10 +
    '          EqualSignNode: EqualSign |=|' + #13#10 +
    '          ValueNode: StringLiteral |''Bar''|' + #13#10 +
    '          PortabilityDirectiveListNode: (none)' + #13#10 +
    '          SemicolonNode: Semicolon |;|', RTInterfaceSection));
end;

initialization
  RegisterTest(TTestInterfaceSection.Suite);
{$ENDIF}
end.
