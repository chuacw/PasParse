unit UTestProcedureType;

interface

uses
  UTest;

type
  TTestProcedureType = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestProcedure;
    procedure TestFunctionInteger;
    procedure TestProcedureEmptyParenthesis;
    procedure TestMethodFooSenderCanClose;
    procedure TestProcedureOfObject;
    procedure TestProcedureStdcall;
    procedure TestProcedureStdcallOfObject;
    procedure TestProcedureOfObjectStdcall;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestProcedureType }
{$IF NOT DEFINED(DUNIT)}
class function TTestProcedureType.GetName: string;
begin
  Result := 'ProcedureType';
end;

class procedure TTestProcedureType.TestAll;
begin
  OK('procedure', TTestParser.ParsesAs('procedure',
    'ProcedureTypeNode' + #13#10 +
    '  MethodTypeNode: ProcedureKeyword |procedure|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  ParameterListNode: ListNode' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  ReturnTypeNode: (none)' + #13#10 +
    '  FirstDirectiveListNode: ListNode' + #13#10 +
    '  OfKeywordNode: (none)' + #13#10 +
    '  ObjectKeywordNode: (none)' + #13#10 +
    '  SecondDirectiveListNode: ListNode', RTProcedureType));

  OK('function: Integer', TTestParser.ParsesAs('function: Integer',
    'ProcedureTypeNode' + #13#10 +
    '  MethodTypeNode: FunctionKeyword |function|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  ParameterListNode: ListNode' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  ReturnTypeNode: Identifier |Integer|' + #13#10 +
    '  FirstDirectiveListNode: ListNode' + #13#10 +
    '  OfKeywordNode: (none)' + #13#10 +
    '  ObjectKeywordNode: (none)' + #13#10 +
    '  SecondDirectiveListNode: ListNode', RTProcedureType));

  OK('procedure()', TTestParser.ParsesAs('procedure()',
    'ProcedureTypeNode' + #13#10 +
    '  MethodTypeNode: ProcedureKeyword |procedure|' + #13#10 +
    '  OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '  ParameterListNode: ListNode' + #13#10 +
    '  CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  ReturnTypeNode: (none)' + #13#10 +
    '  FirstDirectiveListNode: ListNode' + #13#10 +
    '  OfKeywordNode: (none)' + #13#10 +
    '  ObjectKeywordNode: (none)' + #13#10 +
    '  SecondDirectiveListNode: ListNode', RTProcedureType));

  OK('procedure(Sender: TObject; var CanClose: Boolean)', 
    TTestParser.ParsesAs('procedure(Sender: TObject; var CanClose: Boolean)',
    'ProcedureTypeNode' + #13#10 +
    '  MethodTypeNode: ProcedureKeyword |procedure|' + #13#10 +
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
    '  FirstDirectiveListNode: ListNode' + #13#10 +
    '  OfKeywordNode: (none)' + #13#10 +
    '  ObjectKeywordNode: (none)' + #13#10 +
    '  SecondDirectiveListNode: ListNode', RTProcedureType));

  OK('procedure of object', TTestParser.ParsesAs('procedure of object',
    'ProcedureTypeNode' + #13#10 +
    '  MethodTypeNode: ProcedureKeyword |procedure|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  ParameterListNode: ListNode' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  ReturnTypeNode: (none)' + #13#10 +
    '  FirstDirectiveListNode: ListNode' + #13#10 +
    '  OfKeywordNode: OfKeyword |of|' + #13#10 +
    '  ObjectKeywordNode: ObjectKeyword |object|' + #13#10 +
    '  SecondDirectiveListNode: ListNode', RTProcedureType));

  OK('procedure stdcall', TTestParser.ParsesAs('procedure stdcall',
    'ProcedureTypeNode' + #13#10 +
    '  MethodTypeNode: ProcedureKeyword |procedure|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  ParameterListNode: ListNode' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  ReturnTypeNode: (none)' + #13#10 +
    '  FirstDirectiveListNode: ListNode' + #13#10 +
    '    Items[0]: DirectiveNode' + #13#10 +
    '      SemicolonNode: (none)' + #13#10 +
    '      KeywordNode: StdcallSemikeyword |stdcall|' + #13#10 +
    '      ValueNode: (none)' + #13#10 +
    '      DataNode: ListNode' + #13#10 +
    '  OfKeywordNode: (none)' + #13#10 +
    '  ObjectKeywordNode: (none)' + #13#10 +
    '  SecondDirectiveListNode: ListNode', RTProcedureType));

  OK('procedure stdcall of object', 
    TTestParser.ParsesAs('procedure stdcall of object',
    'ProcedureTypeNode' + #13#10 +
    '  MethodTypeNode: ProcedureKeyword |procedure|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  ParameterListNode: ListNode' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  ReturnTypeNode: (none)' + #13#10 +
    '  FirstDirectiveListNode: ListNode' + #13#10 +
    '    Items[0]: DirectiveNode' + #13#10 +
    '      SemicolonNode: (none)' + #13#10 +
    '      KeywordNode: StdcallSemikeyword |stdcall|' + #13#10 +
    '      ValueNode: (none)' + #13#10 +
    '      DataNode: ListNode' + #13#10 +
    '  OfKeywordNode: OfKeyword |of|' + #13#10 +
    '  ObjectKeywordNode: ObjectKeyword |object|' + #13#10 +
    '  SecondDirectiveListNode: ListNode', RTProcedureType));

  OK('procedure of object; stdcall', 
    TTestParser.ParsesAs('procedure of object; stdcall',
    'ProcedureTypeNode' + #13#10 +
    '  MethodTypeNode: ProcedureKeyword |procedure|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  ParameterListNode: ListNode' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  ReturnTypeNode: (none)' + #13#10 +
    '  FirstDirectiveListNode: ListNode' + #13#10 +
    '  OfKeywordNode: OfKeyword |of|' + #13#10 +
    '  ObjectKeywordNode: ObjectKeyword |object|' + #13#10 +
    '  SecondDirectiveListNode: ListNode' + #13#10 +
    '    Items[0]: DirectiveNode' + #13#10 +
    '      SemicolonNode: Semicolon |;|' + #13#10 +
    '      KeywordNode: StdcallSemikeyword |stdcall|' + #13#10 +
    '      ValueNode: (none)' + #13#10 +
    '      DataNode: ListNode', RTProcedureType));
end;
{$ELSE}

procedure TTestProcedureType.TestProcedure;
const
  CProcedure: string = 'procedure';
begin
  OK(CProcedure, TTestParser.ParsesAs(CProcedure,
    'ProcedureTypeNode' + #13#10 +
    '  MethodTypeNode: ProcedureKeyword |procedure|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  ParameterListNode: (none)' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  ReturnTypeNode: (none)' + #13#10 +
    '  FirstDirectiveListNode: (none)' + #13#10 +
    '  OfKeywordNode: (none)' + #13#10 +
    '  ObjectKeywordNode: (none)' + #13#10 +
    '  SecondDirectiveListNode: (none)', RTProcedureType));
end;

procedure TTestProcedureType.TestFunctionInteger;
const
  CFunctionInteger: string = 'function: Integer';
begin
  OK(CFunctionInteger, TTestParser.ParsesAs(CFunctionInteger,
    'ProcedureTypeNode' + #13#10 +
    '  MethodTypeNode: FunctionKeyword |function|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  ParameterListNode: (none)' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  ReturnTypeNode: Identifier |Integer|' + #13#10 +
    '  FirstDirectiveListNode: (none)' + #13#10 +
    '  OfKeywordNode: (none)' + #13#10 +
    '  ObjectKeywordNode: (none)' + #13#10 +
    '  SecondDirectiveListNode: (none)', RTProcedureType));
end;

procedure TTestProcedureType.TestProcedureEmptyParenthesis;
const
  CProcedureEmptyParenthesis: string = 'procedure()';
begin
  OK(CProcedureEmptyParenthesis, TTestParser.ParsesAs(CProcedureEmptyParenthesis,
    'ProcedureTypeNode' + #13#10 +
    '  MethodTypeNode: ProcedureKeyword |procedure|' + #13#10 +
    '  OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '  ParameterListNode: (none)' + #13#10 +
    '  CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  ReturnTypeNode: (none)' + #13#10 +
    '  FirstDirectiveListNode: (none)' + #13#10 +
    '  OfKeywordNode: (none)' + #13#10 +
    '  ObjectKeywordNode: (none)' + #13#10 +
    '  SecondDirectiveListNode: (none)', RTProcedureType));
end;

procedure TTestProcedureType.TestMethodFooSenderCanClose;
const
  CMethodFooSenderCanClose: string =
    'procedure(Sender: TObject; var CanClose: Boolean)';
begin
  OK(CMethodFooSenderCanClose,
    TTestParser.ParsesAs(CMethodFooSenderCanClose,
    'ProcedureTypeNode'+ #13#10 +
    '  MethodTypeNode: ProcedureKeyword |procedure|'+ #13#10 +
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
    '  FirstDirectiveListNode: (none)'+ #13#10 +
    '  OfKeywordNode: (none)'+ #13#10 +
    '  ObjectKeywordNode: (none)'+ #13#10 +
    '  SecondDirectiveListNode: (none)', RTProcedureType));
end;

procedure TTestProcedureType.TestProcedureOfObject;
const
  CProcedureOfObject: string = 'procedure of object';
begin
  OK(CProcedureOfObject, TTestParser.ParsesAs(CProcedureOfObject,
    'ProcedureTypeNode' + #13#10 +
    '  MethodTypeNode: ProcedureKeyword |procedure|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  ParameterListNode: (none)' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  ReturnTypeNode: (none)' + #13#10 +
    '  FirstDirectiveListNode: (none)' + #13#10 +
    '  OfKeywordNode: OfKeyword |of|' + #13#10 +
    '  ObjectKeywordNode: ObjectKeyword |object|' + #13#10 +
    '  SecondDirectiveListNode: (none)', RTProcedureType));
end;

procedure TTestProcedureType.TestProcedureStdcall;
const
  CProcedureStdcall: string = 'procedure stdcall';
begin
  OK(CProcedureStdcall, TTestParser.ParsesAs(CProcedureStdcall,
    'ProcedureTypeNode' + #13#10 +
    '  MethodTypeNode: ProcedureKeyword |procedure|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  ParameterListNode: (none)' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  ReturnTypeNode: (none)' + #13#10 +
    '  FirstDirectiveListNode: ListNode' + #13#10 +
    '    Items[0]: DirectiveNode' + #13#10 +
    '      SemicolonNode: (none)' + #13#10 +
    '      KeywordNode: StdcallSemikeyword |stdcall|' + #13#10 +
    '      ValueNode: (none)' + #13#10 +
    '      DataNode: (none)' + #13#10 +
    '  OfKeywordNode: (none)' + #13#10 +
    '  ObjectKeywordNode: (none)' + #13#10 +
    '  SecondDirectiveListNode: (none)', RTProcedureType));
end;

procedure TTestProcedureType.TestProcedureStdcallOfObject;
const
  CProcedureStdcallOfObject: string = 'procedure stdcall of object';
begin
  OK(CProcedureStdcallOfObject,
    TTestParser.ParsesAs(CProcedureStdcallOfObject,
    'ProcedureTypeNode' + #13#10 +
    '  MethodTypeNode: ProcedureKeyword |procedure|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  ParameterListNode: (none)' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  ReturnTypeNode: (none)' + #13#10 +
    '  FirstDirectiveListNode: ListNode' + #13#10 +
    '    Items[0]: DirectiveNode' + #13#10 +
    '      SemicolonNode: (none)' + #13#10 +
    '      KeywordNode: StdcallSemikeyword |stdcall|' + #13#10 +
    '      ValueNode: (none)' + #13#10 +
    '      DataNode: (none)' + #13#10 +
    '  OfKeywordNode: OfKeyword |of|' + #13#10 +
    '  ObjectKeywordNode: ObjectKeyword |object|' + #13#10 +
    '  SecondDirectiveListNode: (none)', RTProcedureType));
end;

procedure TTestProcedureType.TestProcedureOfObjectStdcall;
const
  CProcedureOfObjectStdcall: string = 'procedure of object; stdcall';
begin
  OK(CProcedureOfObjectStdcall,
    TTestParser.ParsesAs(CProcedureOfObjectStdcall,
    'ProcedureTypeNode' + #13#10 +
    '  MethodTypeNode: ProcedureKeyword |procedure|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  ParameterListNode: (none)' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  ReturnTypeNode: (none)' + #13#10 +
    '  FirstDirectiveListNode: (none)' + #13#10 +
    '  OfKeywordNode: OfKeyword |of|' + #13#10 +
    '  ObjectKeywordNode: ObjectKeyword |object|' + #13#10 +
    '  SecondDirectiveListNode: ListNode' + #13#10 +
    '    Items[0]: DirectiveNode' + #13#10 +
    '      SemicolonNode: Semicolon |;|' + #13#10 +
    '      KeywordNode: StdcallSemikeyword |stdcall|' + #13#10 +
    '      ValueNode: (none)' + #13#10 +
    '      DataNode: (none)', RTProcedureType));
end;

initialization
  RegisterTest(TTestProcedureType.Suite);
{$ENDIF}
end.
