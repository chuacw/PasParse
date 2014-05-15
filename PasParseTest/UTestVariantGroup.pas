unit UTestVariantGroup;

interface

uses
  UTest;

type
  TTestVariantGroup = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure Test1ColonEmptyVariant;
    procedure Test1ColonEmptyVariantSemicolon;
    procedure TestFooBarCommanFooBazColonEmptyVariant;
    procedure Test1ColonFooColonInteger;
    procedure Test1ColonFooIntegerVariant;
    procedure Test1ColonFooColonIntegerBarColonBoolean;
    procedure Test1ColonFooColonIntegerCaseByteOf1ColonEmptyVariant;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestVariantGroup }
{$IF NOT DEFINED(DUNIT)}
class function TTestVariantGroup.GetName: string;
begin
  Result := 'VariantGroup';
end;

class procedure TTestVariantGroup.TestAll;
begin
  OK('1: ()', TTestParser.ParsesAs('1: ()',
    'VariantGroupNode' + #13#10 +
    '  ValueListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Number |1|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '  FieldDeclListNode: ListNode' + #13#10 +
    '  VariantSectionNode: (none)' + #13#10 +
    '  CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '  SemicolonNode: (none)', RTVariantGroup));

  OK('1: ();', TTestParser.ParsesAs('1: ();',
    'VariantGroupNode' + #13#10 +
    '  ValueListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Number |1|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '  FieldDeclListNode: ListNode' + #13#10 +
    '  VariantSectionNode: (none)' + #13#10 +
    '  CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTVariantGroup));

  OK('fooBar, fooBaz: ()', TTestParser.ParsesAs('fooBar, fooBaz: ()',
    'VariantGroupNode' + #13#10 +
    '  ValueListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |fooBar|' + #13#10 +
    '      DelimiterNode: Comma |,|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |fooBaz|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '  FieldDeclListNode: ListNode' + #13#10 +
    '  VariantSectionNode: (none)' + #13#10 +
    '  CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '  SemicolonNode: (none)', RTVariantGroup));

  OK('1: (Foo: Integer)', TTestParser.ParsesAs('1: (Foo: Integer)',
    'VariantGroupNode' + #13#10 +
    '  ValueListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Number |1|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '  FieldDeclListNode: ListNode' + #13#10 +
    '    Items[0]: FieldDeclNode' + #13#10 +
    '      NameListNode: ListNode' + #13#10 +
    '        Items[0]: DelimitedItemNode' + #13#10 +
    '          ItemNode: Identifier |Foo|' + #13#10 +
    '          DelimiterNode: (none)' + #13#10 +
    '      ColonNode: Colon |:|' + #13#10 +
    '      TypeNode: Identifier |Integer|' + #13#10 +
    '      PortabilityDirectiveListNode: ListNode' + #13#10 +
    '      SemicolonNode: (none)' + #13#10 +
    '  VariantSectionNode: (none)' + #13#10 +
    '  CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '  SemicolonNode: (none)', RTVariantGroup));

  OK('1: (Foo: Integer;)', TTestParser.ParsesAs('1: (Foo: Integer;)',
    'VariantGroupNode' + #13#10 +
    '  ValueListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Number |1|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '  FieldDeclListNode: ListNode' + #13#10 +
    '    Items[0]: FieldDeclNode' + #13#10 +
    '      NameListNode: ListNode' + #13#10 +
    '        Items[0]: DelimitedItemNode' + #13#10 +
    '          ItemNode: Identifier |Foo|' + #13#10 +
    '          DelimiterNode: (none)' + #13#10 +
    '      ColonNode: Colon |:|' + #13#10 +
    '      TypeNode: Identifier |Integer|' + #13#10 +
    '      PortabilityDirectiveListNode: ListNode' + #13#10 +
    '      SemicolonNode: Semicolon |;|' + #13#10 +
    '  VariantSectionNode: (none)' + #13#10 +
    '  CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '  SemicolonNode: (none)', RTVariantGroup));

  OK('1: (Foo: Integer; Bar: Boolean;)',
    TTestParser.ParsesAs('1: (Foo: Integer; Bar: Boolean;)',
    'VariantGroupNode' + #13#10 +
    '  ValueListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Number |1|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '  FieldDeclListNode: ListNode' + #13#10 +
    '    Items[0]: FieldDeclNode' + #13#10 +
    '      NameListNode: ListNode' + #13#10 +
    '        Items[0]: DelimitedItemNode' + #13#10 +
    '          ItemNode: Identifier |Foo|' + #13#10 +
    '          DelimiterNode: (none)' + #13#10 +
    '      ColonNode: Colon |:|' + #13#10 +
    '      TypeNode: Identifier |Integer|' + #13#10 +
    '      PortabilityDirectiveListNode: ListNode' + #13#10 +
    '      SemicolonNode: Semicolon |;|' + #13#10 +
    '    Items[1]: FieldDeclNode' + #13#10 +
    '      NameListNode: ListNode' + #13#10 +
    '        Items[0]: DelimitedItemNode' + #13#10 +
    '          ItemNode: Identifier |Bar|' + #13#10 +
    '          DelimiterNode: (none)' + #13#10 +
    '      ColonNode: Colon |:|' + #13#10 +
    '      TypeNode: Identifier |Boolean|' + #13#10 +
    '      PortabilityDirectiveListNode: ListNode' + #13#10 +
    '      SemicolonNode: Semicolon |;|' + #13#10 +
    '  VariantSectionNode: (none)' + #13#10 +
    '  CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '  SemicolonNode: (none)', RTVariantGroup));

  OK('1: (Foo: Integer; case Byte of 1: ())',
    TTestParser.ParsesAs('1: (Foo: Integer; case Byte of 1: ())',
    'VariantGroupNode' + #13#10 +
    '  ValueListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Number |1|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '  FieldDeclListNode: ListNode' + #13#10 +
    '    Items[0]: FieldDeclNode' + #13#10 +
    '      NameListNode: ListNode' + #13#10 +
    '        Items[0]: DelimitedItemNode' + #13#10 +
    '          ItemNode: Identifier |Foo|' + #13#10 +
    '          DelimiterNode: (none)' + #13#10 +
    '      ColonNode: Colon |:|' + #13#10 +
    '      TypeNode: Identifier |Integer|' + #13#10 +
    '      PortabilityDirectiveListNode: ListNode' + #13#10 +
    '      SemicolonNode: Semicolon |;|' + #13#10 +
    '  VariantSectionNode: VariantSectionNode' + #13#10 +
    '    CaseKeywordNode: CaseKeyword |case|' + #13#10 +
    '    NameNode: (none)' + #13#10 +
    '    ColonNode: (none)' + #13#10 +
    '    TypeNode: Identifier |Byte|' + #13#10 +
    '    OfKeywordNode: OfKeyword |of|' + #13#10 +
    '    VariantGroupListNode: ListNode' + #13#10 +
    '      Items[0]: VariantGroupNode' + #13#10 +
    '        ValueListNode: ListNode' + #13#10 +
    '          Items[0]: DelimitedItemNode' + #13#10 +
    '            ItemNode: Number |1|' + #13#10 +
    '            DelimiterNode: (none)' + #13#10 +
    '        ColonNode: Colon |:|' + #13#10 +
    '        OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '        FieldDeclListNode: ListNode' + #13#10 +
    '        VariantSectionNode: (none)' + #13#10 +
    '        CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '        SemicolonNode: (none)' + #13#10 +
    '  CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '  SemicolonNode: (none)', RTVariantGroup));
end;
{$ELSE}

procedure TTestVariantGroup.Test1ColonEmptyVariant;
begin
  OK('1: ()', TTestParser.ParsesAs('1: ()',
    'VariantGroupNode' + #13#10 +
    '  ValueListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Number |1|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '  FieldDeclListNode: (none)' + #13#10 +
    '  VariantSectionNode: (none)' + #13#10 +
    '  CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '  SemicolonNode: (none)', RTVariantGroup));
end;

procedure TTestVariantGroup.Test1ColonEmptyVariantSemicolon;
begin
  OK('1: ();', TTestParser.ParsesAs('1: ();',
    'VariantGroupNode' + #13#10 +
    '  ValueListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Number |1|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '  FieldDeclListNode: (none)' + #13#10 +
    '  VariantSectionNode: (none)' + #13#10 +
    '  CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTVariantGroup));
end;

procedure TTestVariantGroup.TestFooBarCommanFooBazColonEmptyVariant;
begin
  OK('fooBar, fooBaz: ()', TTestParser.ParsesAs('fooBar, fooBaz: ()',
    'VariantGroupNode' + #13#10 +
    '  ValueListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |fooBar|' + #13#10 +
    '      DelimiterNode: Comma |,|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |fooBaz|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '  FieldDeclListNode: (none)' + #13#10 +
    '  VariantSectionNode: (none)' + #13#10 +
    '  CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '  SemicolonNode: (none)', RTVariantGroup));
end;

procedure TTestVariantGroup.Test1ColonFooColonInteger;
begin
  OK('1: (Foo: Integer)', TTestParser.ParsesAs('1: (Foo: Integer)',
    'VariantGroupNode' + #13#10 +
    '  ValueListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Number |1|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '  FieldDeclListNode: ListNode' + #13#10 +
    '    Items[0]: FieldDeclNode' + #13#10 +
    '      NameListNode: ListNode' + #13#10 +
    '        Items[0]: DelimitedItemNode' + #13#10 +
    '          ItemNode: Identifier |Foo|' + #13#10 +
    '          DelimiterNode: (none)' + #13#10 +
    '      ColonNode: Colon |:|' + #13#10 +
    '      TypeNode: Identifier |Integer|' + #13#10 +
    '      PortabilityDirectiveListNode: (none)' + #13#10 +
    '      SemicolonNode: (none)' + #13#10 +
    '  VariantSectionNode: (none)' + #13#10 +
    '  CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '  SemicolonNode: (none)', RTVariantGroup));
end;

procedure TTestVariantGroup.Test1ColonFooIntegerVariant;
begin
  OK('1: (Foo: Integer;)', TTestParser.ParsesAs('1: (Foo: Integer;)',
    'VariantGroupNode' + #13#10 +
    '  ValueListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Number |1|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '  FieldDeclListNode: ListNode' + #13#10 +
    '    Items[0]: FieldDeclNode' + #13#10 +
    '      NameListNode: ListNode' + #13#10 +
    '        Items[0]: DelimitedItemNode' + #13#10 +
    '          ItemNode: Identifier |Foo|' + #13#10 +
    '          DelimiterNode: (none)' + #13#10 +
    '      ColonNode: Colon |:|' + #13#10 +
    '      TypeNode: Identifier |Integer|' + #13#10 +
    '      PortabilityDirectiveListNode: (none)' + #13#10 +
    '      SemicolonNode: Semicolon |;|' + #13#10 +
    '  VariantSectionNode: (none)' + #13#10 +
    '  CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '  SemicolonNode: (none)', RTVariantGroup));
end;

procedure TTestVariantGroup.Test1ColonFooColonIntegerBarColonBoolean;
begin
  OK('1: (Foo: Integer; Bar: Boolean;)',
    TTestParser.ParsesAs('1: (Foo: Integer; Bar: Boolean;)',
    'VariantGroupNode' + #13#10 +
    '  ValueListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Number |1|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '  FieldDeclListNode: ListNode' + #13#10 +
    '    Items[0]: FieldDeclNode' + #13#10 +
    '      NameListNode: ListNode' + #13#10 +
    '        Items[0]: DelimitedItemNode' + #13#10 +
    '          ItemNode: Identifier |Foo|' + #13#10 +
    '          DelimiterNode: (none)' + #13#10 +
    '      ColonNode: Colon |:|' + #13#10 +
    '      TypeNode: Identifier |Integer|' + #13#10 +
    '      PortabilityDirectiveListNode: (none)' + #13#10 +
    '      SemicolonNode: Semicolon |;|' + #13#10 +
    '    Items[1]: FieldDeclNode' + #13#10 +
    '      NameListNode: ListNode' + #13#10 +
    '        Items[0]: DelimitedItemNode' + #13#10 +
    '          ItemNode: Identifier |Bar|' + #13#10 +
    '          DelimiterNode: (none)' + #13#10 +
    '      ColonNode: Colon |:|' + #13#10 +
    '      TypeNode: Identifier |Boolean|' + #13#10 +
    '      PortabilityDirectiveListNode: (none)' + #13#10 +
    '      SemicolonNode: Semicolon |;|' + #13#10 +
    '  VariantSectionNode: (none)' + #13#10 +
    '  CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '  SemicolonNode: (none)', RTVariantGroup));
end;

procedure TTestVariantGroup.Test1ColonFooColonIntegerCaseByteOf1ColonEmptyVariant;
begin
  OK('1: (Foo: Integer; case Byte of 1: ())',
    TTestParser.ParsesAs('1: (Foo: Integer; case Byte of 1: ())',
    'VariantGroupNode' + #13#10 +
    '  ValueListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Number |1|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '  FieldDeclListNode: ListNode' + #13#10 +
    '    Items[0]: FieldDeclNode' + #13#10 +
    '      NameListNode: ListNode' + #13#10 +
    '        Items[0]: DelimitedItemNode' + #13#10 +
    '          ItemNode: Identifier |Foo|' + #13#10 +
    '          DelimiterNode: (none)' + #13#10 +
    '      ColonNode: Colon |:|' + #13#10 +
    '      TypeNode: Identifier |Integer|' + #13#10 +
    '      PortabilityDirectiveListNode: (none)' + #13#10 +
    '      SemicolonNode: Semicolon |;|' + #13#10 +
    '  VariantSectionNode: VariantSectionNode' + #13#10 +
    '    CaseKeywordNode: CaseKeyword |case|' + #13#10 +
    '    NameNode: (none)' + #13#10 +
    '    ColonNode: (none)' + #13#10 +
    '    TypeNode: Identifier |Byte|' + #13#10 +
    '    OfKeywordNode: OfKeyword |of|' + #13#10 +
    '    VariantGroupListNode: ListNode' + #13#10 +
    '      Items[0]: VariantGroupNode' + #13#10 +
    '        ValueListNode: ListNode' + #13#10 +
    '          Items[0]: DelimitedItemNode' + #13#10 +
    '            ItemNode: Number |1|' + #13#10 +
    '            DelimiterNode: (none)' + #13#10 +
    '        ColonNode: Colon |:|' + #13#10 +
    '        OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '        FieldDeclListNode: (none)' + #13#10 +
    '        VariantSectionNode: (none)' + #13#10 +
    '        CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '        SemicolonNode: (none)' + #13#10 +
    '  CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '  SemicolonNode: (none)', RTVariantGroup));
end;

initialization
  RegisterTest(TTestVariantGroup.Suite);
{$ENDIF}
end.
