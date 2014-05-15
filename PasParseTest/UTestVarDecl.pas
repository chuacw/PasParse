unit UTestVarDecl;

interface

uses
  UTest;

type
  TTestVarDecl = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestFooInteger;
    procedure TestFooIntegerAbsoluteBar;
    procedure TestFooIntegerEqual42;
    procedure TestFooTPointEqualXZeroYZero;
    procedure TestFooIntegerDeprecatedLibrary;
    procedure TestFooIntegerDeprecatedEqual42Platform;
    procedure TestGenericsInVarDecl;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestVarDecl }
{$IF NOT DEFINED(DUNIT)}
class function TTestVarDecl.GetName: string;
begin
  Result := 'VarDecl';
end;

class procedure TTestVarDecl.TestAll;
begin
  OK('Foo: Integer;', TTestParser.ParsesAs('Foo: Integer;',
    'VarDeclNode' + #13#10 +
    '  NameListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  TypeNode: Identifier |Integer|' + #13#10 +
    '  FirstPortabilityDirectiveListNode: ListNode' + #13#10 +
    '  AbsoluteSemikeywordNode: (none)' + #13#10 +
    '  AbsoluteAddressNode: (none)' + #13#10 +
    '  EqualSignNode: (none)' + #13#10 +
    '  ValueNode: (none)' + #13#10 +
    '  SecondPortabilityDirectiveListNode: ListNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTVarDecl));

  OK('Foo: Integer absolute Bar;', TTestParser.ParsesAs('Foo: Integer absolute Bar;',
    'VarDeclNode' + #13#10 +
    '  NameListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  TypeNode: Identifier |Integer|' + #13#10 +
    '  FirstPortabilityDirectiveListNode: ListNode' + #13#10 +
    '  AbsoluteSemikeywordNode: AbsoluteSemikeyword |absolute|' + #13#10 +
    '  AbsoluteAddressNode: Identifier |Bar|' + #13#10 +
    '  EqualSignNode: (none)' + #13#10 +
    '  ValueNode: (none)' + #13#10 +
    '  SecondPortabilityDirectiveListNode: ListNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTVarDecl));

  OK('Foo: Integer = 42;', TTestParser.ParsesAs('Foo: Integer = 42;', 
    'VarDeclNode' + #13#10 +
    '  NameListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  TypeNode: Identifier |Integer|' + #13#10 +
    '  FirstPortabilityDirectiveListNode: ListNode' + #13#10 +
    '  AbsoluteSemikeywordNode: (none)' + #13#10 +
    '  AbsoluteAddressNode: (none)' + #13#10 +
    '  EqualSignNode: EqualSign |=|' + #13#10 +
    '  ValueNode: Number |42|' + #13#10 +
    '  SecondPortabilityDirectiveListNode: ListNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTVarDecl));

  OK('Foo: TPoint = (X: 0; Y: 0);', TTestParser.ParsesAs('Foo: TPoint = (X: 0; Y: 0);',
    'VarDeclNode' + #13#10 +
    '  NameListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  TypeNode: Identifier |TPoint|' + #13#10 +
    '  FirstPortabilityDirectiveListNode: ListNode' + #13#10 +
    '  AbsoluteSemikeywordNode: (none)' + #13#10 +
    '  AbsoluteAddressNode: (none)' + #13#10 +
    '  EqualSignNode: EqualSign |=|' + #13#10 +
    '  ValueNode: ConstantListNode' + #13#10 +
    '    OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '    ItemListNode: ListNode' + #13#10 +
    '      Items[0]: DelimitedItemNode' + #13#10 +
    '        ItemNode: RecordFieldConstantNode' + #13#10 +
    '          NameNode: Identifier |X|' + #13#10 +
    '          ColonNode: Colon |:|' + #13#10 +
    '          ValueNode: Number |0|' + #13#10 +
    '        DelimiterNode: Semicolon |;|' + #13#10 +
    '      Items[1]: DelimitedItemNode' + #13#10 +
    '        ItemNode: RecordFieldConstantNode' + #13#10 +
    '          NameNode: Identifier |Y|' + #13#10 +
    '          ColonNode: Colon |:|' + #13#10 +
    '          ValueNode: Number |0|' + #13#10 +
    '        DelimiterNode: (none)' + #13#10 +
    '    CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '  SecondPortabilityDirectiveListNode: ListNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTVarDecl));

  OK('Foo: Integer deprecated library;',
    TTestParser.ParsesAs('Foo: Integer deprecated library;',
    'VarDeclNode'+ #13#10 +
    '  NameListNode: ListNode'+ #13#10 +
    '    Items[0]: DelimitedItemNode'+ #13#10 +
    '      ItemNode: Identifier |Foo|'+ #13#10 +
    '      DelimiterNode: (none)'+ #13#10 +
    '  ColonNode: Colon |:|'+ #13#10 +
    '  TypeNode: Identifier |Integer|'+ #13#10 +
    '  FirstPortabilityDirectiveListNode: ListNode'+ #13#10 +
    '    Items[0]: DirectiveNode'+ #13#10 +
    '      SemicolonNode: (none)'+ #13#10 +
    '      KeywordNode: DeprecatedSemikeyword |deprecated|'+ #13#10 +
    '      ValueNode: (none)'+ #13#10 +
    '      DataNode: (none)'+ #13#10 +
    '    Items[1]: DirectiveNode'+ #13#10 +
    '      SemicolonNode: (none)'+ #13#10 +
    '      KeywordNode: LibraryKeyword |library|'+ #13#10 +
    '      ValueNode: (none)'+ #13#10 +
    '      DataNode: (none)'+ #13#10 +
    '  AbsoluteSemikeywordNode: (none)'+ #13#10 +
    '  AbsoluteAddressNode: (none)'+ #13#10 +
    '  EqualSignNode: (none)'+ #13#10 +
    '  ValueNode: (none)'+ #13#10 +
    '  SecondPortabilityDirectiveListNode: ListNode'+ #13#10 +
    '  SemicolonNode: Semicolon |;|', RTVarDecl));

  OK('Foo: Integer deprecated = 42 platform;',
    TTestParser.ParsesAs('Foo: Integer deprecated = 42 platform;',
    'VarDeclNode' + #13#10 +
    '  NameListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  TypeNode: Identifier |Integer|' + #13#10 +
    '  FirstPortabilityDirectiveListNode: ListNode' + #13#10 +
    '    Items[0]: DirectiveNode'+ #13#10 +
    '      SemicolonNode: (none)'+ #13#10 +
    '      KeywordNode: DeprecatedSemikeyword |deprecated|'+ #13#10 +
    '      ValueNode: (none)'+ #13#10 +
    '      DataNode: (none)'+ #13#10 +
    '  AbsoluteSemikeywordNode: (none)' + #13#10 +
    '  AbsoluteAddressNode: (none)' + #13#10 +
    '  EqualSignNode: EqualSign |=|' + #13#10 +
    '  ValueNode: Number |42|' + #13#10 +
    '  SecondPortabilityDirectiveListNode: ListNode' + #13#10 +
    '    Items[0]: DirectiveNode'+ #13#10 +
    '      SemicolonNode: (none)'+ #13#10 +
    '      KeywordNode: PlatformSemikeyword |platform|'+ #13#10 +
    '      ValueNode: (none)'+ #13#10 +
    '      DataNode: (none)'+ #13#10 +
    '  SemicolonNode: Semicolon |;|', RTVarDecl));
end;
{$ELSE}

procedure TTestVarDecl.TestFooInteger;
const
  CFooInteger: string = 'Foo: Integer;';
begin
  OK(CFooInteger, TTestParser.ParsesAs(CFooInteger,
    'VarDeclNode' + #13#10 +
    '  NameListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  TypeNode: Identifier |Integer|' + #13#10 +
    '  FirstPortabilityDirectiveListNode: (none)' + #13#10 +
    '  AbsoluteSemikeywordNode: (none)' + #13#10 +
    '  AbsoluteAddressNode: (none)' + #13#10 +
    '  EqualSignNode: (none)' + #13#10 +
    '  ValueNode: (none)' + #13#10 +
    '  SecondPortabilityDirectiveListNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTVarDecl));
end;

procedure TTestVarDecl.TestFooIntegerAbsoluteBar;
const
  CFooIntegerAbsoluteBar: string = 'Foo: Integer absolute Bar;';
begin
  OK(CFooIntegerAbsoluteBar, TTestParser.ParsesAs(CFooIntegerAbsoluteBar,
    'VarDeclNode' + #13#10 +
    '  NameListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  TypeNode: Identifier |Integer|' + #13#10 +
    '  FirstPortabilityDirectiveListNode: (none)' + #13#10 +
    '  AbsoluteSemikeywordNode: AbsoluteSemikeyword |absolute|' + #13#10 +
    '  AbsoluteAddressNode: Identifier |Bar|' + #13#10 +
    '  EqualSignNode: (none)' + #13#10 +
    '  ValueNode: (none)' + #13#10 +
    '  SecondPortabilityDirectiveListNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTVarDecl));
end;

procedure TTestVarDecl.TestFooIntegerEqual42;
const
  CFooIntegerEqual42: string = 'Foo: Integer = 42;';
begin
  OK(CFooIntegerEqual42, TTestParser.ParsesAs(CFooIntegerEqual42,
    'VarDeclNode' + #13#10 +
    '  NameListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  TypeNode: Identifier |Integer|' + #13#10 +
    '  FirstPortabilityDirectiveListNode: (none)' + #13#10 +
    '  AbsoluteSemikeywordNode: (none)' + #13#10 +
    '  AbsoluteAddressNode: (none)' + #13#10 +
    '  EqualSignNode: EqualSign |=|' + #13#10 +
    '  ValueNode: Number |42|' + #13#10 +
    '  SecondPortabilityDirectiveListNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTVarDecl));
end;

procedure TTestVarDecl.TestFooTPointEqualXZeroYZero;
const
  CFooTPointEqualXZeroYZero: string = 'Foo: TPoint = (X: 0; Y: 0);';
begin
  OK(CFooTPointEqualXZeroYZero, TTestParser.ParsesAs(CFooTPointEqualXZeroYZero,
    'VarDeclNode' + #13#10 +
    '  NameListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  TypeNode: Identifier |TPoint|' + #13#10 +
    '  FirstPortabilityDirectiveListNode: (none)' + #13#10 +
    '  AbsoluteSemikeywordNode: (none)' + #13#10 +
    '  AbsoluteAddressNode: (none)' + #13#10 +
    '  EqualSignNode: EqualSign |=|' + #13#10 +
    '  ValueNode: ConstantListNode' + #13#10 +
    '    OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '    ItemListNode: ListNode' + #13#10 +
    '      Items[0]: DelimitedItemNode' + #13#10 +
    '        ItemNode: RecordFieldConstantNode' + #13#10 +
    '          NameNode: Identifier |X|' + #13#10 +
    '          ColonNode: Colon |:|' + #13#10 +
    '          ValueNode: Number |0|' + #13#10 +
    '        DelimiterNode: Semicolon |;|' + #13#10 +
    '      Items[1]: DelimitedItemNode' + #13#10 +
    '        ItemNode: RecordFieldConstantNode' + #13#10 +
    '          NameNode: Identifier |Y|' + #13#10 +
    '          ColonNode: Colon |:|' + #13#10 +
    '          ValueNode: Number |0|' + #13#10 +
    '        DelimiterNode: (none)' + #13#10 +
    '    CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '  SecondPortabilityDirectiveListNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTVarDecl));
end;

procedure TTestVarDecl.TestFooIntegerDeprecatedLibrary;
const
  CFooIntegerDeprecatedLibrary: string = 'Foo: Integer deprecated library;';
begin
  OK(CFooIntegerDeprecatedLibrary,
    TTestParser.ParsesAs(CFooIntegerDeprecatedLibrary,
    'VarDeclNode'+ #13#10 +
    '  NameListNode: ListNode'+ #13#10 +
    '    Items[0]: DelimitedItemNode'+ #13#10 +
    '      ItemNode: Identifier |Foo|'+ #13#10 +
    '      DelimiterNode: (none)'+ #13#10 +
    '  ColonNode: Colon |:|'+ #13#10 +
    '  TypeNode: Identifier |Integer|'+ #13#10 +
    '  FirstPortabilityDirectiveListNode: ListNode'+ #13#10 +
    '    Items[0]: DirectiveNode'+ #13#10 +
    '      SemicolonNode: (none)'+ #13#10 +
    '      KeywordNode: DeprecatedSemikeyword |deprecated|'+ #13#10 +
    '      ValueNode: (none)'+ #13#10 +
    '      DataNode: (none)'+ #13#10 +
    '    Items[1]: DirectiveNode'+ #13#10 +
    '      SemicolonNode: (none)'+ #13#10 +
    '      KeywordNode: LibraryKeyword |library|'+ #13#10 +
    '      ValueNode: (none)'+ #13#10 +
    '      DataNode: (none)'+ #13#10 +
    '  AbsoluteSemikeywordNode: (none)'+ #13#10 +
    '  AbsoluteAddressNode: (none)'+ #13#10 +
    '  EqualSignNode: (none)'+ #13#10 +
    '  ValueNode: (none)'+ #13#10 +
    '  SecondPortabilityDirectiveListNode: (none)'+ #13#10 +
    '  SemicolonNode: Semicolon |;|', RTVarDecl));
end;

procedure TTestVarDecl.TestFooIntegerDeprecatedEqual42Platform;
const
  CFooIntegerDeprecatedEqual42Platform: string =
    'Foo: Integer deprecated = 42 platform;';
begin
  OK(CFooIntegerDeprecatedEqual42Platform,
    TTestParser.ParsesAs(CFooIntegerDeprecatedEqual42Platform,
    'VarDeclNode' + #13#10 +
    '  NameListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  TypeNode: Identifier |Integer|' + #13#10 +
    '  FirstPortabilityDirectiveListNode: ListNode' + #13#10 +
    '    Items[0]: DirectiveNode'+ #13#10 +
    '      SemicolonNode: (none)'+ #13#10 +
    '      KeywordNode: DeprecatedSemikeyword |deprecated|'+ #13#10 +
    '      ValueNode: (none)'+ #13#10 +
    '      DataNode: (none)'+ #13#10 +
    '  AbsoluteSemikeywordNode: (none)' + #13#10 +
    '  AbsoluteAddressNode: (none)' + #13#10 +
    '  EqualSignNode: EqualSign |=|' + #13#10 +
    '  ValueNode: Number |42|' + #13#10 +
    '  SecondPortabilityDirectiveListNode: ListNode' + #13#10 +
    '    Items[0]: DirectiveNode'+ #13#10 +
    '      SemicolonNode: (none)'+ #13#10 +
    '      KeywordNode: PlatformSemikeyword |platform|'+ #13#10 +
    '      ValueNode: (none)'+ #13#10 +
    '      DataNode: (none)'+ #13#10 +
    '  SemicolonNode: Semicolon |;|', RTVarDecl));
end;

procedure TTestVarDecl.TestGenericsInVarDecl;
const
  CHandleToIdMapVar: string = 'HandleToIdMap: TDictionary<Cardinal,timer_t>;';
begin
  OK(CHandleToIdMapVar, TTestParser.ParsesAs(CHandleToIdMapVar,
   'VarDeclNode'+ #13#10 +
   '  NameListNode: ListNode'+ #13#10 +
   '    Items[0]: DelimitedItemNode'+ #13#10 +
   '      ItemNode: Identifier |HandleToIdMap|'+ #13#10 +
   '      DelimiterNode: (none)'+ #13#10 +
   '  ColonNode: Colon |:|'+ #13#10 +
   '  TypeNode: IdentTypeArgsNode'+ #13#10 +
   '    Ident: Identifier |TDictionary|'+ #13#10 +
   '    TypeArgsNode: TypeParamsUsageNode'+ #13#10 +
   '      OpenBracketNode: LessThan |<|'+ #13#10 +
   '      TypeParamNode: ListNode'+ #13#10 +
   '        Items[0]: DelimitedItemNode'+ #13#10 +
   '          ItemNode: Identifier |Cardinal|'+ #13#10 +
   '          DelimiterNode: Comma |,|'+ #13#10 +
   '        Items[1]: DelimitedItemNode'+ #13#10 +
   '          ItemNode: Identifier |timer_t|'+ #13#10 +
   '          DelimiterNode: (none)'+ #13#10 +
   '      CloseBracketNode: GreaterThan |>|'+ #13#10 +
   '  FirstPortabilityDirectiveListNode: (none)'+ #13#10 +
   '  AbsoluteSemikeywordNode: (none)'+ #13#10 +
   '  AbsoluteAddressNode: (none)'+ #13#10 +
   '  EqualSignNode: (none)'+ #13#10 +
   '  ValueNode: (none)'+ #13#10 +
   '  SecondPortabilityDirectiveListNode: (none)'+ #13#10 +
   '  SemicolonNode: Semicolon |;|', RTVarDecl));
end;

initialization
  RegisterTest(TTestVarDecl.Suite);
{$ENDIF}
end.
