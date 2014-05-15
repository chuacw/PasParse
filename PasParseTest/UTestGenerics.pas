unit UTestGenerics;

interface
uses
  UTest;

type
  TTestGenerics = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE System}
  published
    procedure TestConstraintType;
    procedure TestParameterType;
    procedure TestArrayOfT;
    procedure TestFileOfT;
    procedure TestTypeEqualArrayT;
    procedure TestClassInheritance;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF}; // System

{ TTestGenerics }
{$IF NOT DEFINED(DUNIT)}
class function TTestGenerics.GetName: string;
begin
  Result := 'Generics';
end;

class procedure TTestGenerics.TestAll;
begin
  OK('type TArray<T> = array of T;', TTestParser.ParsesAs('type TArray<T> = array of T;',
    'TypeSectionNode'+ #13#10 +
    '  TypeKeywordNode: TypeKeyword |type|'+ #13#10 +
    '  TypeListNode: ListNode'+ #13#10 +
    '    Items[0]: TypeDeclNode'+ #13#10 +
    '      NameNode: Identifier |TArray|'+ #13#10 +
    '      TypeParams: TypeParamsNode'+ #13#10 +
    '        OpenBracketNode: LessThan |<|'+ #13#10 +
    '        TypeParamDeclNode: TypeParamDeclNode'+ #13#10 +
    '          TypeParamListNode: ListNode'+ #13#10 +
    '            Items[0]: DelimitedItemNode'+ #13#10 +
    '              ItemNode: TypeParamNode'+ #13#10 +
    '                ModifierNode: (none)'+ #13#10 +
    '                NameNode: Identifier |T|'+ #13#10 +
    '              DelimiterNode: (none)'+ #13#10 +
    '          ColonNode: (none)'+ #13#10 +
    '          ConstraintListNode: (none)'+ #13#10 +
    '        CloseBracketNode: GreaterThan |>|'+ #13#10 +
    '      EqualSignNode: EqualSign |=|'+ #13#10 +
    '      TypeKeywordNode: (none)'+ #13#10 +
    '      TypeNode: ArrayTypeNode'+ #13#10 +
    '        ArrayKeywordNode: ArrayKeyword |array|'+ #13#10 +
    '        OpenBracketNode: (none)'+ #13#10 +
    '        IndexListNode: ListNode'+ #13#10 +
    '        CloseBracketNode: (none)'+ #13#10 +
    '        OfKeywordNode: OfKeyword |of|'+ #13#10 +
    '        TypeNode: Identifier |T|'+ #13#10 +
    '      PortabilityDirectiveListNode: ListNode'+ #13#10 +
    '      SemicolonNode: Semicolon |;|', RTTypeSection));

  OK('type TFile<T> = file of T;', TTestParser.ParsesAs('type TFile<T> = file of T;',
//        Error here  ^ at file
// [dcc32 Error] PasParseTest.dpr(121): E2508 Type parameters not allowed on this type
    'FileTypeNode' + #13#10 +
    '  FileKeywordNode: FileKeyword |file|' + #13#10 +
    '  OfKeywordNode: OfKeyword |of|' + #13#10 +
    '  TypeNode: Identifier |Integer|', RTTypeSection)); // RTFileType
//'TypeSectionNode'#$D#$A'  TypeKeywordNode: TypeKeyword |type|'#$D#$A'  TypeListNode: ListNode'#$D#$A'    Items[0]: TypeDeclNode'#$D#$A'      NameNode: Identifier |TFile|'#$D#$A'      TypeParams: TypeParamsNode'#$D#$A'        OpenBracketNode: LessThan |<|'#$D#$A'        TypeParamDeclNode: TypeParamDeclNode'#$D#$A'          TypeParamListNode: ListNode'#$D#$A'            Items[0]: DelimitedItemNode'#$D#$A'              ItemNode: TypeParamNode'#$D#$A'                ModifierNode: (none)'#$D#$A'                NameNode: Identifier |T|'#$D#$A'              DelimiterNode: (none)'#$D#$A'          ColonNode: (none)'#$D#$A'          ConstraintListNode: (none)'#$D#$A'        CloseBracketNode: GreaterThan |>|'#$D#$A'      EqualSignNode: EqualSign |=|'#$D#$A'      TypeKeywordNode: (none)'#$D#$A'      TypeNode: FileTypeNode'#$D#$A'        FileKeywordNode: FileKeyword |file|'#$D#$A'        OfKeywordNode: OfKeyword |of|'#$D#$A'        TypeNode: Identifier |T|'#$D#$A'      PortabilityDirectiveListNode: ListNode'#$D#$A'      SemicolonNode: Semicolon |;|'
// TODO -ochuacw: Update the expected parse string
//  xxx....xxx ...

  OK('type TBucket = TArray<PPointer>;', TTestParser.ParsesAs('type TBucket = TArray<PPointer>;',
    '', RTTypeSection));

end;
{$ELSE}

procedure TTestGenerics.TestConstraintType;
const
  CConstraintType: string =
  'TJavaGenericImport<C: IJavaClass; T: IJavaInstance> = class(TJavaImport)'+
  'end;';
begin
  OK(CConstraintType, TTestParser.ParsesAs(CConstraintType,
  'TypeDeclNode'+ #13#10 +
  '  AttributesListNode: (none)'+ #13#10 +
  '  NameNode: Identifier |TJavaGenericImport|'+ #13#10 +
  '  TypeParams: TypeParamsNode'+ #13#10 +
  '    OpenBracketNode: LessThan |<|'+ #13#10 +
  '    TypeParamDeclNode: ListNode'+ #13#10 +
  '      Items[0]: DelimitedItemNode'+ #13#10 +
  '        ItemNode: TypeParamDeclNode'+ #13#10 +
  '          TypeParamListNode: ListNode'+ #13#10 +
  '            Items[0]: DelimitedItemNode'+ #13#10 +
  '              ItemNode: TypeParamNode'+ #13#10 +
  '                ModifierNode: (none)'+ #13#10 +
  '                NameNode: Identifier |C|'+ #13#10 +
  '              DelimiterNode: (none)'+ #13#10 +
  '          ColonNode: Colon |:|'+ #13#10 +
  '          ConstraintListNode: ListNode'+ #13#10 +
  '            Items[0]: DelimitedItemNode'+ #13#10 +
  '              ItemNode: Identifier |IJavaClass|'+ #13#10 +
  '              DelimiterNode: (none)'+ #13#10 +
  '        DelimiterNode: Semicolon |;|'+ #13#10 +
  '      Items[1]: DelimitedItemNode'+ #13#10 +
  '        ItemNode: TypeParamDeclNode'+ #13#10 +
  '          TypeParamListNode: ListNode'+ #13#10 +
  '            Items[0]: DelimitedItemNode'+ #13#10 +
  '              ItemNode: TypeParamNode'+ #13#10 +
  '                ModifierNode: (none)'+ #13#10 +
  '                NameNode: Identifier |T|'+ #13#10 +
  '              DelimiterNode: (none)'+ #13#10 +
  '          ColonNode: Colon |:|'+ #13#10 +
  '          ConstraintListNode: ListNode'+ #13#10 +
  '            Items[0]: DelimitedItemNode'+ #13#10 +
  '              ItemNode: Identifier |IJavaInstance|'+ #13#10 +
  '              DelimiterNode: (none)'+ #13#10 +
  '        DelimiterNode: (none)'+ #13#10 +
  '    CloseBracketNode: GreaterThan |>|'+ #13#10 +
  '  EqualSignNode: EqualSign |=|'+ #13#10 +
  '  TypeKeywordNode: (none)'+ #13#10 +
  '  TypeNode: ClassTypeNode'+ #13#10 +
  '    ClassKeywordNode: ClassKeyword |class|'+ #13#10 +
  '    DispositionNode: (none)'+ #13#10 +
  '    OpenParenthesisNode: OpenParenthesis |(|'+ #13#10 +
  '    InheritanceListNode: ListNode'+ #13#10 +
  '      Items[0]: DelimitedItemNode'+ #13#10 +
  '        ItemNode: Identifier |TJavaImport|'+ #13#10 +
  '        DelimiterNode: (none)'+ #13#10 +
  '    CloseParenthesisNode: CloseParenthesis |)|'+ #13#10 +
  '    ContentListNode: (none)'+ #13#10 +
  '    EndKeywordNode: EndKeyword |end|'+ #13#10 +
  '    DirectivesNode: (none)'+ #13#10 +
  '  PortabilityDirectiveListNode: (none)'+ #13#10 +
  '  SemicolonNode: Semicolon |;|', RTTypeDecl));
end;

procedure TTestGenerics.TestParameterType;
const
  CParamType: string = 'TDictionary<string, string>';
begin
  OK(CParamType, TTestParser.ParsesAs(CParamType,
  'IdentTypeArgsNode'+ #13#10 +
  '  Ident: Identifier |TDictionary|'+ #13#10 +
  '  TypeArgsNode: TypeParamsUsageNode'+ #13#10 +
  '    OpenBracketNode: LessThan |<|'+ #13#10 +
  '    TypeParamNode: ListNode'+ #13#10 +
  '      Items[0]: DelimitedItemNode'+ #13#10 +
  '        ItemNode: StringKeyword |string|'+ #13#10 +
  '        DelimiterNode: Comma |,|'+ #13#10 +
  '      Items[1]: DelimitedItemNode'+ #13#10 +
  '        ItemNode: StringKeyword |string|'+ #13#10 +
  '        DelimiterNode: (none)'+ #13#10 +
  '    CloseBracketNode: GreaterThan |>|', RTQualifiedIdentTypeParams));
end;

procedure TTestGenerics.TestArrayOfT;
const
  CTypeArrayT: string = 'type TArray<T> = array of T;';
begin
  OK(CTypeArrayT, TTestParser.ParsesAs(CTypeArrayT,
     'TypeSectionNode'+ #13#10 +
     '  TypeKeywordNode: TypeKeyword |type|'+ #13#10 +
     '  TypeListNode: ListNode'+ #13#10 +
     '    Items[0]: TypeDeclNode'+ #13#10 +
     '      AttributesListNode: (none)'+ #13#10 +
     '      NameNode: Identifier |TArray|'+ #13#10 +
     '      TypeParams: TypeParamsNode'+ #13#10 +
     '        OpenBracketNode: LessThan |<|'+ #13#10 +
     '        TypeParamDeclNode: ListNode'+ #13#10 +
     '          Items[0]: DelimitedItemNode'+ #13#10 +
     '            ItemNode: TypeParamDeclNode'+ #13#10 +
     '              TypeParamListNode: ListNode'+ #13#10 +
     '                Items[0]: DelimitedItemNode'+ #13#10 +
     '                  ItemNode: TypeParamNode'+ #13#10 +
     '                    ModifierNode: (none)'+ #13#10 +
     '                    NameNode: Identifier |T|'+ #13#10 +
     '                  DelimiterNode: (none)'+ #13#10 +
     '              ColonNode: (none)'+ #13#10 +
     '              ConstraintListNode: (none)'+ #13#10 +
     '            DelimiterNode: (none)'+ #13#10 +
     '        CloseBracketNode: GreaterThan |>|'+ #13#10 +
     '      EqualSignNode: EqualSign |=|'+ #13#10 +
     '      TypeKeywordNode: (none)'+ #13#10 +
     '      TypeNode: ArrayTypeNode'+ #13#10 +
     '        ArrayKeywordNode: ArrayKeyword |array|'+ #13#10 +
     '        OpenBracketNode: (none)'+ #13#10 +
     '        IndexListNode: (none)'+ #13#10 +
     '        CloseBracketNode: (none)'+ #13#10 +
     '        OfKeywordNode: OfKeyword |of|'+ #13#10 +
     '        TypeNode: Identifier |T|'+ #13#10 +
     '      PortabilityDirectiveListNode: (none)'+ #13#10 +
     '      SemicolonNode: Semicolon |;|', RTTypeSection));
end;

procedure TTestGenerics.TestFileOfT;
begin
  OK('type TFile<T> = file of T;', TTestParser.ParsesAs('type TFile<T> = file of T;',
//        Error here  ^ at file
// [dcc32 Error] PasParseTest.dpr(121): E2508 Type parameters not allowed on this type
     'TypeSectionNode'+ #13#10 +
     '  TypeKeywordNode: TypeKeyword |type|'+ #13#10 +
     '  TypeListNode: ListNode'+ #13#10 +
     '    Items[0]: TypeDeclNode'+ #13#10 +
     '      AttributesListNode: (none)'+ #13#10 +
     '      NameNode: Identifier |TFile|'+ #13#10 +
     '      TypeParams: TypeParamsNode'+ #13#10 +
     '        OpenBracketNode: LessThan |<|'+ #13#10 +
     '        TypeParamDeclNode: ListNode'+ #13#10 +
     '          Items[0]: DelimitedItemNode'+ #13#10 +
     '            ItemNode: TypeParamDeclNode'+ #13#10 +
     '              TypeParamListNode: ListNode'+ #13#10 +
     '                Items[0]: DelimitedItemNode'+ #13#10 +
     '                  ItemNode: TypeParamNode'+ #13#10 +
     '                    ModifierNode: (none)'+ #13#10 +
     '                    NameNode: Identifier |T|'+ #13#10 +
     '                  DelimiterNode: (none)'+ #13#10 +
     '              ColonNode: (none)'+ #13#10 +
     '              ConstraintListNode: (none)'+ #13#10 +
     '            DelimiterNode: (none)'+ #13#10 +
     '        CloseBracketNode: GreaterThan |>|'+ #13#10 +
     '      EqualSignNode: EqualSign |=|'+ #13#10 +
     '      TypeKeywordNode: (none)'+ #13#10 +
     '      TypeNode: FileTypeNode'+ #13#10 +
     '        FileKeywordNode: FileKeyword |file|'+ #13#10 +
     '        OfKeywordNode: OfKeyword |of|'+ #13#10 +
     '        TypeNode: Identifier |T|'+ #13#10 +
     '      PortabilityDirectiveListNode: (none)'+ #13#10 +
     '      SemicolonNode: Semicolon |;|', RTTypeSection)); // RTFileType
end;

procedure TTestGenerics.TestTypeEqualArrayT;
begin
  OK('type TBucket = TArray<PPointer>;',
    TTestParser.ParsesAs('type TBucket = TArray<PPointer>;',
     'TypeSectionNode'+ #13#10 +
     '  TypeKeywordNode: TypeKeyword |type|'+ #13#10 +
     '  TypeListNode: ListNode'+ #13#10 +
     '    Items[0]: TypeDeclNode'+ #13#10 +
     '      AttributesListNode: (none)'+ #13#10 +
     '      NameNode: Identifier |TBucket|'+ #13#10 +
     '      TypeParams: (none)'+ #13#10 +
     '      EqualSignNode: EqualSign |=|'+ #13#10 +
     '      TypeKeywordNode: (none)'+ #13#10 +
     '      TypeNode: IdentTypeArgsNode'+ #13#10 +
     '        Ident: Identifier |TArray|'+ #13#10 +
     '        TypeArgsNode: TypeParamsUsageNode'+ #13#10 +
     '          OpenBracketNode: LessThan |<|'+ #13#10 +
     '          TypeParamNode: ListNode'+ #13#10 +
     '            Items[0]: DelimitedItemNode'+ #13#10 +
     '              ItemNode: Identifier |PPointer|'+ #13#10 +
     '              DelimiterNode: (none)'+ #13#10 +
     '          CloseBracketNode: GreaterThan |>|'+ #13#10 +
     '      PortabilityDirectiveListNode: (none)'+ #13#10 +
     '      SemicolonNode: Semicolon |;|', RTTypeSection));
end;

procedure TTestGenerics.TestClassInheritance;
const
  CGenericsTypeDecl: string =
    'TComparer<T> = class(TInterfacedObject, IComparer<T>)'#13#10+
    'end;';
begin
  OK(CGenericsTypeDecl, TTestParser.ParsesAs(CGenericsTypeDecl,
    'TypeDeclNode'+ #13#10 +
    '  AttributesListNode: (none)'+ #13#10 +
    '  NameNode: Identifier |TComparer|'+ #13#10 +
    '  TypeParams: TypeParamsNode'+ #13#10 +
    '    OpenBracketNode: LessThan |<|'+ #13#10 +
    '    TypeParamDeclNode: ListNode'+ #13#10 +
    '      Items[0]: DelimitedItemNode'+ #13#10 +
    '        ItemNode: TypeParamDeclNode'+ #13#10 +
    '          TypeParamListNode: ListNode'+ #13#10 +
    '            Items[0]: DelimitedItemNode'+ #13#10 +
    '              ItemNode: TypeParamNode'+ #13#10 +
    '                ModifierNode: (none)'+ #13#10 +
    '                NameNode: Identifier |T|'+ #13#10 +
    '              DelimiterNode: (none)'+ #13#10 +
    '          ColonNode: (none)'+ #13#10 +
    '          ConstraintListNode: (none)'+ #13#10 +
    '        DelimiterNode: (none)'+ #13#10 +
    '    CloseBracketNode: GreaterThan |>|'+ #13#10 +
    '  EqualSignNode: EqualSign |=|'+ #13#10 +
    '  TypeKeywordNode: (none)'+ #13#10 +
    '  TypeNode: ClassTypeNode'+ #13#10 +
    '    ClassKeywordNode: ClassKeyword |class|'+ #13#10 +
    '    DispositionNode: (none)'+ #13#10 +
    '    OpenParenthesisNode: OpenParenthesis |(|'+ #13#10 +
    '    InheritanceListNode: ListNode'+ #13#10 +
    '      Items[0]: DelimitedItemNode'+ #13#10 +
    '        ItemNode: Identifier |TInterfacedObject|'+ #13#10 +
    '        DelimiterNode: Comma |,|'+ #13#10 +
    '      Items[1]: DelimitedItemNode'+ #13#10 +
    '        ItemNode: IdentTypeArgsNode'+ #13#10 +
    '          Ident: Identifier |IComparer|'+ #13#10 +
    '          TypeArgsNode: TypeParamsUsageNode'+ #13#10 +
    '            OpenBracketNode: LessThan |<|'+ #13#10 +
    '            TypeParamNode: ListNode'+ #13#10 +
    '              Items[0]: DelimitedItemNode'+ #13#10 +
    '                ItemNode: Identifier |T|'+ #13#10 +
    '                DelimiterNode: (none)'+ #13#10 +
    '            CloseBracketNode: GreaterThan |>|'+ #13#10 +
    '        DelimiterNode: (none)'+ #13#10 +
    '    CloseParenthesisNode: CloseParenthesis |)|'+ #13#10 +
    '    ContentListNode: (none)'+ #13#10 +
    '    EndKeywordNode: EndKeyword |end|'+ #13#10 +
    '    DirectivesNode: (none)'+ #13#10 +
    '  PortabilityDirectiveListNode: (none)'+ #13#10 +
    '  SemicolonNode: Semicolon |;|', RTTypeDecl));
end;

[Ref]
initialization
  RegisterTest(TTestGenerics.Suite);
{$ENDIF}
end.
