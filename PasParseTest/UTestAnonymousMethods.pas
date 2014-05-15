unit UTestAnonymousMethods;

interface

uses
  UTest;

type
  TTestAnonymousMethod = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestAnonymousMethodUsageSimpleExpression;
    procedure TestAnonymousMethodDeclVarRef;
    procedure TestAnonymousMethodTypeDefinition;
    procedure TestAnonymousMethodDeclRefProc;
    procedure TestAnonymousMethodDeclRefFunc;
    procedure TestAnonymousMethodUsageCRefAsgn1;
    procedure TestAnonymousMethodUsageCRefAsgn2;
    procedure TestAnonymousMethodUsageCRefAsgn3;
    procedure TestAnonymousMethodUsageCRefParam1;
    procedure TestAnonymousMethodUsageCRefParam2;
    procedure TestAnonymousMethodUsageCRefWholeBlock;

{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType
  {$IF DEFINED(DUNIT)},
    TestFramework, UParser, UCompilerDefines
  {$ENDIF};

{ TTestAnonymousMethod }
{$IF NOT DEFINED(DUNIT)}
class function TTestAnonymousMethod.GetName: string;
begin
  Result := 'AnonymousMethod';
end;

class procedure TTestAnonymousMethod.TestAll;
begin
end;
{$ELSE}

procedure TTestAnonymousMethod.TestAnonymousMethodDeclVarRef;
const
  CRefProc: string = 'Foo: reference to procedure;';
type
  TRefProc = reference to procedure;
var
//  Foo: reference to procedure; // undeclared identifier reference
  Foo: TRefProc;
begin
  OK(CRefProc, False); // should fail to parse
end;

procedure TTestAnonymousMethod.TestAnonymousMethodTypeDefinition;
const
  CRefProc: string = 'TRefProc = reference to procedure;';
type
  TRefProc = reference to procedure;
var
//  Foo: reference to procedure; // undeclared identifier reference
  Foo: TRefProc;
begin
  OK(CRefProc, TTestParser.ParsesAs(CRefProc,
    'TypeDeclNode'+ #13#10 +
    '  AttributesListNode: (none)'+ #13#10 +
    '  NameNode: Identifier |TRefProc|'+ #13#10 +
    '  TypeParams: (none)'+ #13#10 +
    '  EqualSignNode: EqualSign |=|'+ #13#10 +
    '  TypeKeywordNode: (none)'+ #13#10 +
    '  TypeNode: AnonymousMethodTypeNode'+ #13#10 +
    '    ReferenceKeywordNode: ReferenceSemikeyword |reference|'+ #13#10 +
    '    ToKeywordNode: ToKeyword |to|'+ #13#10 +
    '    MethodNode: ProcedureTypeNode'+ #13#10 +
    '      MethodTypeNode: ProcedureKeyword |procedure|'+ #13#10 +
    '      OpenParenthesisNode: (none)'+ #13#10 +
    '      ParameterListNode: (none)'+ #13#10 +
    '      CloseParenthesisNode: (none)'+ #13#10 +
    '      ColonNode: (none)'+ #13#10 +
    '      ReturnTypeNode: (none)'+ #13#10 +
    '      FirstDirectiveListNode: (none)'+ #13#10 +
    '      OfKeywordNode: (none)'+ #13#10 +
    '      ObjectKeywordNode: (none)'+ #13#10 +
    '      SecondDirectiveListNode: (none)'+ #13#10 +
    '  PortabilityDirectiveListNode: (none)'+ #13#10 +
    '  SemicolonNode: Semicolon |;|', RTTypeDecl));
end;

procedure TTestAnonymousMethod.TestAnonymousMethodDeclRefProc;
const
  CRefProc: string = 'Foo: reference to procedure;';
type
  TRefProc = reference to procedure;
var
//  Foo: reference to procedure; // undeclared identifier reference
  Foo: TRefProc;
  AParser: TParser;
  ACompilerDefines: TCompilerDefines;
begin
  ACompilerDefines := TCompilerDefines.Create;
  AParser := TParser.CreateFromText(CRefProc, '', ACompilerDefines, nil);
  try
    OK(CRefProc, not AParser.CanParseRule(RTVarDecl));

  finally
    AParser.Free;
    ACompilerDefines.Free;
  end;
end;

procedure TTestAnonymousMethod.TestAnonymousMethodUsageSimpleExpression;
const
  CRefCallSimpleExpr: string = 'CallFunc(procedure begin end, 0)';
begin
  OK(CRefCallSimpleExpr, TTestParser.ParsesAs(CRefCallSimpleExpr,
     'ParameterizedNode'+ #13#10 +
     '  LeftNode: Identifier |CallFunc|'+ #13#10 +
     '  OpenDelimiterNode: OpenParenthesis |(|'+ #13#10 +
     '  ParameterListNode: ListNode'+ #13#10 +
     '    Items[0]: DelimitedItemNode'+ #13#10 +
     '      ItemNode: AnonymousMethodDeclNode'+ #13#10 +
     '        MethodNode: ProcedureTypeNode'+ #13#10 +
     '          MethodTypeNode: ProcedureKeyword |procedure|'+ #13#10 +
     '          OpenParenthesisNode: (none)'+ #13#10 +
     '          ParameterListNode: (none)'+ #13#10 +
     '          CloseParenthesisNode: (none)'+ #13#10 +
     '          ColonNode: (none)'+ #13#10 +
     '          ReturnTypeNode: (none)'+ #13#10 +
     '          FirstDirectiveListNode: (none)'+ #13#10 +
     '          OfKeywordNode: (none)'+ #13#10 +
     '          ObjectKeywordNode: (none)'+ #13#10 +
     '          SecondDirectiveListNode: (none)'+ #13#10 +
     '        FancyBlockNode: FancyBlockNode'+ #13#10 +
     '          DeclListNode: (none)'+ #13#10 +
     '          BlockNode: BlockNode'+ #13#10 +
     '            BeginKeywordNode: BeginKeyword |begin|'+ #13#10 +
     '            StatementListNode: (none)'+ #13#10 +
     '            EndKeywordNode: EndKeyword |end|'+ #13#10 +
     '      DelimiterNode: Comma |,|'+ #13#10 +
     '    Items[1]: DelimitedItemNode'+ #13#10 +
     '      ItemNode: Number |0|'+ #13#10 +
     '      DelimiterNode: (none)'+ #13#10 +
     '  CloseDelimiterNode: CloseParenthesis |)|', RTSimpleExpression));
end;

procedure TTestAnonymousMethod.TestAnonymousMethodDeclRefFunc;
const
  CRefFunc: string = 'Foo: reference to function: Boolean;';
begin
  OK(CRefFunc, TTestParser.ParsesAs(CRefFunc,
    'VarDeclNode'+ #13#10 +
    '  NameListNode: ListNode'+ #13#10 +
    '    Items[0]: DelimitedItemNode'+ #13#10 +
    '      ItemNode: Identifier |Foo|'+ #13#10 +
    '      DelimiterNode: (none)'+ #13#10 +
    '  ColonNode: Colon |:|'+ #13#10 +
    '  TypeNode: AnonymousMethodTypeNode'+ #13#10 +
    '    ReferenceKeywordNode: ReferenceSemikeyword |reference|'+ #13#10 +
    '    ToKeywordNode: ToKeyword |to|'+ #13#10 +
    '    MethodNode: ProcedureTypeNode'+ #13#10 +
    '      MethodTypeNode: FunctionKeyword |function|'+ #13#10 +
    '      OpenParenthesisNode: (none)'+ #13#10 +
    '      ParameterListNode: (none)'+ #13#10 +
    '      CloseParenthesisNode: (none)'+ #13#10 +
    '      ColonNode: Colon |:|'+ #13#10 +
    '      ReturnTypeNode: Identifier |Boolean|'+ #13#10 +
    '      FirstDirectiveListNode: (none)'+ #13#10 +
    '      OfKeywordNode: (none)'+ #13#10 +
    '      ObjectKeywordNode: (none)'+ #13#10 +
    '      SecondDirectiveListNode: (none)'+ #13#10 +
    '  FirstPortabilityDirectiveListNode: (none)'+ #13#10 +
    '  AbsoluteSemikeywordNode: (none)'+ #13#10 +
    '  AbsoluteAddressNode: (none)'+ #13#10 +
    '  EqualSignNode: (none)'+ #13#10 +
    '  ValueNode: (none)'+ #13#10 +
    '  SecondPortabilityDirectiveListNode: (none)'+ #13#10 +
    '  SemicolonNode: Semicolon |;|', RTVarDecl));
end;

type
  TX = reference to procedure;

procedure CallFunc(x: TX); overload;
begin
  x;
end;

procedure CallFunc(x: TX; Y: Integer); overload;
begin
  x; y := 0;
end;

procedure TestCRefAsgn;
var
  x: TX;
begin
  x := procedure begin end; // to test that the syntax in CRefAsgn is correct
  x := procedure var y: Integer; begin y := 0; end;
  CallFunc(procedure begin end); // to test the syntax in CRefParam is correct
  CallFunc(procedure begin end, 0);
end;

procedure TTestAnonymousMethod.TestAnonymousMethodUsageCRefAsgn1;
const
  CRefAsgn1: string = 'begin x := procedure begin end; end';
begin
  OK(CRefAsgn1, TTestParser.ParsesAs(CRefAsgn1,
     'FancyBlockNode'+ #13#10 +
     '  DeclListNode: (none)'+ #13#10 +
     '  BlockNode: BlockNode'+ #13#10 +
     '    BeginKeywordNode: BeginKeyword |begin|'+ #13#10 +
     '    StatementListNode: ListNode'+ #13#10 +
     '      Items[0]: DelimitedItemNode'+ #13#10 +
     '        ItemNode: BinaryOperationNode'+ #13#10 +
     '          LeftNode: Identifier |x|'+ #13#10 +
     '          OperatorNode: ColonEquals |:=|'+ #13#10 +
     '          RightNode: AnonymousMethodDeclNode'+ #13#10 +
     '            MethodNode: ProcedureTypeNode'+ #13#10 +
     '              MethodTypeNode: ProcedureKeyword |procedure|'+ #13#10 +
     '              OpenParenthesisNode: (none)'+ #13#10 +
     '              ParameterListNode: (none)'+ #13#10 +
     '              CloseParenthesisNode: (none)'+ #13#10 +
     '              ColonNode: (none)'+ #13#10 +
     '              ReturnTypeNode: (none)'+ #13#10 +
     '              FirstDirectiveListNode: (none)'+ #13#10 +
     '              OfKeywordNode: (none)'+ #13#10 +
     '              ObjectKeywordNode: (none)'+ #13#10 +
     '              SecondDirectiveListNode: (none)'+ #13#10 +
     '            FancyBlockNode: FancyBlockNode'+ #13#10 +
     '              DeclListNode: (none)'+ #13#10 +
     '              BlockNode: BlockNode'+ #13#10 +
     '                BeginKeywordNode: BeginKeyword |begin|'+ #13#10 +
     '                StatementListNode: (none)'+ #13#10 +
     '                EndKeywordNode: EndKeyword |end|'+ #13#10 +
     '        DelimiterNode: Semicolon |;|'+ #13#10 +
     '    EndKeywordNode: EndKeyword |end|', RTFancyBlock)); // DONE -ochuacw: Fix empty string to expected parse result
end;

procedure TTestAnonymousMethod.TestAnonymousMethodUsageCRefAsgn2;
const
  CRefAsgn2: string = 'begin x := procedure var y: Integer; begin end; end';
begin
  OK(CRefAsgn2, TTestParser.ParsesAs(CRefAsgn2,
     'FancyBlockNode'+ #13#10 +
     '  DeclListNode: (none)'+ #13#10 +
     '  BlockNode: BlockNode'+ #13#10 +
     '    BeginKeywordNode: BeginKeyword |begin|'+ #13#10 +
     '    StatementListNode: ListNode'+ #13#10 +
     '      Items[0]: DelimitedItemNode'+ #13#10 +
     '        ItemNode: BinaryOperationNode'+ #13#10 +
     '          LeftNode: Identifier |x|'+ #13#10 +
     '          OperatorNode: ColonEquals |:=|'+ #13#10 +
     '          RightNode: AnonymousMethodDeclNode'+ #13#10 +
     '            MethodNode: ProcedureTypeNode'+ #13#10 +
     '              MethodTypeNode: ProcedureKeyword |procedure|'+ #13#10 +
     '              OpenParenthesisNode: (none)'+ #13#10 +
     '              ParameterListNode: (none)'+ #13#10 +
     '              CloseParenthesisNode: (none)'+ #13#10 +
     '              ColonNode: (none)'+ #13#10 +
     '              ReturnTypeNode: (none)'+ #13#10 +
     '              FirstDirectiveListNode: (none)'+ #13#10 +
     '              OfKeywordNode: (none)'+ #13#10 +
     '              ObjectKeywordNode: (none)'+ #13#10 +
     '              SecondDirectiveListNode: (none)'+ #13#10 +
     '            FancyBlockNode: FancyBlockNode'+ #13#10 +
     '              DeclListNode: ListNode'+ #13#10 +
     '                Items[0]: VarSectionNode'+ #13#10 +
     '                  VarKeywordNode: VarKeyword |var|'+ #13#10 +
     '                  VarListNode: ListNode'+ #13#10 +
     '                    Items[0]: VarDeclNode'+ #13#10 +
     '                      NameListNode: ListNode'+ #13#10 +
     '                        Items[0]: DelimitedItemNode'+ #13#10 +
     '                          ItemNode: Identifier |y|'+ #13#10 +
     '                          DelimiterNode: (none)'+ #13#10 +
     '                      ColonNode: Colon |:|'+ #13#10 +
     '                      TypeNode: Identifier |Integer|'+ #13#10 +
     '                      FirstPortabilityDirectiveListNode: (none)'+ #13#10 +
     '                      AbsoluteSemikeywordNode: (none)'+ #13#10 +
     '                      AbsoluteAddressNode: (none)'+ #13#10 +
     '                      EqualSignNode: (none)'+ #13#10 +
     '                      ValueNode: (none)'+ #13#10 +
     '                      SecondPortabilityDirectiveListNode: (none)'+ #13#10 +
     '                      SemicolonNode: Semicolon |;|'+ #13#10 +
     '              BlockNode: BlockNode'+ #13#10 +
     '                BeginKeywordNode: BeginKeyword |begin|'+ #13#10 +
     '                StatementListNode: (none)'+ #13#10 +
     '                EndKeywordNode: EndKeyword |end|'+ #13#10 +
     '        DelimiterNode: Semicolon |;|'+ #13#10 +
     '    EndKeywordNode: EndKeyword |end|', RTFancyBlock));
end;

procedure TTestAnonymousMethod.TestAnonymousMethodUsageCRefAsgn3;
const
  CRefAsgn3: string = 'begin x := procedure begin end end';
begin
  OK(CRefAsgn3, TTestParser.ParsesAs(CRefAsgn3,
     'FancyBlockNode'+ #13#10 +
     '  DeclListNode: (none)'+ #13#10 +
     '  BlockNode: BlockNode'+ #13#10 +
     '    BeginKeywordNode: BeginKeyword |begin|'+ #13#10 +
     '    StatementListNode: ListNode'+ #13#10 +
     '      Items[0]: DelimitedItemNode'+ #13#10 +
     '        ItemNode: BinaryOperationNode'+ #13#10 +
     '          LeftNode: Identifier |x|'+ #13#10 +
     '          OperatorNode: ColonEquals |:=|'+ #13#10 +
     '          RightNode: AnonymousMethodDeclNode'+ #13#10 +
     '            MethodNode: ProcedureTypeNode'+ #13#10 +
     '              MethodTypeNode: ProcedureKeyword |procedure|'+ #13#10 +
     '              OpenParenthesisNode: (none)'+ #13#10 +
     '              ParameterListNode: (none)'+ #13#10 +
     '              CloseParenthesisNode: (none)'+ #13#10 +
     '              ColonNode: (none)'+ #13#10 +
     '              ReturnTypeNode: (none)'+ #13#10 +
     '              FirstDirectiveListNode: (none)'+ #13#10 +
     '              OfKeywordNode: (none)'+ #13#10 +
     '              ObjectKeywordNode: (none)'+ #13#10 +
     '              SecondDirectiveListNode: (none)'+ #13#10 +
     '            FancyBlockNode: FancyBlockNode'+ #13#10 +
     '              DeclListNode: (none)'+ #13#10 +
     '              BlockNode: BlockNode'+ #13#10 +
     '                BeginKeywordNode: BeginKeyword |begin|'+ #13#10 +
     '                StatementListNode: (none)'+ #13#10 +
     '                EndKeywordNode: EndKeyword |end|'+ #13#10 +
     '        DelimiterNode: (none)'+ #13#10 +
     '    EndKeywordNode: EndKeyword |end|', RTFancyBlock));
end;

procedure TTestAnonymousMethod.TestAnonymousMethodUsageCRefParam1;
const
  CRefParam1: string = 'begin CallFunc(procedure begin end); end';
begin
  OK(CRefParam1, TTestParser.ParsesAs(CRefParam1,
     'FancyBlockNode'+ #13#10 +
     '  DeclListNode: (none)'+ #13#10 +
     '  BlockNode: BlockNode'+ #13#10 +
     '    BeginKeywordNode: BeginKeyword |begin|'+ #13#10 +
     '    StatementListNode: ListNode'+ #13#10 +
     '      Items[0]: DelimitedItemNode'+ #13#10 +
     '        ItemNode: ParameterizedNode'+ #13#10 +
     '          LeftNode: Identifier |CallFunc|'+ #13#10 +
     '          OpenDelimiterNode: OpenParenthesis |(|'+ #13#10 +
     '          ParameterListNode: ListNode'+ #13#10 +
     '            Items[0]: DelimitedItemNode'+ #13#10 +
     '              ItemNode: AnonymousMethodDeclNode'+ #13#10 +
     '                MethodNode: ProcedureTypeNode'+ #13#10 +
     '                  MethodTypeNode: ProcedureKeyword |procedure|'+ #13#10 +
     '                  OpenParenthesisNode: (none)'+ #13#10 +
     '                  ParameterListNode: (none)'+ #13#10 +
     '                  CloseParenthesisNode: (none)'+ #13#10 +
     '                  ColonNode: (none)'+ #13#10 +
     '                  ReturnTypeNode: (none)'+ #13#10 +
     '                  FirstDirectiveListNode: (none)'+ #13#10 +
     '                  OfKeywordNode: (none)'+ #13#10 +
     '                  ObjectKeywordNode: (none)'+ #13#10 +
     '                  SecondDirectiveListNode: (none)'+ #13#10 +
     '                FancyBlockNode: FancyBlockNode'+ #13#10 +
     '                  DeclListNode: (none)'+ #13#10 +
     '                  BlockNode: BlockNode'+ #13#10 +
     '                    BeginKeywordNode: BeginKeyword |begin|'+ #13#10 +
     '                    StatementListNode: (none)'+ #13#10 +
     '                    EndKeywordNode: EndKeyword |end|'+ #13#10 +
     '              DelimiterNode: (none)'+ #13#10 +
     '          CloseDelimiterNode: CloseParenthesis |)|'+ #13#10 +
     '        DelimiterNode: Semicolon |;|'+ #13#10 +
     '    EndKeywordNode: EndKeyword |end|', RTFancyBlock));
end;

procedure TTestAnonymousMethod.TestAnonymousMethodUsageCRefParam2;
const
  CRefParam2: string = 'begin CallFunc(procedure begin end, 0); end';
begin
  OK(CRefParam2, TTestParser.ParsesAs(CRefParam2,
    'FancyBlockNode'+ #13#10 +
    '  DeclListNode: (none)'+ #13#10 +
    '  BlockNode: BlockNode'+ #13#10 +
    '    BeginKeywordNode: BeginKeyword |begin|'+ #13#10 +
    '    StatementListNode: ListNode'+ #13#10 +
    '      Items[0]: DelimitedItemNode'+ #13#10 +
    '        ItemNode: ParameterizedNode'+ #13#10 +
    '          LeftNode: Identifier |CallFunc|'+ #13#10 +
    '          OpenDelimiterNode: OpenParenthesis |(|'+ #13#10 +
    '          ParameterListNode: ListNode'+ #13#10 +
    '            Items[0]: DelimitedItemNode'+ #13#10 +
    '              ItemNode: AnonymousMethodDeclNode'+ #13#10 +
    '                MethodNode: ProcedureTypeNode'+ #13#10 +
    '                  MethodTypeNode: ProcedureKeyword |procedure|'+ #13#10 +
    '                  OpenParenthesisNode: (none)'+ #13#10 +
    '                  ParameterListNode: (none)'+ #13#10 +
    '                  CloseParenthesisNode: (none)'+ #13#10 +
    '                  ColonNode: (none)'+ #13#10 +
    '                  ReturnTypeNode: (none)'+ #13#10 +
    '                  FirstDirectiveListNode: (none)'+ #13#10 +
    '                  OfKeywordNode: (none)'+ #13#10 +
    '                  ObjectKeywordNode: (none)'+ #13#10 +
    '                  SecondDirectiveListNode: (none)'+ #13#10 +
    '                FancyBlockNode: FancyBlockNode'+ #13#10 +
    '                  DeclListNode: (none)'+ #13#10 +
    '                  BlockNode: BlockNode'+ #13#10 +
    '                    BeginKeywordNode: BeginKeyword |begin|'+ #13#10 +
    '                    StatementListNode: (none)'+ #13#10 +
    '                    EndKeywordNode: EndKeyword |end|'+ #13#10 +
    '              DelimiterNode: Comma |,|'+ #13#10 +
    '            Items[1]: DelimitedItemNode'+ #13#10 +
    '              ItemNode: Number |0|'+ #13#10 +
    '              DelimiterNode: (none)'+ #13#10 +
    '          CloseDelimiterNode: CloseParenthesis |)|'+ #13#10 +
    '        DelimiterNode: Semicolon |;|'+ #13#10 +
    '    EndKeywordNode: EndKeyword |end|', RTFancyBlock));
end;

procedure TTestAnonymousMethod.TestAnonymousMethodUsageCRefWholeBlock;
const
  CRefWholeBlock: string = 'procedure TestCRefAsgn;' + #13#10 +
    'var' + #13#10 +
    '  x: TX;' + #13#10 +
    'begin' + #13#10 +
    '  x := procedure begin end; // to test that the syntax in CRefAsgn is correct' + #13#10 +
    '  CallFunc(procedure begin end); // to test the syntax in CRefParam is correct' + #13#10 +
    'end;';
begin
  // DONE -ochuacw: Fix the expected string
  OK(CRefWholeBlock, TTestParser.ParsesAs(CRefWholeBlock,
    'MethodImplementationNode'+ #13#10 +
    '  MethodHeadingNode: MethodHeadingNode'+ #13#10 +
    '    ClassKeywordNode: (none)'+ #13#10 +
    '    MethodTypeNode: ProcedureKeyword |procedure|'+ #13#10 +
    '    NameNode: Identifier |TestCRefAsgn|'+ #13#10 +
    '    OpenParenthesisNode: (none)'+ #13#10 +
    '    ParameterListNode: (none)'+ #13#10 +
    '    CloseParenthesisNode: (none)'+ #13#10 +
    '    ColonNode: (none)'+ #13#10 +
    '    ReturnTypeNode: (none)'+ #13#10 +
    '    DirectiveListNode: (none)'+ #13#10 +
    '    SemicolonNode: Semicolon |;|'+ #13#10 +
    '  FancyBlockNode: FancyBlockNode'+ #13#10 +
    '    DeclListNode: ListNode'+ #13#10 +
    '      Items[0]: VarSectionNode'+ #13#10 +
    '        VarKeywordNode: VarKeyword |var|'+ #13#10 +
    '        VarListNode: ListNode'+ #13#10 +
    '          Items[0]: VarDeclNode'+ #13#10 +
    '            NameListNode: ListNode'+ #13#10 +
    '              Items[0]: DelimitedItemNode'+ #13#10 +
    '                ItemNode: Identifier |x|'+ #13#10 +
    '                DelimiterNode: (none)'+ #13#10 +
    '            ColonNode: Colon |:|'+ #13#10 +
    '            TypeNode: Identifier |TX|'+ #13#10 +
    '            FirstPortabilityDirectiveListNode: (none)'+ #13#10 +
    '            AbsoluteSemikeywordNode: (none)'+ #13#10 +
    '            AbsoluteAddressNode: (none)'+ #13#10 +
    '            EqualSignNode: (none)'+ #13#10 +
    '            ValueNode: (none)'+ #13#10 +
    '            SecondPortabilityDirectiveListNode: (none)'+ #13#10 +
    '            SemicolonNode: Semicolon |;|'+ #13#10 +
    '    BlockNode: BlockNode'+ #13#10 +
    '      BeginKeywordNode: BeginKeyword |begin|'+ #13#10 +
    '      StatementListNode: ListNode'+ #13#10 +
    '        Items[0]: DelimitedItemNode'+ #13#10 +
    '          ItemNode: BinaryOperationNode'+ #13#10 +
    '            LeftNode: Identifier |x|'+ #13#10 +
    '            OperatorNode: ColonEquals |:=|'+ #13#10 +
    '            RightNode: AnonymousMethodDeclNode'+ #13#10 +
    '              MethodNode: ProcedureTypeNode'+ #13#10 +
    '                MethodTypeNode: ProcedureKeyword |procedure|'+ #13#10 +
    '                OpenParenthesisNode: (none)'+ #13#10 +
    '                ParameterListNode: (none)'+ #13#10 +
    '                CloseParenthesisNode: (none)'+ #13#10 +
    '                ColonNode: (none)'+ #13#10 +
    '                ReturnTypeNode: (none)'+ #13#10 +
    '                FirstDirectiveListNode: (none)'+ #13#10 +
    '                OfKeywordNode: (none)'+ #13#10 +
    '                ObjectKeywordNode: (none)'+ #13#10 +
    '                SecondDirectiveListNode: (none)'+ #13#10 +
    '              FancyBlockNode: FancyBlockNode'+ #13#10 +
    '                DeclListNode: (none)'+ #13#10 +
    '                BlockNode: BlockNode'+ #13#10 +
    '                  BeginKeywordNode: BeginKeyword |begin|'+ #13#10 +
    '                  StatementListNode: (none)'+ #13#10 +
    '                  EndKeywordNode: EndKeyword |end|'+ #13#10 +
    '          DelimiterNode: Semicolon |;|'+ #13#10 +
    '        Items[1]: DelimitedItemNode'+ #13#10 +
    '          ItemNode: ParameterizedNode'+ #13#10 +
    '            LeftNode: Identifier |CallFunc|'+ #13#10 +
    '            OpenDelimiterNode: OpenParenthesis |(|'+ #13#10 +
    '            ParameterListNode: ListNode'+ #13#10 +
    '              Items[0]: DelimitedItemNode'+ #13#10 +
    '                ItemNode: AnonymousMethodDeclNode'+ #13#10 +
    '                  MethodNode: ProcedureTypeNode'+ #13#10 +
    '                    MethodTypeNode: ProcedureKeyword |procedure|'+ #13#10 +
    '                    OpenParenthesisNode: (none)'+ #13#10 +
    '                    ParameterListNode: (none)'+ #13#10 +
    '                    CloseParenthesisNode: (none)'+ #13#10 +
    '                    ColonNode: (none)'+ #13#10 +
    '                    ReturnTypeNode: (none)'+ #13#10 +
    '                    FirstDirectiveListNode: (none)'+ #13#10 +
    '                    OfKeywordNode: (none)'+ #13#10 +
    '                    ObjectKeywordNode: (none)'+ #13#10 +
    '                    SecondDirectiveListNode: (none)'+ #13#10 +
    '                  FancyBlockNode: FancyBlockNode'+ #13#10 +
    '                    DeclListNode: (none)'+ #13#10 +
    '                    BlockNode: BlockNode'+ #13#10 +
    '                      BeginKeywordNode: BeginKeyword |begin|'+ #13#10 +
    '                      StatementListNode: (none)'+ #13#10 +
    '                      EndKeywordNode: EndKeyword |end|'+ #13#10 +
    '                DelimiterNode: (none)'+ #13#10 +
    '            CloseDelimiterNode: CloseParenthesis |)|'+ #13#10 +
    '          DelimiterNode: Semicolon |;|'+ #13#10 +
    '      EndKeywordNode: EndKeyword |end|'+ #13#10 +
    '  SemicolonNode: Semicolon |;|', RTImplementationDecl));
end;

initialization
  RegisterTest(TTestAnonymousMethod.Suite);
{$ENDIF}

end.
