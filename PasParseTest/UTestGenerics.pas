unit UTestGenerics;

interface
uses
  UTest;

type
  TTestGenerics = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType; // System

{ TTestGenerics }

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

  OK('type TFile<T> = file of T', TTestParser.ParsesAs('type TFile<T> = file of T',
//        Error here  ^ at file
// [dcc32 Error] PasParseTest.dpr(121): E2508 Type parameters not allowed on this type
    'FileTypeNode' + #13#10 +
    '  FileKeywordNode: FileKeyword |file|' + #13#10 +
    '  OfKeywordNode: OfKeyword |of|' + #13#10 +
    '  TypeNode: Identifier |Integer|', RTTypeSection)); // RTFileType

  OK('type TBucket = TArray<PPointer>;', TTestParser.ParsesAs('type TBucket = TArray<PPointer>;',
    '', RTTypeSection));

end;

end.
