unit UTestProperty;

interface

uses
  UTest;

type
  TTestProperty = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestPropertyFoo;
    procedure TestPropertyFooIntegerReadFFoo;
    procedure TestPropertyFooIndexIntegerReadGetFoo;
    procedure TestPropertyFooIndexIntegerIntegerReadGetFooDefault;
    procedure TestPropertyFooDefault42;
    procedure TestClassPropertyFooIntegerReadFFoo;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestProperty }
{$IF NOT DEFINED(DUNIT)}
class function TTestProperty.GetName: string;
begin
  Result := 'Property';
end;

class procedure TTestProperty.TestAll;
begin
  OK('property Foo;', TTestParser.ParsesAs('property Foo;',
    'PropertyNode' + #13#10 +
    '  ClassKeywordNode: (none)' + #13#10 +
    '  PropertyKeywordNode: PropertyKeyword |property|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  OpenBracketNode: (none)' + #13#10 +
    '  ParameterListNode: ListNode' + #13#10 +
    '  CloseBracketNode: (none)' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  TypeNode: (none)' + #13#10 +
    '  DirectiveListNode: ListNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTProperty));

  OK('property Foo: Integer read FFoo;',
    TTestParser.ParsesAs('property Foo: Integer read FFoo;',
    'PropertyNode' + #13#10 +
    '  ClassKeywordNode: (none)' + #13#10 +
    '  PropertyKeywordNode: PropertyKeyword |property|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  OpenBracketNode: (none)' + #13#10 +
    '  ParameterListNode: ListNode' + #13#10 +
    '  CloseBracketNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  TypeNode: Identifier |Integer|' + #13#10 +
    '  DirectiveListNode: ListNode' + #13#10 +
    '    Items[0]: DirectiveNode' + #13#10 +
    '      SemicolonNode: (none)' + #13#10 +
    '      KeywordNode: ReadSemikeyword |read|' + #13#10 +
    '      ValueNode: Identifier |FFoo|' + #13#10 +
    '      DataNode: ListNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTProperty));

  OK('property Foo[Index: Integer]: Integer read GetFoo;',
    TTestParser.ParsesAs('property Foo[Index: Integer]: Integer read GetFoo;',
    'PropertyNode' + #13#10 +
    '  ClassKeywordNode: (none)' + #13#10 +
    '  PropertyKeywordNode: PropertyKeyword |property|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  OpenBracketNode: OpenBracket |[|' + #13#10 +
    '  ParameterListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: ParameterNode' + #13#10 +
    '        ModifierNode: (none)' + #13#10 +
    '        NameListNode: ListNode' + #13#10 +
    '          Items[0]: DelimitedItemNode' + #13#10 +
    '            ItemNode: Identifier |Index|' + #13#10 +
    '            DelimiterNode: (none)' + #13#10 +
    '        ColonNode: Colon |:|' + #13#10 +
    '        TypeNode: Identifier |Integer|' + #13#10 +
    '        EqualSignNode: (none)' + #13#10 +
    '        DefaultValueNode: (none)' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  CloseBracketNode: CloseBracket |]|' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  TypeNode: Identifier |Integer|' + #13#10 +
    '  DirectiveListNode: ListNode' + #13#10 +
    '    Items[0]: DirectiveNode' + #13#10 +
    '      SemicolonNode: (none)' + #13#10 +
    '      KeywordNode: ReadSemikeyword |read|' + #13#10 +
    '      ValueNode: Identifier |GetFoo|' + #13#10 +
    '      DataNode: ListNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTProperty));

  OK('property Foo[Index: Integer]: Integer read GetFoo; default;',
    TTestParser.ParsesAs(
    'property Foo[Index: Integer]: Integer read GetFoo; default;',
    'PropertyNode' + #13#10 +
    '  ClassKeywordNode: (none)' + #13#10 +
    '  PropertyKeywordNode: PropertyKeyword |property|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  OpenBracketNode: OpenBracket |[|' + #13#10 +
    '  ParameterListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: ParameterNode' + #13#10 +
    '        ModifierNode: (none)' + #13#10 +
    '        NameListNode: ListNode' + #13#10 +
    '          Items[0]: DelimitedItemNode' + #13#10 +
    '            ItemNode: Identifier |Index|' + #13#10 +
    '            DelimiterNode: (none)' + #13#10 +
    '        ColonNode: Colon |:|' + #13#10 +
    '        TypeNode: Identifier |Integer|' + #13#10 +
    '        EqualSignNode: (none)' + #13#10 +
    '        DefaultValueNode: (none)' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  CloseBracketNode: CloseBracket |]|' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  TypeNode: Identifier |Integer|' + #13#10 +
    '  DirectiveListNode: ListNode' + #13#10 +
    '    Items[0]: DirectiveNode' + #13#10 +
    '      SemicolonNode: (none)' + #13#10 +
    '      KeywordNode: ReadSemikeyword |read|' + #13#10 +
    '      ValueNode: Identifier |GetFoo|' + #13#10 +
    '      DataNode: ListNode' + #13#10 +
    '    Items[1]: DirectiveNode' + #13#10 +
    '      SemicolonNode: Semicolon |;|' + #13#10 +
    '      KeywordNode: DefaultSemikeyword |default|' + #13#10 +
    '      ValueNode: (none)' + #13#10 +
    '      DataNode: ListNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTProperty));

  OK('property Foo default 42;',
    TTestParser.ParsesAs('property Foo default 42;', 
    'PropertyNode' + #13#10 +
    '  ClassKeywordNode: (none)' + #13#10 +
    '  PropertyKeywordNode: PropertyKeyword |property|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  OpenBracketNode: (none)' + #13#10 +
    '  ParameterListNode: ListNode' + #13#10 +
    '  CloseBracketNode: (none)' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  TypeNode: (none)' + #13#10 +
    '  DirectiveListNode: ListNode' + #13#10 +
    '    Items[0]: DirectiveNode' + #13#10 +
    '      SemicolonNode: (none)' + #13#10 +
    '      KeywordNode: DefaultSemikeyword |default|' + #13#10 +
    '      ValueNode: Number |42|' + #13#10 +
    '      DataNode: ListNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTProperty));

  OK('class property Foo: Integer read FFoo;',
    TTestParser.ParsesAs('class property Foo: Integer read FFoo;',
    'PropertyNode' + #13#10 +
    '  ClassKeywordNode: ClassKeyword |class|' + #13#10 +
    '  PropertyKeywordNode: PropertyKeyword |property|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  OpenBracketNode: (none)' + #13#10 +
    '  ParameterListNode: ListNode' + #13#10 +
    '  CloseBracketNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  TypeNode: Identifier |Integer|' + #13#10 +
    '  DirectiveListNode: ListNode' + #13#10 +
    '    Items[0]: DirectiveNode' + #13#10 +
    '      SemicolonNode: (none)' + #13#10 +
    '      KeywordNode: ReadSemikeyword |read|' + #13#10 +
    '      ValueNode: Identifier |FFoo|' + #13#10 +
    '      DataNode: ListNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTProperty));
end;
{$ELSE}

procedure TTestProperty.TestPropertyFoo;
const
  CPropertyFoo: string = 'property Foo;';
begin
  OK(CPropertyFoo, TTestParser.ParsesAs(CPropertyFoo,
    'PropertyNode' + #13#10 +
    '  ClassKeywordNode: (none)' + #13#10 +
    '  PropertyKeywordNode: PropertyKeyword |property|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  OpenBracketNode: (none)' + #13#10 +
    '  ParameterListNode: (none)' + #13#10 +
    '  CloseBracketNode: (none)' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  TypeNode: (none)' + #13#10 +
    '  DirectiveListNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTProperty));
end;

procedure TTestProperty.TestPropertyFooIntegerReadFFoo;
const
  CPropertyFooIntegerReadFFoo: string = 'property Foo: Integer read FFoo;';
begin
  OK(CPropertyFooIntegerReadFFoo,
    TTestParser.ParsesAs(CPropertyFooIntegerReadFFoo,
    'PropertyNode' + #13#10 +
    '  ClassKeywordNode: (none)' + #13#10 +
    '  PropertyKeywordNode: PropertyKeyword |property|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  OpenBracketNode: (none)' + #13#10 +
    '  ParameterListNode: (none)' + #13#10 +
    '  CloseBracketNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  TypeNode: Identifier |Integer|' + #13#10 +
    '  DirectiveListNode: ListNode' + #13#10 +
    '    Items[0]: DirectiveNode' + #13#10 +
    '      SemicolonNode: (none)' + #13#10 +
    '      KeywordNode: ReadSemikeyword |read|' + #13#10 +
    '      ValueNode: Identifier |FFoo|' + #13#10 +
    '      DataNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTProperty));
end;

procedure TTestProperty.TestPropertyFooIndexIntegerReadGetFoo;
const
  CPropertyFooIndexIntegerReadGetFoo: string =
    'property Foo[Index: Integer]: Integer read GetFoo;';
begin
  OK(CPropertyFooIndexIntegerReadGetFoo,
    TTestParser.ParsesAs(CPropertyFooIndexIntegerReadGetFoo,
    'PropertyNode'+ #13#10 +
    '  ClassKeywordNode: (none)'+ #13#10 +
    '  PropertyKeywordNode: PropertyKeyword |property|'+ #13#10 +
    '  NameNode: Identifier |Foo|'+ #13#10 +
    '  OpenBracketNode: OpenBracket |[|'+ #13#10 +
    '  ParameterListNode: ListNode'+ #13#10 +
    '    Items[0]: DelimitedItemNode'+ #13#10 +
    '      ItemNode: ParameterNode'+ #13#10 +
    '        ModifierNode: (none)'+ #13#10 +
    '        NameListNode: ListNode'+ #13#10 +
    '          Items[0]: DelimitedItemNode'+ #13#10 +
    '            ItemNode: IdentAttrNode'+ #13#10 +
    '              AttributesListNode: (none)'+ #13#10 +
    '              Ident: Identifier |Index|'+ #13#10 +
    '            DelimiterNode: (none)'+ #13#10 +
    '        ColonNode: Colon |:|'+ #13#10 +
    '        TypeNode: Identifier |Integer|'+ #13#10 +
    '        EqualSignNode: (none)'+ #13#10 +
    '        DefaultValueNode: (none)'+ #13#10 +
    '      DelimiterNode: (none)'+ #13#10 +
    '  CloseBracketNode: CloseBracket |]|'+ #13#10 +
    '  ColonNode: Colon |:|'+ #13#10 +
    '  TypeNode: Identifier |Integer|'+ #13#10 +
    '  DirectiveListNode: ListNode'+ #13#10 +
    '    Items[0]: DirectiveNode'+ #13#10 +
    '      SemicolonNode: (none)'+ #13#10 +
    '      KeywordNode: ReadSemikeyword |read|'+ #13#10 +
    '      ValueNode: Identifier |GetFoo|'+ #13#10 +
    '      DataNode: (none)'+ #13#10 +
    '  SemicolonNode: Semicolon |;|', RTProperty));
end;

procedure TTestProperty.TestPropertyFooIndexIntegerIntegerReadGetFooDefault;
const
  CPropertyFooIndexIntegerIntegerReadGetFooDefault: string =
    'property Foo[Index: Integer]: Integer read GetFoo; default;';
begin
  OK(CPropertyFooIndexIntegerIntegerReadGetFooDefault,
    TTestParser.ParsesAs(CPropertyFooIndexIntegerIntegerReadGetFooDefault,
    'PropertyNode'+ #13#10 +
    '  ClassKeywordNode: (none)'+ #13#10 +
    '  PropertyKeywordNode: PropertyKeyword |property|'+ #13#10 +
    '  NameNode: Identifier |Foo|'+ #13#10 +
    '  OpenBracketNode: OpenBracket |[|'+ #13#10 +
    '  ParameterListNode: ListNode'+ #13#10 +
    '    Items[0]: DelimitedItemNode'+ #13#10 +
    '      ItemNode: ParameterNode'+ #13#10 +
    '        ModifierNode: (none)'+ #13#10 +
    '        NameListNode: ListNode'+ #13#10 +
    '          Items[0]: DelimitedItemNode'+ #13#10 +
    '            ItemNode: IdentAttrNode'+ #13#10 +
    '              AttributesListNode: (none)'+ #13#10 +
    '              Ident: Identifier |Index|'+ #13#10 +
    '            DelimiterNode: (none)'+ #13#10 +
    '        ColonNode: Colon |:|'+ #13#10 +
    '        TypeNode: Identifier |Integer|'+ #13#10 +
    '        EqualSignNode: (none)'+ #13#10 +
    '        DefaultValueNode: (none)'+ #13#10 +
    '      DelimiterNode: (none)'+ #13#10 +
    '  CloseBracketNode: CloseBracket |]|'+ #13#10 +
    '  ColonNode: Colon |:|'+ #13#10 +
    '  TypeNode: Identifier |Integer|'+ #13#10 +
    '  DirectiveListNode: ListNode'+ #13#10 +
    '    Items[0]: DirectiveNode'+ #13#10 +
    '      SemicolonNode: (none)'+ #13#10 +
    '      KeywordNode: ReadSemikeyword |read|'+ #13#10 +
    '      ValueNode: Identifier |GetFoo|'+ #13#10 +
    '      DataNode: (none)'+ #13#10 +
    '    Items[1]: DirectiveNode'+ #13#10 +
    '      SemicolonNode: Semicolon |;|'+ #13#10 +
    '      KeywordNode: DefaultSemikeyword |default|'+ #13#10 +
    '      ValueNode: (none)'+ #13#10 +
    '      DataNode: (none)'+ #13#10 +
    '  SemicolonNode: Semicolon |;|', RTProperty));
end;

procedure TTestProperty.TestPropertyFooDefault42;
const
  CPropertyFooDefault42: string = 'property Foo default 42;';
begin
  OK(CPropertyFooDefault42,
    TTestParser.ParsesAs(CPropertyFooDefault42,
    'PropertyNode' + #13#10 +
    '  ClassKeywordNode: (none)' + #13#10 +
    '  PropertyKeywordNode: PropertyKeyword |property|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  OpenBracketNode: (none)' + #13#10 +
    '  ParameterListNode: (none)' + #13#10 +
    '  CloseBracketNode: (none)' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  TypeNode: (none)' + #13#10 +
    '  DirectiveListNode: ListNode' + #13#10 +
    '    Items[0]: DirectiveNode' + #13#10 +
    '      SemicolonNode: (none)' + #13#10 +
    '      KeywordNode: DefaultSemikeyword |default|' + #13#10 +
    '      ValueNode: Number |42|' + #13#10 +
    '      DataNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTProperty));
end;

procedure TTestProperty.TestClassPropertyFooIntegerReadFFoo;
const
  CClassPropertyFooIntegerReadFFoo: string =
    'class property Foo: Integer read FFoo;';
begin
  OK(CClassPropertyFooIntegerReadFFoo,
    TTestParser.ParsesAs(CClassPropertyFooIntegerReadFFoo,
    'PropertyNode' + #13#10 +
    '  ClassKeywordNode: ClassKeyword |class|' + #13#10 +
    '  PropertyKeywordNode: PropertyKeyword |property|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  OpenBracketNode: (none)' + #13#10 +
    '  ParameterListNode: (none)' + #13#10 +
    '  CloseBracketNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  TypeNode: Identifier |Integer|' + #13#10 +
    '  DirectiveListNode: ListNode' + #13#10 +
    '    Items[0]: DirectiveNode' + #13#10 +
    '      SemicolonNode: (none)' + #13#10 +
    '      KeywordNode: ReadSemikeyword |read|' + #13#10 +
    '      ValueNode: Identifier |FFoo|' + #13#10 +
    '      DataNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTProperty));
end;

initialization
  RegisterTest(TTestProperty.Suite);
{$ENDIF}
end.
