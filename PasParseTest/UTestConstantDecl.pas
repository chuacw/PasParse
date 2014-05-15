unit UTestConstantDecl;

interface

uses
  UTest;

type
  TTestConstantDecl = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestFooEqual42;
    procedure TestFooIntegerEqual42;
    procedure TestFooTMyArrayEqual2442;
    procedure TestFooSetOfByteEqualEmptySet;
    procedure TestFooEqual42LibraryExperimental;
    procedure TestPublic;
    procedure TestStrictPrivate;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType, UParser, UCompilerDefines{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestConstantDecl }
{$IF NOT DEFINED(DUNIT)}
class function TTestConstantDecl.GetName: string;
begin
  Result := 'ConstantDecl';
end;

class procedure TTestConstantDecl.TestAll;
var
  ACompilerDefines: TCompilerDefines;
  AParser: TParser;
begin
  OK('Foo = 42;', TTestParser.ParsesAs('Foo = 42;',
    'ConstantDeclNode' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  TypeNode: (none)' + #13#10 +
    '  EqualSignNode: EqualSign |=|' + #13#10 +
    '  ValueNode: Number |42|' + #13#10 +
    '  PortabilityDirectiveListNode: ListNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTConstantDecl));

  OK('Foo: Integer = 42;', TTestParser.ParsesAs('Foo: Integer = 42;',
    'ConstantDeclNode' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  TypeNode: Identifier |Integer|' + #13#10 +
    '  EqualSignNode: EqualSign |=|' + #13#10 +
    '  ValueNode: Number |42|' + #13#10 +
    '  PortabilityDirectiveListNode: ListNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTConstantDecl));

  OK('Foo: TMyArray = (24, 42);', TTestParser.ParsesAs('Foo: TMyArray = (24, 42);', 
    'ConstantDeclNode' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  TypeNode: Identifier |TMyArray|' + #13#10 +
    '  EqualSignNode: EqualSign |=|' + #13#10 +
    '  ValueNode: ConstantListNode' + #13#10 +
    '    OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '    ItemListNode: ListNode' + #13#10 +
    '      Items[0]: DelimitedItemNode' + #13#10 +
    '        ItemNode: Number |24|' + #13#10 +
    '        DelimiterNode: Comma |,|' + #13#10 +
    '      Items[1]: DelimitedItemNode' + #13#10 +
    '        ItemNode: Number |42|' + #13#10 +
    '        DelimiterNode: (none)' + #13#10 +
    '    CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '  PortabilityDirectiveListNode: ListNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTConstantDecl));

  OK('Foo: set of Byte = [];', TTestParser.ParsesAs('Foo: set of Byte = [];',
    'ConstantDeclNode' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  TypeNode: SetOfNode' + #13#10 +
    '    SetKeywordNode: SetKeyword |set|' + #13#10 +
    '    OfKeywordNode: OfKeyword |of|' + #13#10 +
    '    TypeNode: Identifier |Byte|' + #13#10 +
    '  EqualSignNode: EqualSign |=|' + #13#10 +
    '  ValueNode: SetLiteralNode' + #13#10 +
    '    OpenBracketNode: OpenBracket |[|' + #13#10 +
    '    ItemListNode: ListNode' + #13#10 +
    '    CloseBracketNode: CloseBracket |]|' + #13#10 +
    '  PortabilityDirectiveListNode: ListNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTConstantDecl));

  OK('Foo = 42 library experimental;',
    TTestParser.ParsesAs('Foo = 42 library experimental;',
    'ConstantDeclNode'+ #13#10 +
    '  NameNode: Identifier |Foo|'+ #13#10 +
    '  ColonNode: (none)'+ #13#10 +
    '  TypeNode: (none)'+ #13#10 +
    '  EqualSignNode: EqualSign |=|'+ #13#10 +
    '  ValueNode: Number |42|'+ #13#10 +
    '  PortabilityDirectiveListNode: ListNode'+ #13#10 +
    '    Items[0]: DirectiveNode'+ #13#10 +
    '      SemicolonNode: (none)'+ #13#10 +
    '      KeywordNode: LibraryKeyword |library|'+ #13#10 +
    '      ValueNode: (none)'+ #13#10 +
    '      DataNode: (none)'+ #13#10 +
    '    Items[1]: DirectiveNode'+ #13#10 +
    '      SemicolonNode: (none)'+ #13#10 +
    '      KeywordNode: ExperimentalSemikeyword |experimental|'+ #13#10 +
    '      ValueNode: (none)'+ #13#10 +
    '      DataNode: (none)'+ #13#10 +
    '  SemicolonNode: Semicolon |;|', RTConstantDecl));

  ACompilerDefines := TCompilerDefines.Create;

  AParser := TParser.CreateFromText('public', '', ACompilerDefines, nil);
  OK('LookAhead: public', not AParser.CanParseRule(RTConstantDecl));
  AParser.Free;

  AParser := TParser.CreateFromText('strict private', '', ACompilerDefines, nil);
  OK('LookAhead: strict private', not AParser.CanParseRule(RTConstantDecl));
  AParser.Free;

  ACompilerDefines.Free;
end;
{$ELSE}

procedure TTestConstantDecl.TestFooEqual42;
begin
  OK('Foo = 42;', TTestParser.ParsesAs('Foo = 42;',
    'ConstantDeclNode' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  TypeNode: (none)' + #13#10 +
    '  EqualSignNode: EqualSign |=|' + #13#10 +
    '  ValueNode: Number |42|' + #13#10 +
    '  PortabilityDirectiveListNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTConstantDecl));
end;

procedure TTestConstantDecl.TestFooIntegerEqual42;
begin
  OK('Foo: Integer = 42;', TTestParser.ParsesAs('Foo: Integer = 42;',
    'ConstantDeclNode' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  TypeNode: Identifier |Integer|' + #13#10 +
    '  EqualSignNode: EqualSign |=|' + #13#10 +
    '  ValueNode: Number |42|' + #13#10 +
    '  PortabilityDirectiveListNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTConstantDecl));
end;

procedure TTestConstantDecl.TestFooTMyArrayEqual2442;
begin
  OK('Foo: TMyArray = (24, 42);', TTestParser.ParsesAs('Foo: TMyArray = (24, 42);',
    'ConstantDeclNode' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  TypeNode: Identifier |TMyArray|' + #13#10 +
    '  EqualSignNode: EqualSign |=|' + #13#10 +
    '  ValueNode: ConstantListNode' + #13#10 +
    '    OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '    ItemListNode: ListNode' + #13#10 +
    '      Items[0]: DelimitedItemNode' + #13#10 +
    '        ItemNode: Number |24|' + #13#10 +
    '        DelimiterNode: Comma |,|' + #13#10 +
    '      Items[1]: DelimitedItemNode' + #13#10 +
    '        ItemNode: Number |42|' + #13#10 +
    '        DelimiterNode: (none)' + #13#10 +
    '    CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '  PortabilityDirectiveListNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTConstantDecl));
end;

procedure TTestConstantDecl.TestFooSetOfByteEqualEmptySet;
begin
  OK('Foo: set of Byte = [];', TTestParser.ParsesAs('Foo: set of Byte = [];',
    'ConstantDeclNode' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  TypeNode: SetOfNode' + #13#10 +
    '    SetKeywordNode: SetKeyword |set|' + #13#10 +
    '    OfKeywordNode: OfKeyword |of|' + #13#10 +
    '    TypeNode: Identifier |Byte|' + #13#10 +
    '  EqualSignNode: EqualSign |=|' + #13#10 +
    '  ValueNode: SetLiteralNode' + #13#10 +
    '    OpenBracketNode: OpenBracket |[|' + #13#10 +
    '    ItemListNode: (none)' + #13#10 +
    '    CloseBracketNode: CloseBracket |]|' + #13#10 +
    '  PortabilityDirectiveListNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTConstantDecl));
end;

procedure TTestConstantDecl.TestFooEqual42LibraryExperimental;
begin
  OK('Foo = 42 library experimental;',
    TTestParser.ParsesAs('Foo = 42 library experimental;',
    'ConstantDeclNode'+ #13#10 +
    '  NameNode: Identifier |Foo|'+ #13#10 +
    '  ColonNode: (none)'+ #13#10 +
    '  TypeNode: (none)'+ #13#10 +
    '  EqualSignNode: EqualSign |=|'+ #13#10 +
    '  ValueNode: Number |42|'+ #13#10 +
    '  PortabilityDirectiveListNode: ListNode'+ #13#10 +
    '    Items[0]: DirectiveNode'+ #13#10 +
    '      SemicolonNode: (none)'+ #13#10 +
    '      KeywordNode: LibraryKeyword |library|'+ #13#10 +
    '      ValueNode: (none)'+ #13#10 +
    '      DataNode: (none)'+ #13#10 +
    '    Items[1]: DirectiveNode'+ #13#10 +
    '      SemicolonNode: (none)'+ #13#10 +
    '      KeywordNode: ExperimentalSemikeyword |experimental|'+ #13#10 +
    '      ValueNode: (none)'+ #13#10 +
    '      DataNode: (none)'+ #13#10 +
    '  SemicolonNode: Semicolon |;|', RTConstantDecl));
end;

var
  ACompilerDefines: TCompilerDefines;

procedure TTestConstantDecl.SetUp;
begin
  ACompilerDefines := TCompilerDefines.Create;
end;

procedure TTestConstantDecl.TearDown;
begin
  ACompilerDefines.Free;
end;

procedure TTestConstantDecl.TestPublic;
var
  AParser: TParser;
begin
  AParser := TParser.CreateFromText('public', '', ACompilerDefines, nil);
  try
    OK('LookAhead: public', not AParser.CanParseRule(RTConstantDecl));
  finally
    AParser.Free;
  end;
end;

procedure TTestConstantDecl.TestStrictPrivate;
var
  AParser: TParser;
begin
  AParser := TParser.CreateFromText('strict private', '', ACompilerDefines, nil);
  try
    OK('LookAhead: strict private', not AParser.CanParseRule(RTConstantDecl));
  finally
    AParser.Free;
  end;
end;

initialization
  RegisterTest(TTestConstantDecl.Suite);
{$ENDIF}
end.
