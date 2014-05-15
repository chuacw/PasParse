unit UTestMethodHeading;

interface

uses
  UTest;

type
  TTestMethodHeading = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestProcedureFoo;
    procedure TestFunctionFoo;
    procedure TestConstructorFoo;
    procedure TestDestructorFoo;
    procedure TestProcedureFooVirtualAbstractDeprecated;
    procedure TestProcedureFooDeprecated;
    procedure TestProcedureTFooDOTBar;
    procedure TestProcedureFooEmptyParenthesis;
    procedure TestMethodFooSenderCanCloseSemicolon;
    procedure TestFunctionFooBoolean;
    procedure TestClassProcedureFoo;
    procedure TestClassFunctionFooInteger;
    procedure TestMethodResolutionIFooDotBarEqualBaz;
    procedure TestClassOperatorImplicitValueValue;
    procedure TestNSStrStrNSStringDeprecatedString;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestMethodHeading }
{$IF NOT DEFINED(DUNIT)}
class function TTestMethodHeading.GetName: string;
begin
  Result := 'MethodHeading';
end;

class procedure TTestMethodHeading.TestAll;
begin
  OK('procedure Foo;', TTestParser.ParsesAs('procedure Foo;',
    'MethodHeadingNode' + #13#10 +
    '  ClassKeywordNode: (none)' + #13#10 +
    '  MethodTypeNode: ProcedureKeyword |procedure|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  ParameterListNode: ListNode' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  ReturnTypeNode: (none)' + #13#10 +
    '  DirectiveListNode: ListNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTMethodHeading));

  OK('function Foo;', TTestParser.ParsesAs('function Foo;',
    'MethodHeadingNode' + #13#10 +
    '  ClassKeywordNode: (none)' + #13#10 +
    '  MethodTypeNode: FunctionKeyword |function|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  ParameterListNode: ListNode' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  ReturnTypeNode: (none)' + #13#10 +
    '  DirectiveListNode: ListNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTMethodHeading));

  OK('constructor Foo;', TTestParser.ParsesAs('constructor Foo;',
    'MethodHeadingNode' + #13#10 +
    '  ClassKeywordNode: (none)' + #13#10 +
    '  MethodTypeNode: ConstructorKeyword |constructor|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  ParameterListNode: ListNode' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  ReturnTypeNode: (none)' + #13#10 +
    '  DirectiveListNode: ListNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTMethodHeading));

  OK('destructor Foo; override;',
    TTestParser.ParsesAs('destructor Foo; override;',
    'MethodHeadingNode' + #13#10 +
    '  ClassKeywordNode: (none)' + #13#10 +
    '  MethodTypeNode: DestructorKeyword |destructor|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  ParameterListNode: ListNode' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  ReturnTypeNode: (none)' + #13#10 +
    '  DirectiveListNode: ListNode' + #13#10 +
    '    Items[0]: DirectiveNode' + #13#10 +
    '      SemicolonNode: Semicolon |;|' + #13#10 +
    '      KeywordNode: OverrideSemikeyword |override|' + #13#10 +
    '      ValueNode: (none)' + #13#10 +
    '      DataNode: ListNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTMethodHeading));

  OK('procedure Foo; virtual; abstract; deprecated;',
    TTestParser.ParsesAs('procedure Foo; virtual; abstract; deprecated;',
    'MethodHeadingNode' + #13#10 +
    '  ClassKeywordNode: (none)' + #13#10 +
    '  MethodTypeNode: ProcedureKeyword |procedure|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  ParameterListNode: ListNode' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  ReturnTypeNode: (none)' + #13#10 +
    '  DirectiveListNode: ListNode' + #13#10 +
    '    Items[0]: DirectiveNode' + #13#10 +
    '      SemicolonNode: Semicolon |;|' + #13#10 +
    '      KeywordNode: VirtualSemikeyword |virtual|' + #13#10 +
    '      ValueNode: (none)' + #13#10 +
    '      DataNode: ListNode' + #13#10 +
    '    Items[1]: DirectiveNode' + #13#10 +
    '      SemicolonNode: Semicolon |;|' + #13#10 +
    '      KeywordNode: AbstractSemikeyword |abstract|' + #13#10 +
    '      ValueNode: (none)' + #13#10 +
    '      DataNode: ListNode' + #13#10 +
    '    Items[2]: DirectiveNode' + #13#10 +
    '      SemicolonNode: Semicolon |;|' + #13#10 +
    '      KeywordNode: DeprecatedSemikeyword |deprecated|' + #13#10 +
    '      ValueNode: (none)' + #13#10 +
    '      DataNode: ListNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTMethodHeading));

  OK('procedure Foo; deprecated',
    TTestParser.ParsesAs('procedure Foo; deprecated',
    'MethodHeadingNode' + #13#10 +
    '  ClassKeywordNode: (none)' + #13#10 +
    '  MethodTypeNode: ProcedureKeyword |procedure|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  ParameterListNode: ListNode' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  ReturnTypeNode: (none)' + #13#10 +
    '  DirectiveListNode: ListNode' + #13#10 +
    '    Items[0]: DirectiveNode' + #13#10 +
    '      SemicolonNode: Semicolon |;|' + #13#10 +
    '      KeywordNode: DeprecatedSemikeyword |deprecated|' + #13#10 +
    '      ValueNode: (none)' + #13#10 +
    '      DataNode: ListNode' + #13#10 +
    '  SemicolonNode: (none)', RTMethodHeading));

  OK('procedure TFoo.Bar;', TTestParser.ParsesAs('procedure TFoo.Bar;',
    'MethodHeadingNode' + #13#10 +
    '  ClassKeywordNode: (none)' + #13#10 +
    '  MethodTypeNode: ProcedureKeyword |procedure|' + #13#10 +
    '  NameNode: BinaryOperationNode' + #13#10 +
    '    LeftNode: Identifier |TFoo|' + #13#10 +
    '    OperatorNode: Dot |.|' + #13#10 +
    '    RightNode: Identifier |Bar|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  ParameterListNode: ListNode' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  ReturnTypeNode: (none)' + #13#10 +
    '  DirectiveListNode: ListNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTMethodHeading));

  OK('procedure Foo();', TTestParser.ParsesAs('procedure Foo();',
    'MethodHeadingNode' + #13#10 +
    '  ClassKeywordNode: (none)' + #13#10 +
    '  MethodTypeNode: ProcedureKeyword |procedure|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '  ParameterListNode: ListNode' + #13#10 +
    '  CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  ReturnTypeNode: (none)' + #13#10 +
    '  DirectiveListNode: ListNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTMethodHeading));

  OK('procedure Foo(Sender: TObject; var CanClose: Boolean);',
    TTestParser.ParsesAs('procedure Foo(Sender: TObject; var CanClose: Boolean);',
    'MethodHeadingNode' + #13#10 +
    '  ClassKeywordNode: (none)' + #13#10 +
    '  MethodTypeNode: ProcedureKeyword |procedure|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '  ParameterListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: ParameterNode' + #13#10 +
    '        ModifierNode: (none)' + #13#10 +
    '        NameListNode: ListNode' + #13#10 +
    '          Items[0]: DelimitedItemNode' + #13#10 +
    '            ItemNode: Identifier |Sender|' + #13#10 +
    '            DelimiterNode: (none)' + #13#10 +
    '        ColonNode: Colon |:|' + #13#10 +
    '        TypeNode: Identifier |TObject|' + #13#10 +
    '        EqualSignNode: (none)' + #13#10 +
    '        DefaultValueNode: (none)' + #13#10 +
    '      DelimiterNode: Semicolon |;|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: ParameterNode' + #13#10 +
    '        ModifierNode: VarKeyword |var|' + #13#10 +
    '        NameListNode: ListNode' + #13#10 +
    '          Items[0]: DelimitedItemNode' + #13#10 +
    '            ItemNode: Identifier |CanClose|' + #13#10 +
    '            DelimiterNode: (none)' + #13#10 +
    '        ColonNode: Colon |:|' + #13#10 +
    '        TypeNode: Identifier |Boolean|' + #13#10 +
    '        EqualSignNode: (none)' + #13#10 +
    '        DefaultValueNode: (none)' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  ReturnTypeNode: (none)' + #13#10 +
    '  DirectiveListNode: ListNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTMethodHeading));

  OK('function Foo: Boolean;', TTestParser.ParsesAs('function Foo: Boolean;',
    'MethodHeadingNode' + #13#10 +
    '  ClassKeywordNode: (none)' + #13#10 +
    '  MethodTypeNode: FunctionKeyword |function|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  ParameterListNode: ListNode' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  ReturnTypeNode: Identifier |Boolean|' + #13#10 +
    '  DirectiveListNode: ListNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTMethodHeading));

  OK('class procedure Foo;', TTestParser.ParsesAs('class procedure Foo;',
    'MethodHeadingNode' + #13#10 +
    '  ClassKeywordNode: ClassKeyword |class|' + #13#10 +
    '  MethodTypeNode: ProcedureKeyword |procedure|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  ParameterListNode: ListNode' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  ReturnTypeNode: (none)' + #13#10 +
    '  DirectiveListNode: ListNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTMethodHeading));

  OK('class function Foo: Integer;',
    TTestParser.ParsesAs('class function Foo: Integer;',
    'MethodHeadingNode' + #13#10 +
    '  ClassKeywordNode: ClassKeyword |class|' + #13#10 +
    '  MethodTypeNode: FunctionKeyword |function|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  ParameterListNode: ListNode' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  ReturnTypeNode: Identifier |Integer|' + #13#10 +
    '  DirectiveListNode: ListNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTMethodHeading));

  OK('procedure IFoo.Bar = Baz;',
    TTestParser.ParsesAs('procedure IFoo.Bar = Baz;',
    'MethodResolutionNode' + #13#10 +
    '  MethodTypeNode: ProcedureKeyword |procedure|' + #13#10 +
    '  InterfaceMethodNode: BinaryOperationNode' + #13#10 +
    '    LeftNode: Identifier |IFoo|' + #13#10 +
    '    OperatorNode: Dot |.|' + #13#10 +
    '    RightNode: Identifier |Bar|' + #13#10 +
    '  EqualSignNode: EqualSign |=|' + #13#10 +
    '  ImplementationMethodNode: Identifier |Baz|' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTMethodHeading));

  OK('class operator Implicit(Value: Integer): TValue;',
    TTestParser.ParsesAs('class operator Implicit(Value: Integer): TValue;', 
    'MethodHeadingNode' + #13#10 +
    '  ClassKeywordNode: ClassKeyword |class|' + #13#10 +
    '  MethodTypeNode: OperatorSemikeyword |operator|' + #13#10 +
    '  NameNode: Identifier |Implicit|' + #13#10 +
    '  OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '  ParameterListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: ParameterNode' + #13#10 +
    '        ModifierNode: (none)' + #13#10 +
    '        NameListNode: ListNode' + #13#10 +
    '          Items[0]: DelimitedItemNode' + #13#10 +
    '            ItemNode: Identifier |Value|' + #13#10 +
    '            DelimiterNode: (none)' + #13#10 +
    '        ColonNode: Colon |:|' + #13#10 +
    '        TypeNode: Identifier |Integer|' + #13#10 +
    '        EqualSignNode: (none)' + #13#10 +
    '        DefaultValueNode: (none)' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  ReturnTypeNode: Identifier |TValue|' + #13#10 +
    '  DirectiveListNode: ListNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTMethodHeading));
end;
{$ELSE}

procedure TTestMethodHeading.TestProcedureFoo;
begin
  OK('procedure Foo;', TTestParser.ParsesAs('procedure Foo;',
    'MethodHeadingNode' + #13#10 +
    '  ClassKeywordNode: (none)' + #13#10 +
    '  MethodTypeNode: ProcedureKeyword |procedure|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  ParameterListNode: (none)' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  ReturnTypeNode: (none)' + #13#10 +
    '  DirectiveListNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTMethodHeading));
end;

procedure TTestMethodHeading.TestFunctionFoo;
begin
  OK('function Foo;', TTestParser.ParsesAs('function Foo;',
    'MethodHeadingNode' + #13#10 +
    '  ClassKeywordNode: (none)' + #13#10 +
    '  MethodTypeNode: FunctionKeyword |function|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  ParameterListNode: (none)' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  ReturnTypeNode: (none)' + #13#10 +
    '  DirectiveListNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTMethodHeading));
end;

procedure TTestMethodHeading.TestConstructorFoo;
begin
  OK('constructor Foo;', TTestParser.ParsesAs('constructor Foo;',
    'MethodHeadingNode' + #13#10 +
    '  ClassKeywordNode: (none)' + #13#10 +
    '  MethodTypeNode: ConstructorKeyword |constructor|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  ParameterListNode: (none)' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  ReturnTypeNode: (none)' + #13#10 +
    '  DirectiveListNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTMethodHeading));
end;

procedure TTestMethodHeading.TestDestructorFoo;
begin
  OK('destructor Foo; override;',
    TTestParser.ParsesAs('destructor Foo; override;',
    'MethodHeadingNode' + #13#10 +
    '  ClassKeywordNode: (none)' + #13#10 +
    '  MethodTypeNode: DestructorKeyword |destructor|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  ParameterListNode: (none)' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  ReturnTypeNode: (none)' + #13#10 +
    '  DirectiveListNode: ListNode' + #13#10 +
    '    Items[0]: DirectiveNode' + #13#10 +
    '      SemicolonNode: Semicolon |;|' + #13#10 +
    '      KeywordNode: OverrideSemikeyword |override|' + #13#10 +
    '      ValueNode: (none)' + #13#10 +
    '      DataNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTMethodHeading));
end;

procedure TTestMethodHeading.TestProcedureFooVirtualAbstractDeprecated;
begin
  OK('procedure Foo; virtual; abstract; deprecated;',
    TTestParser.ParsesAs('procedure Foo; virtual; abstract; deprecated;',
    'MethodHeadingNode' + #13#10 +
    '  ClassKeywordNode: (none)' + #13#10 +
    '  MethodTypeNode: ProcedureKeyword |procedure|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  ParameterListNode: (none)' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  ReturnTypeNode: (none)' + #13#10 +
    '  DirectiveListNode: ListNode' + #13#10 +
    '    Items[0]: DirectiveNode' + #13#10 +
    '      SemicolonNode: Semicolon |;|' + #13#10 +
    '      KeywordNode: VirtualSemikeyword |virtual|' + #13#10 +
    '      ValueNode: (none)' + #13#10 +
    '      DataNode: (none)' + #13#10 +
    '    Items[1]: DirectiveNode' + #13#10 +
    '      SemicolonNode: Semicolon |;|' + #13#10 +
    '      KeywordNode: AbstractSemikeyword |abstract|' + #13#10 +
    '      ValueNode: (none)' + #13#10 +
    '      DataNode: (none)' + #13#10 +
    '    Items[2]: DirectiveNode' + #13#10 +
    '      SemicolonNode: Semicolon |;|' + #13#10 +
    '      KeywordNode: DeprecatedSemikeyword |deprecated|' + #13#10 +
    '      ValueNode: (none)' + #13#10 +
    '      DataNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTMethodHeading));
end;

procedure TTestMethodHeading.TestNSStrStrNSStringDeprecatedString;
const
  CNSStrStrNSStringDeprecatedString: string =
    'function NSSTR(const Str: string): NSString; deprecated ''use StrToNSStr instead'';';
begin
  OK(CNSStrStrNSStringDeprecatedString, TTestParser.ParsesAs(CNSStrStrNSStringDeprecatedString,
    'MethodHeadingNode'+ #13#10 +
    '  ClassKeywordNode: (none)'+ #13#10 +
    '  MethodTypeNode: FunctionKeyword |function|'+ #13#10 +
    '  NameNode: Identifier |NSSTR|'+ #13#10 +
    '  OpenParenthesisNode: OpenParenthesis |(|'+ #13#10 +
    '  ParameterListNode: ListNode'+ #13#10 +
    '    Items[0]: DelimitedItemNode'+ #13#10 +
    '      ItemNode: ParameterNode'+ #13#10 +
    '        ModifierNode: ConstKeyword |const|'+ #13#10 +
    '        NameListNode: ListNode'+ #13#10 +
    '          Items[0]: DelimitedItemNode'+ #13#10 +
    '            ItemNode: IdentAttrNode'+ #13#10 +
    '              AttributesListNode: (none)'+ #13#10 +
    '              Ident: Identifier |Str|'+ #13#10 +
    '            DelimiterNode: (none)'+ #13#10 +
    '        ColonNode: Colon |:|'+ #13#10 +
    '        TypeNode: StringKeyword |string|'+ #13#10 +
    '        EqualSignNode: (none)'+ #13#10 +
    '        DefaultValueNode: (none)'+ #13#10 +
    '      DelimiterNode: (none)'+ #13#10 +
    '  CloseParenthesisNode: CloseParenthesis |)|'+ #13#10 +
    '  ColonNode: Colon |:|'+ #13#10 +
    '  ReturnTypeNode: Identifier |NSString|'+ #13#10 +
    '  DirectiveListNode: ListNode'+ #13#10 +
    '    Items[0]: DirectiveNode'+ #13#10 +
    '      SemicolonNode: Semicolon |;|'+ #13#10 +
    '      KeywordNode: DeprecatedSemikeyword |deprecated|'+ #13#10 +
    '      ValueNode: (none)'+ #13#10 +
    '      DataNode: StringLiteral |''use StrToNSStr instead''|'+ #13#10 +
    '  SemicolonNode: Semicolon |;|', RTMethodHeading));
end;

procedure TTestMethodHeading.TestProcedureFooDeprecated;
begin
  OK('procedure Foo; deprecated',
    TTestParser.ParsesAs('procedure Foo; deprecated',
    'MethodHeadingNode' + #13#10 +
    '  ClassKeywordNode: (none)' + #13#10 +
    '  MethodTypeNode: ProcedureKeyword |procedure|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  ParameterListNode: (none)' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  ReturnTypeNode: (none)' + #13#10 +
    '  DirectiveListNode: ListNode' + #13#10 +
    '    Items[0]: DirectiveNode' + #13#10 +
    '      SemicolonNode: Semicolon |;|' + #13#10 +
    '      KeywordNode: DeprecatedSemikeyword |deprecated|' + #13#10 +
    '      ValueNode: (none)' + #13#10 +
    '      DataNode: (none)' + #13#10 +
    '  SemicolonNode: (none)', RTMethodHeading));
end;

procedure TTestMethodHeading.TestProcedureTFooDOTBar;
begin
  OK('procedure TFoo.Bar;', TTestParser.ParsesAs('procedure TFoo.Bar;',
    'MethodHeadingNode' + #13#10 +
    '  ClassKeywordNode: (none)' + #13#10 +
    '  MethodTypeNode: ProcedureKeyword |procedure|' + #13#10 +
    '  NameNode: BinaryOperationNode' + #13#10 +
    '    LeftNode: Identifier |TFoo|' + #13#10 +
    '    OperatorNode: Dot |.|' + #13#10 +
    '    RightNode: Identifier |Bar|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  ParameterListNode: (none)' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  ReturnTypeNode: (none)' + #13#10 +
    '  DirectiveListNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTMethodHeading));
end;

procedure TTestMethodHeading.TestProcedureFooEmptyParenthesis;
begin
  OK('procedure Foo();', TTestParser.ParsesAs('procedure Foo();',
    'MethodHeadingNode' + #13#10 +
    '  ClassKeywordNode: (none)' + #13#10 +
    '  MethodTypeNode: ProcedureKeyword |procedure|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '  ParameterListNode: (none)' + #13#10 +
    '  CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  ReturnTypeNode: (none)' + #13#10 +
    '  DirectiveListNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTMethodHeading));
end;

procedure TTestMethodHeading.TestMethodFooSenderCanCloseSemicolon;
const
  CMethodFooSenderCanClose: string =
    'procedure Foo(Sender: TObject; var CanClose: Boolean);';
begin
  OK(CMethodFooSenderCanClose,
    TTestParser.ParsesAs(CMethodFooSenderCanClose,
     'MethodHeadingNode'+ #13#10 +
     '  ClassKeywordNode: (none)'+ #13#10 +
     '  MethodTypeNode: ProcedureKeyword |procedure|'+ #13#10 +
     '  NameNode: Identifier |Foo|'+ #13#10 +
     '  OpenParenthesisNode: OpenParenthesis |(|'+ #13#10 +
     '  ParameterListNode: ListNode'+ #13#10 +
     '    Items[0]: DelimitedItemNode'+ #13#10 +
     '      ItemNode: ParameterNode'+ #13#10 +
     '        ModifierNode: (none)'+ #13#10 +
     '        NameListNode: ListNode'+ #13#10 +
     '          Items[0]: DelimitedItemNode'+ #13#10 +
     '            ItemNode: IdentAttrNode'+ #13#10 +
     '              AttributesListNode: (none)'+ #13#10 +
     '              Ident: Identifier |Sender|'+ #13#10 +
     '            DelimiterNode: (none)'+ #13#10 +
     '        ColonNode: Colon |:|'+ #13#10 +
     '        TypeNode: Identifier |TObject|'+ #13#10 +
     '        EqualSignNode: (none)'+ #13#10 +
     '        DefaultValueNode: (none)'+ #13#10 +
     '      DelimiterNode: Semicolon |;|'+ #13#10 +
     '    Items[1]: DelimitedItemNode'+ #13#10 +
     '      ItemNode: ParameterNode'+ #13#10 +
     '        ModifierNode: VarKeyword |var|'+ #13#10 +
     '        NameListNode: ListNode'+ #13#10 +
     '          Items[0]: DelimitedItemNode'+ #13#10 +
     '            ItemNode: IdentAttrNode'+ #13#10 +
     '              AttributesListNode: (none)'+ #13#10 +
     '              Ident: Identifier |CanClose|'+ #13#10 +
     '            DelimiterNode: (none)'+ #13#10 +
     '        ColonNode: Colon |:|'+ #13#10 +
     '        TypeNode: Identifier |Boolean|'+ #13#10 +
     '        EqualSignNode: (none)'+ #13#10 +
     '        DefaultValueNode: (none)'+ #13#10 +
     '      DelimiterNode: (none)'+ #13#10 +
     '  CloseParenthesisNode: CloseParenthesis |)|'+ #13#10 +
     '  ColonNode: (none)'+ #13#10 +
     '  ReturnTypeNode: (none)'+ #13#10 +
     '  DirectiveListNode: (none)'+ #13#10 +
     '  SemicolonNode: Semicolon |;|', RTMethodHeading));
end;

procedure TTestMethodHeading.TestFunctionFooBoolean;
const
  CFunctionFooBoolean: string = 'function Foo: Boolean;';
begin
  OK(CFunctionFooBoolean, TTestParser.ParsesAs(CFunctionFooBoolean,
    'MethodHeadingNode' + #13#10 +
    '  ClassKeywordNode: (none)' + #13#10 +
    '  MethodTypeNode: FunctionKeyword |function|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  ParameterListNode: (none)' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  ReturnTypeNode: Identifier |Boolean|' + #13#10 +
    '  DirectiveListNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTMethodHeading));
end;

procedure TTestMethodHeading.TestClassProcedureFoo;
const
  CClassProcedureFoo: string = 'class procedure Foo;';
begin
  OK(CClassProcedureFoo, TTestParser.ParsesAs(CClassProcedureFoo,
    'MethodHeadingNode' + #13#10 +
    '  ClassKeywordNode: ClassKeyword |class|' + #13#10 +
    '  MethodTypeNode: ProcedureKeyword |procedure|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  ParameterListNode: (none)' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  ReturnTypeNode: (none)' + #13#10 +
    '  DirectiveListNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTMethodHeading));
end;

procedure TTestMethodHeading.TestClassFunctionFooInteger;
const
  CClassFunctionFooInteger: string = 'class function Foo: Integer;';
begin
  OK(CClassFunctionFooInteger,
    TTestParser.ParsesAs(CClassFunctionFooInteger,
    'MethodHeadingNode' + #13#10 +
    '  ClassKeywordNode: ClassKeyword |class|' + #13#10 +
    '  MethodTypeNode: FunctionKeyword |function|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  ParameterListNode: (none)' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  ReturnTypeNode: Identifier |Integer|' + #13#10 +
    '  DirectiveListNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTMethodHeading));
end;

procedure TTestMethodHeading.TestMethodResolutionIFooDotBarEqualBaz;
const
  CMethodResolutionIFooDotBarEqualBaz: string = 'procedure IFoo.Bar = Baz;';
begin
  OK(CMethodResolutionIFooDotBarEqualBaz,
    TTestParser.ParsesAs(CMethodResolutionIFooDotBarEqualBaz,
    'MethodResolutionNode' + #13#10 +
    '  MethodTypeNode: ProcedureKeyword |procedure|' + #13#10 +
    '  InterfaceMethodNode: BinaryOperationNode' + #13#10 +
    '    LeftNode: Identifier |IFoo|' + #13#10 +
    '    OperatorNode: Dot |.|' + #13#10 +
    '    RightNode: Identifier |Bar|' + #13#10 +
    '  EqualSignNode: EqualSign |=|' + #13#10 +
    '  ImplementationMethodNode: Identifier |Baz|' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTMethodHeading));
end;

procedure TTestMethodHeading.TestClassOperatorImplicitValueValue;
const
  CClassOperatorImplicitValueValue: string =
    'class operator Implicit(Value: Integer): TValue;';
begin
  OK(CClassOperatorImplicitValueValue,
    TTestParser.ParsesAs(CClassOperatorImplicitValueValue,
     'MethodHeadingNode'+ #13#10 +
     '  ClassKeywordNode: ClassKeyword |class|'+ #13#10 +
     '  MethodTypeNode: OperatorSemikeyword |operator|'+ #13#10 +
     '  NameNode: Identifier |Implicit|'+ #13#10 +
     '  OpenParenthesisNode: OpenParenthesis |(|'+ #13#10 +
     '  ParameterListNode: ListNode'+ #13#10 +
     '    Items[0]: DelimitedItemNode'+ #13#10 +
     '      ItemNode: ParameterNode'+ #13#10 +
     '        ModifierNode: (none)'+ #13#10 +
     '        NameListNode: ListNode'+ #13#10 +
     '          Items[0]: DelimitedItemNode'+ #13#10 +
     '            ItemNode: IdentAttrNode'+ #13#10 +
     '              AttributesListNode: (none)'+ #13#10 +
     '              Ident: Identifier |Value|'+ #13#10 +
     '            DelimiterNode: (none)'+ #13#10 +
     '        ColonNode: Colon |:|'+ #13#10 +
     '        TypeNode: Identifier |Integer|'+ #13#10 +
     '        EqualSignNode: (none)'+ #13#10 +
     '        DefaultValueNode: (none)'+ #13#10 +
     '      DelimiterNode: (none)'+ #13#10 +
     '  CloseParenthesisNode: CloseParenthesis |)|'+ #13#10 +
     '  ColonNode: Colon |:|'+ #13#10 +
     '  ReturnTypeNode: Identifier |TValue|'+ #13#10 +
     '  DirectiveListNode: (none)'+ #13#10 +
     '  SemicolonNode: Semicolon |;|', RTMethodHeading));
end;

initialization
  RegisterTest(TTestMethodHeading.Suite);
{$ENDIF}
end.
