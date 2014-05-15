unit UTestAttributes;

interface

uses
  UTest;

type
  TTestAttributes = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestAttributesImplementationSection;
    procedure TestAttributesInParameterTypes;
    procedure TestAttributesInClass;
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
class function TTestAttributes.GetName: string;
begin
  Result := 'Atttributes';
end;

class procedure TTestAttributes.TestAll;
begin
end;
{$ELSE}

procedure TTestAttributes.TestAttributesImplementationSection;
const
  CImplSectAttrs: string =
'[JavaSignature(''com/google/analytics/tracking/android/GoogleAnalytics$AppOptOutCallback'')]' +
'JGoogleAnalytics_AppOptOutCallback = interface(IJavaInstance)'+
'[''{DB8992E3-FEFA-4BB1-98B9-F44BB465F278}'']'+
'  {Methods}'+
'  procedure reportAppOptOut(paramBoolean: Boolean); cdecl;'+
'end;';
begin
  OK(CImplSectAttrs, TTestParser.ParsesAs(CImplSectAttrs,
     'TypeDeclNode'+ #13#10 +
     '  AttributesListNode: ListNode'+ #13#10 +
     '    Items[0]: AttributesNode'+ #13#10 +
     '      OpenBracketNode: OpenBracket |[|'+ #13#10 +
     '      ScopeNode: (none)'+ #13#10 +
     '      ColonNode: (none)'+ #13#10 +
     '      ValueNode: ListNode'+ #13#10 +
     '        Items[0]: DelimitedItemNode'+ #13#10 +
     '          ItemNode: ParameterizedNode'+ #13#10 +
     '            LeftNode: Identifier |JavaSignature|'+ #13#10 +
     '            OpenDelimiterNode: OpenParenthesis |(|'+ #13#10 +
     '            ParameterListNode: ListNode'+ #13#10 +
     '              Items[0]: DelimitedItemNode'+ #13#10 +
     '                ItemNode: StringLiteral |''com/google/analytics/tracking/android/GoogleAnalytics$AppOptOutCallback''|'+ #13#10 +
     '                DelimiterNode: (none)'+ #13#10 +
     '            CloseDelimiterNode: CloseParenthesis |)|'+ #13#10 +
     '          DelimiterNode: (none)'+ #13#10 +
     '      CloseBracketNode: CloseBracket |]|'+ #13#10 +
     '  NameNode: Identifier |JGoogleAnalytics_AppOptOutCallback|'+ #13#10 +
     '  TypeParams: (none)'+ #13#10 +
     '  EqualSignNode: EqualSign |=|'+ #13#10 +
     '  TypeKeywordNode: (none)'+ #13#10 +
     '  TypeNode: InterfaceTypeNode'+ #13#10 +
     '    InterfaceKeywordNode: InterfaceKeyword |interface|'+ #13#10 +
     '    OpenParenthesisNode: OpenParenthesis |(|'+ #13#10 +
     '    BaseInterfaceNode: Identifier |IJavaInstance|'+ #13#10 +
     '    CloseParenthesisNode: CloseParenthesis |)|'+ #13#10 +
     '    OpenBracketNode: OpenBracket |[|'+ #13#10 +
     '    GuidNode: StringLiteral |''{DB8992E3-FEFA-4BB1-98B9-F44BB465F278}''|'+ #13#10 +
     '    CloseBracketNode: CloseBracket |]|'+ #13#10 +
     '    MethodAndPropertyListNode: ListNode'+ #13#10 +
     '      Items[0]: MethodHeadingNode'+ #13#10 +
     '        ClassKeywordNode: (none)'+ #13#10 +
     '        MethodTypeNode: ProcedureKeyword |procedure|'+ #13#10 +
     '        NameNode: Identifier |reportAppOptOut|'+ #13#10 +
     '        OpenParenthesisNode: OpenParenthesis |(|'+ #13#10 +
     '        ParameterListNode: ListNode'+ #13#10 +
     '          Items[0]: DelimitedItemNode'+ #13#10 +
     '            ItemNode: ParameterNode'+ #13#10 +
     '              ModifierNode: (none)'+ #13#10 +
     '              NameListNode: ListNode'+ #13#10 +
     '                Items[0]: DelimitedItemNode'+ #13#10 +
     '                  ItemNode: IdentAttrNode'+ #13#10 +
     '                    AttributesListNode: (none)'+ #13#10 +
     '                    Ident: Identifier |paramBoolean|'+ #13#10 +
     '                  DelimiterNode: (none)'+ #13#10 +
     '              ColonNode: Colon |:|'+ #13#10 +
     '              TypeNode: Identifier |Boolean|'+ #13#10 +
     '              EqualSignNode: (none)'+ #13#10 +
     '              DefaultValueNode: (none)'+ #13#10 +
     '            DelimiterNode: (none)'+ #13#10 +
     '        CloseParenthesisNode: CloseParenthesis |)|'+ #13#10 +
     '        ColonNode: (none)'+ #13#10 +
     '        ReturnTypeNode: (none)'+ #13#10 +
     '        DirectiveListNode: ListNode'+ #13#10 +
     '          Items[0]: DirectiveNode'+ #13#10 +
     '            SemicolonNode: Semicolon |;|'+ #13#10 +
     '            KeywordNode: CdeclSemikeyword |cdecl|'+ #13#10 +
     '            ValueNode: (none)'+ #13#10 +
     '            DataNode: (none)'+ #13#10 +
     '        SemicolonNode: Semicolon |;|'+ #13#10 +
     '    EndKeywordNode: EndKeyword |end|'+ #13#10 +
     '  PortabilityDirectiveListNode: (none)'+ #13#10 +
     '  SemicolonNode: Semicolon |;|', RTTypeDecl));
end;

procedure TTestAttributes.TestAttributesInClass;
const
  CAttributeInClassVar: string =
  'TThumbBarButtonListBase = class(TOwnedCollection)'+
  'private'+
  '  [Weak] FOwnerItem: TCollectionItem;'+
  '  FButtonsAdded: Boolean;'+
  'end;';
begin
  OK(CAttributeInClassVar, TTestParser.ParsesAs(CAttributeInClassVar,
    'TypeDeclNode'+ #13#10 +
    '  AttributesListNode: (none)'+ #13#10 +
    '  NameNode: Identifier |TThumbBarButtonListBase|'+ #13#10 +
    '  TypeParams: (none)'+ #13#10 +
    '  EqualSignNode: EqualSign |=|'+ #13#10 +
    '  TypeKeywordNode: (none)'+ #13#10 +
    '  TypeNode: ClassTypeNode'+ #13#10 +
    '    ClassKeywordNode: ClassKeyword |class|'+ #13#10 +
    '    DispositionNode: (none)'+ #13#10 +
    '    OpenParenthesisNode: OpenParenthesis |(|'+ #13#10 +
    '    InheritanceListNode: ListNode'+ #13#10 +
    '      Items[0]: DelimitedItemNode'+ #13#10 +
    '        ItemNode: Identifier |TOwnedCollection|'+ #13#10 +
    '        DelimiterNode: (none)'+ #13#10 +
    '    CloseParenthesisNode: CloseParenthesis |)|'+ #13#10 +
    '    ContentListNode: ListNode'+ #13#10 +
    '      Items[0]: VisibilitySectionNode'+ #13#10 +
    '        VisibilityNode: VisibilityNode'+ #13#10 +
    '          StrictSemikeywordNode: (none)'+ #13#10 +
    '          VisibilityKeywordNode: PrivateSemikeyword |private|'+ #13#10 +
    '        ContentListNode: ListNode'+ #13#10 +
    '          Items[0]: FieldSectionNode'+ #13#10 +
    '            ClassKeywordNode: (none)'+ #13#10 +
    '            VarKeywordNode: (none)'+ #13#10 +
    '            FieldListNode: ListNode'+ #13#10 +
    '              Items[0]: FieldDeclNode'+ #13#10 +
    '                NameListNode: ListNode'+ #13#10 +
    '                  Items[0]: DelimitedItemNode'+ #13#10 +
    '                    ItemNode: IdentAttrNode'+ #13#10 +
    '                      AttributesListNode: ListNode'+ #13#10 +
    '                        Items[0]: AttributesNode'+ #13#10 +
    '                          OpenBracketNode: OpenBracket |[|'+ #13#10 +
    '                          ScopeNode: (none)'+ #13#10 +
    '                          ColonNode: (none)'+ #13#10 +
    '                          ValueNode: ListNode'+ #13#10 +
    '                            Items[0]: DelimitedItemNode'+ #13#10 +
    '                              ItemNode: Identifier |Weak|'+ #13#10 +
    '                              DelimiterNode: (none)'+ #13#10 +
    '                          CloseBracketNode: CloseBracket |]|'+ #13#10 +
    '                      Ident: Identifier |FOwnerItem|'+ #13#10 +
    '                    DelimiterNode: (none)'+ #13#10 +
    '                ColonNode: Colon |:|'+ #13#10 +
    '                TypeNode: Identifier |TCollectionItem|'+ #13#10 +
    '                PortabilityDirectiveListNode: (none)'+ #13#10 +
    '                SemicolonNode: Semicolon |;|'+ #13#10 +
    '              Items[1]: FieldDeclNode'+ #13#10 +
    '                NameListNode: ListNode'+ #13#10 +
    '                  Items[0]: DelimitedItemNode'+ #13#10 +
    '                    ItemNode: IdentAttrNode'+ #13#10 +
    '                      AttributesListNode: (none)'+ #13#10 +
    '                      Ident: Identifier |FButtonsAdded|'+ #13#10 +
    '                    DelimiterNode: (none)'+ #13#10 +
    '                ColonNode: Colon |:|'+ #13#10 +
    '                TypeNode: Identifier |Boolean|'+ #13#10 +
    '                PortabilityDirectiveListNode: (none)'+ #13#10 +
    '                SemicolonNode: Semicolon |;|'+ #13#10 +
    '    EndKeywordNode: EndKeyword |end|'+ #13#10 +
    '    DirectivesNode: (none)'+ #13#10 +
    '  PortabilityDirectiveListNode: (none)'+ #13#10 +
    '  SemicolonNode: Semicolon |;|', RTTypeDecl));
end;

procedure TTestAttributes.TestAttributesInParameterTypes;
const
  CTestStr: string = 'function AssocCreate(const [Ref] clsid: TCLSID; '+
   'const [Ref] riid: IID; out ppv): HRESULT; stdcall;';
begin
  OK(CTestStr, TTestParser.ParsesAs(CTestStr,
     'MethodHeadingNode'+ #13#10 +
     '  ClassKeywordNode: (none)'+ #13#10 +
     '  MethodTypeNode: FunctionKeyword |function|'+ #13#10 +
     '  NameNode: Identifier |AssocCreate|'+ #13#10 +
     '  OpenParenthesisNode: OpenParenthesis |(|'+ #13#10 +
     '  ParameterListNode: ListNode'+ #13#10 +
     '    Items[0]: DelimitedItemNode'+ #13#10 +
     '      ItemNode: ParameterNode'+ #13#10 +
     '        ModifierNode: ConstKeyword |const|'+ #13#10 +
     '        NameListNode: ListNode'+ #13#10 +
     '          Items[0]: DelimitedItemNode'+ #13#10 +
     '            ItemNode: IdentAttrNode'+ #13#10 +
     '              AttributesListNode: ListNode'+ #13#10 +
     '                Items[0]: AttributesNode'+ #13#10 +
     '                  OpenBracketNode: OpenBracket |[|'+ #13#10 +
     '                  ScopeNode: (none)'+ #13#10 +
     '                  ColonNode: (none)'+ #13#10 +
     '                  ValueNode: ListNode'+ #13#10 +
     '                    Items[0]: DelimitedItemNode'+ #13#10 +
     '                      ItemNode: Identifier |Ref|'+ #13#10 +
     '                      DelimiterNode: (none)'+ #13#10 +
     '                  CloseBracketNode: CloseBracket |]|'+ #13#10 +
     '              Ident: Identifier |clsid|'+ #13#10 +
     '            DelimiterNode: (none)'+ #13#10 +
     '        ColonNode: Colon |:|'+ #13#10 +
     '        TypeNode: Identifier |TCLSID|'+ #13#10 +
     '        EqualSignNode: (none)'+ #13#10 +
     '        DefaultValueNode: (none)'+ #13#10 +
     '      DelimiterNode: Semicolon |;|'+ #13#10 +
     '    Items[1]: DelimitedItemNode'+ #13#10 +
     '      ItemNode: ParameterNode'+ #13#10 +
     '        ModifierNode: ConstKeyword |const|'+ #13#10 +
     '        NameListNode: ListNode'+ #13#10 +
     '          Items[0]: DelimitedItemNode'+ #13#10 +
     '            ItemNode: IdentAttrNode'+ #13#10 +
     '              AttributesListNode: ListNode'+ #13#10 +
     '                Items[0]: AttributesNode'+ #13#10 +
     '                  OpenBracketNode: OpenBracket |[|'+ #13#10 +
     '                  ScopeNode: (none)'+ #13#10 +
     '                  ColonNode: (none)'+ #13#10 +
     '                  ValueNode: ListNode'+ #13#10 +
     '                    Items[0]: DelimitedItemNode'+ #13#10 +
     '                      ItemNode: Identifier |Ref|'+ #13#10 +
     '                      DelimiterNode: (none)'+ #13#10 +
     '                  CloseBracketNode: CloseBracket |]|'+ #13#10 +
     '              Ident: Identifier |riid|'+ #13#10 +
     '            DelimiterNode: (none)'+ #13#10 +
     '        ColonNode: Colon |:|'+ #13#10 +
     '        TypeNode: Identifier |IID|'+ #13#10 +
     '        EqualSignNode: (none)'+ #13#10 +
     '        DefaultValueNode: (none)'+ #13#10 +
     '      DelimiterNode: Semicolon |;|'+ #13#10 +
     '    Items[2]: DelimitedItemNode'+ #13#10 +
     '      ItemNode: ParameterNode'+ #13#10 +
     '        ModifierNode: OutSemikeyword |out|'+ #13#10 +
     '        NameListNode: ListNode'+ #13#10 +
     '          Items[0]: DelimitedItemNode'+ #13#10 +
     '            ItemNode: IdentAttrNode'+ #13#10 +
     '              AttributesListNode: (none)'+ #13#10 +
     '              Ident: Identifier |ppv|'+ #13#10 +
     '            DelimiterNode: (none)'+ #13#10 +
     '        ColonNode: (none)'+ #13#10 +
     '        TypeNode: (none)'+ #13#10 +
     '        EqualSignNode: (none)'+ #13#10 +
     '        DefaultValueNode: (none)'+ #13#10 +
     '      DelimiterNode: (none)'+ #13#10 +
     '  CloseParenthesisNode: CloseParenthesis |)|'+ #13#10 +
     '  ColonNode: Colon |:|'+ #13#10 +
     '  ReturnTypeNode: Identifier |HRESULT|'+ #13#10 +
     '  DirectiveListNode: ListNode'+ #13#10 +
     '    Items[0]: DirectiveNode'+ #13#10 +
     '      SemicolonNode: Semicolon |;|'+ #13#10 +
     '      KeywordNode: StdcallSemikeyword |stdcall|'+ #13#10 +
     '      ValueNode: (none)'+ #13#10 +
     '      DataNode: (none)'+ #13#10 +
     '  SemicolonNode: Semicolon |;|', RTMethodHeading)); // TODO -ochuacw: Change to actual type from RTTypeDecl
end;

initialization
  RegisterTest(TTestAttributes.Suite);
{$ENDIF}

end.
