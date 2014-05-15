unit UTestClassType;

interface

uses
  UTest;

type
  TTestClassType = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestClassEnd;
    procedure TestClassProcedureFooEnd;
    procedure TestClassAbstractEnd;
    procedure TestClassSealedEnd;
    procedure TestClassTComponentEnd;
    procedure TestClassTInterfacedObjectIInterface;
    procedure TestClassType;
    procedure TestClassThreadVar;
    procedure TestClassVar;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType, UParser, UCompilerDefines, UASTNode, UTokenType
  {$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestClassType }
{$IF NOT DEFINED(DUNIT)}
class function TTestClassType.GetName: string;
begin
  Result := 'ClassType';
end;

class procedure TTestClassType.TestAll;
var
  ACompilerDefines: TCompilerDefines;
  AParser: TParser;
  ANode: TASTNode;
begin
  OK('class end', TTestParser.ParsesAs('class end',
    'ClassTypeNode'+ #13#10 +
    '  ClassKeywordNode: ClassKeyword |class|'+ #13#10 +
    '  DispositionNode: (none)'+ #13#10 +
    '  OpenParenthesisNode: (none)'+ #13#10 +
    '  InheritanceListNode: ListNode'+ #13#10 +
    '  CloseParenthesisNode: (none)'+ #13#10 +
    '  ContentListNode: ListNode'+ #13#10 +
    '  EndKeywordNode: EndKeyword |end|'+ #13#10 +
    '  DirectivesNode: (none)', RTClassType));

  OK('class procedure Foo; end',
    TTestParser.ParsesAs('class procedure Foo; end',
    'ClassTypeNode' + #13#10 +
    '  ClassKeywordNode: ClassKeyword |class|' + #13#10 +
    '  DispositionNode: (none)' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  InheritanceListNode: ListNode' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ContentListNode: ListNode' + #13#10 +
    '    Items[0]: VisibilitySectionNode' + #13#10 +
    '      VisibilityNode: (none)' + #13#10 +
    '      ContentListNode: ListNode' + #13#10 +
    '        Items[0]: MethodHeadingNode' + #13#10 +
    '          ClassKeywordNode: (none)' + #13#10 +
    '          MethodTypeNode: ProcedureKeyword |procedure|' + #13#10 +
    '          NameNode: Identifier |Foo|' + #13#10 +
    '          OpenParenthesisNode: (none)' + #13#10 +
    '          ParameterListNode: ListNode' + #13#10 +
    '          CloseParenthesisNode: (none)' + #13#10 +
    '          ColonNode: (none)' + #13#10 +
    '          ReturnTypeNode: (none)' + #13#10 +
    '          DirectiveListNode: ListNode' + #13#10 +
    '          SemicolonNode: Semicolon |;|' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|'+ #13#10 +
    '  DirectivesNode: (none)', RTClassType));

  OK('class abstract end', TTestParser.ParsesAs('class abstract end',
    'ClassTypeNode' + #13#10 +
    '  ClassKeywordNode: ClassKeyword |class|' + #13#10 +
    '  DispositionNode: AbstractSemikeyword |abstract|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  InheritanceListNode: ListNode' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ContentListNode: ListNode' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|'+ #13#10 +
    '  DirectivesNode: (none)', RTClassType));

  OK('class sealed end', TTestParser.ParsesAs('class sealed end',
    'ClassTypeNode' + #13#10 +
    '  ClassKeywordNode: ClassKeyword |class|' + #13#10 +
    '  DispositionNode: SealedSemikeyword |sealed|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  InheritanceListNode: ListNode' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ContentListNode: ListNode' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|'+ #13#10 +
    '  DirectivesNode: (none)', RTClassType));

  OK('class(TComponent) end', TTestParser.ParsesAs('class(TComponent) end',
    'ClassTypeNode' + #13#10 +
    '  ClassKeywordNode: ClassKeyword |class|' + #13#10 +
    '  DispositionNode: (none)' + #13#10 +
    '  OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '  InheritanceListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |TComponent|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '  ContentListNode: ListNode' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|'+ #13#10 +
    '  DirectivesNode: (none)', RTClassType));

  OK('class(TInterfacedObject, IInterface) end',
    TTestParser.ParsesAs('class(TInterfacedObject, IInterface) end',
    'ClassTypeNode' + #13#10 +
    '  ClassKeywordNode: ClassKeyword |class|' + #13#10 +
    '  DispositionNode: (none)' + #13#10 +
    '  OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '  InheritanceListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |TInterfacedObject|' + #13#10 +
    '      DelimiterNode: Comma |,|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |IInterface|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '  ContentListNode: ListNode' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|'+ #13#10 +
    '  DirectivesNode: (none)', RTClassType));

  // Create temporary CompilerDefines and Parser
  ACompilerDefines := TCompilerDefines.Create;
  AParser := TParser.CreateFromText('class(Exception);', '',
    ACompilerDefines, nil);
  // Parse ClassType rule
  ANode := AParser.ParseRule(RTClassType);
  // Parse trailing semicolon and throw away directly afterwards
  AParser.ParseToken(TTSemicolon).Free;
  // Check if whole input consumed
  OK('class(Exception); -> EOF', AParser.IsEOF);
  // Check if ClassType rule worked correctly
  OK('class(Exception);', ANode.Inspect =
    'ClassTypeNode' + #13#10 +
    '  ClassKeywordNode: ClassKeyword |class|' + #13#10 +
    '  DispositionNode: (none)' + #13#10 +
    '  OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '  InheritanceListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Exception|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '  ContentListNode: ListNode' + #13#10 +
    '  EndKeywordNode: (none)'+ #13#10 +
    '  DirectivesNode: (none)');
  // Memory cleanup
  ANode.Free;
  AParser.Free;
  ACompilerDefines.Free;
end;
{$ELSE}

var
  ACompilerDefines: TCompilerDefines;
  AParser: TParser;
  ANode: TASTNode;

procedure TTestClassType.TestClassEnd;
const
  CClassEnd: string = 'class end';
begin
  OK(CClassEnd, TTestParser.ParsesAs(CClassEnd,
    'ClassTypeNode'+ #13#10 +
    '  ClassKeywordNode: ClassKeyword |class|'+ #13#10 +
    '  DispositionNode: (none)'+ #13#10 +
    '  OpenParenthesisNode: (none)'+ #13#10 +
    '  InheritanceListNode: (none)'+ #13#10 +
    '  CloseParenthesisNode: (none)'+ #13#10 +
    '  ContentListNode: (none)'+ #13#10 +
    '  EndKeywordNode: EndKeyword |end|'+ #13#10 +
    '  DirectivesNode: (none)', RTClassType));
end;

procedure TTestClassType.TestClassProcedureFooEnd;
const
  CClassProcedureFooEnd: string = 'class procedure Foo; end';
begin
  OK(CClassProcedureFooEnd,
    TTestParser.ParsesAs(CClassProcedureFooEnd,
    'ClassTypeNode' + #13#10 +
    '  ClassKeywordNode: ClassKeyword |class|' + #13#10 +
    '  DispositionNode: (none)' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  InheritanceListNode: (none)' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ContentListNode: ListNode' + #13#10 +
    '    Items[0]: VisibilitySectionNode' + #13#10 +
    '      VisibilityNode: (none)' + #13#10 +
    '      ContentListNode: ListNode' + #13#10 +
    '        Items[0]: MethodHeadingNode' + #13#10 +
    '          ClassKeywordNode: (none)' + #13#10 +
    '          MethodTypeNode: ProcedureKeyword |procedure|' + #13#10 +
    '          NameNode: Identifier |Foo|' + #13#10 +
    '          OpenParenthesisNode: (none)' + #13#10 +
    '          ParameterListNode: (none)' + #13#10 +
    '          CloseParenthesisNode: (none)' + #13#10 +
    '          ColonNode: (none)' + #13#10 +
    '          ReturnTypeNode: (none)' + #13#10 +
    '          DirectiveListNode: (none)' + #13#10 +
    '          SemicolonNode: Semicolon |;|' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|'+ #13#10 +
    '  DirectivesNode: (none)', RTClassType));
end;

procedure TTestClassType.TestClassAbstractEnd;
const
  CClassAbstractEnd: string = 'class abstract end';
begin
  OK(CClassAbstractEnd, TTestParser.ParsesAs(CClassAbstractEnd,
    'ClassTypeNode' + #13#10 +
    '  ClassKeywordNode: ClassKeyword |class|' + #13#10 +
    '  DispositionNode: AbstractSemikeyword |abstract|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  InheritanceListNode: (none)' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ContentListNode: (none)' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|'+ #13#10 +
    '  DirectivesNode: (none)', RTClassType));
end;

procedure TTestClassType.TestClassSealedEnd;
const
  CClassSealedEnd: string = 'class sealed end';
begin
  OK(CClassSealedEnd, TTestParser.ParsesAs(CClassSealedEnd,
    'ClassTypeNode' + #13#10 +
    '  ClassKeywordNode: ClassKeyword |class|' + #13#10 +
    '  DispositionNode: SealedSemikeyword |sealed|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  InheritanceListNode: (none)' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ContentListNode: (none)' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|'+ #13#10 +
    '  DirectivesNode: (none)', RTClassType));
end;

procedure TTestClassType.TestClassTComponentEnd;
const
  CClassTComponentEnd: string = 'class(TComponent) end';
begin
  OK(CClassTComponentEnd, TTestParser.ParsesAs(CClassTComponentEnd,
    'ClassTypeNode' + #13#10 +
    '  ClassKeywordNode: ClassKeyword |class|' + #13#10 +
    '  DispositionNode: (none)' + #13#10 +
    '  OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '  InheritanceListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |TComponent|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '  ContentListNode: (none)' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|'+ #13#10 +
    '  DirectivesNode: (none)', RTClassType));
end;

procedure TTestClassType.TestClassTInterfacedObjectIInterface;
const
  CClassTInterfacedObjectIInterface: string =
    'class(TInterfacedObject, IInterface) end';
begin
  OK(CClassTInterfacedObjectIInterface,
    TTestParser.ParsesAs(CClassTInterfacedObjectIInterface,
    'ClassTypeNode' + #13#10 +
    '  ClassKeywordNode: ClassKeyword |class|' + #13#10 +
    '  DispositionNode: (none)' + #13#10 +
    '  OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '  InheritanceListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |TInterfacedObject|' + #13#10 +
    '      DelimiterNode: Comma |,|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |IInterface|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '  ContentListNode: (none)' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|'+ #13#10 +
    '  DirectivesNode: (none)', RTClassType));
end;

procedure TTestClassType.TestClassType;
begin
  ANode := AParser.ParseRule(RTClassType);
  // Parse trailing semicolon and throw away directly afterwards
  AParser.ParseToken(TTSemicolon).Free;
  // Check if whole input consumed
  OK('class(Exception); -> EOF', AParser.IsEOF);
  // Check if ClassType rule worked correctly
  OK('class(Exception);', ANode.Inspect =
    'ClassTypeNode' + #13#10 +
    '  ClassKeywordNode: ClassKeyword |class|' + #13#10 +
    '  DispositionNode: (none)' + #13#10 +
    '  OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '  InheritanceListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Exception|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '  ContentListNode: (none)' + #13#10 +
    '  EndKeywordNode: (none)'+ #13#10 +
    '  DirectivesNode: (none)');
end;

procedure TTestClassType.TestClassThreadVar;
const
  CClassThreadVar: string =
    'class public class threadvar JNIEnvRes: PJNIEnv; end';
begin
  OK(CClassThreadVar,
    TTestParser.ParsesAs(CClassThreadVar,
    'ClassTypeNode'+ #13#10 +
    '  ClassKeywordNode: ClassKeyword |class|'+ #13#10 +
    '  DispositionNode: (none)'+ #13#10 +
    '  OpenParenthesisNode: (none)'+ #13#10 +
    '  InheritanceListNode: (none)'+ #13#10 +
    '  CloseParenthesisNode: (none)'+ #13#10 +
    '  ContentListNode: ListNode'+ #13#10 +
    '    Items[0]: VisibilitySectionNode'+ #13#10 +
    '      VisibilityNode: VisibilityNode'+ #13#10 +
    '        StrictSemikeywordNode: (none)'+ #13#10 +
    '        VisibilityKeywordNode: PublicSemikeyword |public|'+ #13#10 +
    '      ContentListNode: ListNode'+ #13#10 +
    '        Items[0]: FieldSectionNode'+ #13#10 +
    '          ClassKeywordNode: ClassKeyword |class|'+ #13#10 +
    '          VarKeywordNode: ThreadVarKeyword |threadvar|'+ #13#10 +
    '          FieldListNode: ListNode'+ #13#10 +
    '            Items[0]: FieldDeclNode'+ #13#10 +
    '              NameListNode: ListNode'+ #13#10 +
    '                Items[0]: DelimitedItemNode'+ #13#10 +
    '                  ItemNode: IdentAttrNode'+ #13#10 +
    '                    AttributesListNode: (none)'+ #13#10 +
    '                    Ident: Identifier |JNIEnvRes|'+ #13#10 +
    '                  DelimiterNode: (none)'+ #13#10 +
    '              ColonNode: Colon |:|'+ #13#10 +
    '              TypeNode: Identifier |PJNIEnv|'+ #13#10 +
    '              PortabilityDirectiveListNode: (none)'+ #13#10 +
    '              SemicolonNode: Semicolon |;|'+ #13#10 +
    '  EndKeywordNode: EndKeyword |end|'+ #13#10 +
    '  DirectivesNode: (none)', RTClassType));
end;

procedure TTestClassType.TestClassVar;
// Error at position 4555 of C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\common\System.Zip.pas, line 135, column 11
const
  CClassVar: string =
  'class'+
  '  private type'+
  '    TCompressionDict = TDictionary< TZipCompression , TPair<TStreamConstructor, TStreamConstructor > >;'+
  '  private class var'+
  '    FCompressionHandler: TCompressionDict;'+
  'end';
begin
  OK(CClassVar, TTestParser.ParsesAs(CClassVar,
   'ClassTypeNode'+ #13#10 +
   '  ClassKeywordNode: ClassKeyword |class|'+ #13#10 +
   '  DispositionNode: (none)'+ #13#10 +
   '  OpenParenthesisNode: (none)'+ #13#10 +
   '  InheritanceListNode: (none)'+ #13#10 +
   '  CloseParenthesisNode: (none)'+ #13#10 +
   '  ContentListNode: ListNode'+ #13#10 +
   '    Items[0]: VisibilitySectionNode'+ #13#10 +
   '      VisibilityNode: VisibilityNode'+ #13#10 +
   '        StrictSemikeywordNode: (none)'+ #13#10 +
   '        VisibilityKeywordNode: PrivateSemikeyword |private|'+ #13#10 +
   '      ContentListNode: ListNode'+ #13#10 +
   '        Items[0]: TypeSectionNode'+ #13#10 +
   '          TypeKeywordNode: TypeKeyword |type|'+ #13#10 +
   '          TypeListNode: ListNode'+ #13#10 +
   '            Items[0]: TypeDeclNode'+ #13#10 +
   '              AttributesListNode: (none)'+ #13#10 +
   '              NameNode: Identifier |TCompressionDict|'+ #13#10 +
   '              TypeParams: (none)'+ #13#10 +
   '              EqualSignNode: EqualSign |=|'+ #13#10 +
   '              TypeKeywordNode: (none)'+ #13#10 +
   '              TypeNode: IdentTypeArgsNode'+ #13#10 +
   '                Ident: Identifier |TDictionary|'+ #13#10 +
   '                TypeArgsNode: TypeParamsUsageNode'+ #13#10 +
   '                  OpenBracketNode: LessThan |<|'+ #13#10 +
   '                  TypeParamNode: ListNode'+ #13#10 +
   '                    Items[0]: DelimitedItemNode'+ #13#10 +
   '                      ItemNode: Identifier |TZipCompression|'+ #13#10 +
   '                      DelimiterNode: Comma |,|'+ #13#10 +
   '                    Items[1]: DelimitedItemNode'+ #13#10 +
   '                      ItemNode: IdentTypeArgsNode'+ #13#10 +
   '                        Ident: Identifier |TPair|'+ #13#10 +
   '                        TypeArgsNode: TypeParamsUsageNode'+ #13#10 +
   '                          OpenBracketNode: LessThan |<|'+ #13#10 +
   '                          TypeParamNode: ListNode'+ #13#10 +
   '                            Items[0]: DelimitedItemNode'+ #13#10 +
   '                              ItemNode: Identifier |TStreamConstructor|'+ #13#10 +
   '                              DelimiterNode: Comma |,|'+ #13#10 +
   '                            Items[1]: DelimitedItemNode'+ #13#10 +
   '                              ItemNode: Identifier |TStreamConstructor|'+ #13#10 +
   '                              DelimiterNode: (none)'+ #13#10 +
   '                          CloseBracketNode: GreaterThan |>|'+ #13#10 +
   '                      DelimiterNode: (none)'+ #13#10 +
   '                  CloseBracketNode: GreaterThan |>|'+ #13#10 +
   '              PortabilityDirectiveListNode: (none)'+ #13#10 +
   '              SemicolonNode: Semicolon |;|'+ #13#10 +
   '    Items[1]: VisibilitySectionNode'+ #13#10 +
   '      VisibilityNode: VisibilityNode'+ #13#10 +
   '        StrictSemikeywordNode: (none)'+ #13#10 +
   '        VisibilityKeywordNode: PrivateSemikeyword |private|'+ #13#10 +
   '      ContentListNode: ListNode'+ #13#10 +
   '        Items[0]: FieldSectionNode'+ #13#10 +
   '          ClassKeywordNode: ClassKeyword |class|'+ #13#10 +
   '          VarKeywordNode: VarKeyword |var|'+ #13#10 +
   '          FieldListNode: ListNode'+ #13#10 +
   '            Items[0]: FieldDeclNode'+ #13#10 +
   '              NameListNode: ListNode'+ #13#10 +
   '                Items[0]: DelimitedItemNode'+ #13#10 +
   '                  ItemNode: Identifier |FCompressionHandler|'+ #13#10 +
   '                  DelimiterNode: (none)'+ #13#10 +
   '              ColonNode: Colon |:|'+ #13#10 +
   '              TypeNode: Identifier |TCompressionDict|'+ #13#10 +
   '              PortabilityDirectiveListNode: (none)'+ #13#10 +
   '              SemicolonNode: Semicolon |;|'+ #13#10 +
   '  EndKeywordNode: EndKeyword |end|'+ #13#10 +
   '  DirectivesNode: (none)', RTClassType));
end;

procedure TTestClassType.SetUp;
begin
  ACompilerDefines := TCompilerDefines.Create;
  AParser := TParser.CreateFromText('class(Exception);', '',
    ACompilerDefines, nil);
  // Parse ClassType rule
  ANode := nil;
end;

procedure TTestClassType.TearDown;
begin
  // Memory cleanup
  ANode.Free;
  AParser.Free;
  ACompilerDefines.Free;
end;

initialization
  RegisterTest(TTestClassType.Suite);
{$ENDIF}
end.
