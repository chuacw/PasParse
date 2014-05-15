unit UTestRecordType;

interface

uses
  UTest;

type
  TTestRecordType = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestRecordTypeVariant;
    procedure TestRecordTypeMethod;
    procedure TestEmptyRecord;
    procedure TestRecordTypeAlignNoData;
    procedure TestRecordTypeAlign2;
    procedure TestRecordTypeAlign4;
    procedure TestRecordTypeDeprecated;
    procedure TestRecordTypeDeprecatedMessage;
    procedure TestRecordTypeAppGlue;
    procedure TestRecordTypeProcedure;
    procedure TestRecordTypeReferenceToProcedure;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType, UParseException{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestRecordType }
{$IF NOT DEFINED(DUNIT)}
class function TTestRecordType.GetName: string;
begin
  Result := 'RecordType';
end;

class procedure TTestRecordType.TestAll;
begin
  try
    TTestParser.ParsesAs('record end align', '', RTRecordType);
    // this should fail because an expression is expected after align
    OK(False, '() exception');
  except
    on ETestException do;
    on EParseException do
      OK(True, '() exception');
  else
    OK(False, '() exception');
  end;

  OK('record end align 2', TTestParser.ParsesAs('record end align 2',
    'RecordTypeNode'+ #13#10 +
    '  RecordKeywordNode: RecordKeyword |record|'+ #13#10 +
    '  ContentListNode: ListNode'+ #13#10 +
    '  VariantSectionNode: (none)'+ #13#10 +
    '  EndKeywordNode: EndKeyword |end|'+ #13#10 +
    '  DirectivesNode: ListNode'+ #13#10 +
    '    Items[0]: DirectiveNode'+ #13#10 +
    '      SemicolonNode: (none)'+ #13#10 +
    '      KeywordNode: AlignSemikeyword |align|'+ #13#10 +
    '      ValueNode: Number |2|'+ #13#10 +
    '      DataNode: (none)', RTRecordType)); // this should succeed

  OK('record end align 4', TTestParser.ParsesAs('record end align 4',
    'RecordTypeNode'+ #13#10 +
    '  RecordKeywordNode: RecordKeyword |record|'+ #13#10 +
    '  ContentListNode: ListNode'+ #13#10 +
    '  VariantSectionNode: (none)'+ #13#10 +
    '  EndKeywordNode: EndKeyword |end|'+ #13#10 +
    '  DirectivesNode: ListNode'+ #13#10 +
    '    Items[0]: DirectiveNode'+ #13#10 +
    '      SemicolonNode: (none)'+ #13#10 +
    '      KeywordNode: AlignSemikeyword |align|'+ #13#10 +
    '      ValueNode: Number |4|'+ #13#10 +
    '      DataNode: (none)', RTRecordType)); // this should succeed

  OK('record end deprecated', TTestParser.ParsesAs('record end deprecated',
    'RecordTypeNode'+ #13#10 +
    '  RecordKeywordNode: RecordKeyword |record|'+ #13#10 +
    '  ContentListNode: ListNode'+ #13#10 +
    '  VariantSectionNode: (none)'+ #13#10 +
    '  EndKeywordNode: EndKeyword |end|'+ #13#10 +
    '  DirectivesNode: ListNode'+ #13#10 +
    '    Items[0]: DirectiveNode'+ #13#10 +
    '      SemicolonNode: (none)'+ #13#10 +
    '      KeywordNode: DeprecatedSemikeyword |deprecated|'+ #13#10 +
    '      ValueNode: (none)'+ #13#10 +
    '      DataNode: (none)', RTRecordType)); // this should succeed

  OK('record end deprecated ''Blah''', TTestParser.ParsesAs('record end deprecated ''Blah''',
    'RecordTypeNode'+ #13#10 +
    '  RecordKeywordNode: RecordKeyword |record|'+ #13#10 +
    '  ContentListNode: ListNode'+ #13#10 +
    '  VariantSectionNode: (none)'+ #13#10 +
    '  EndKeywordNode: EndKeyword |end|'+ #13#10 +
    '  DirectivesNode: ListNode'+ #13#10 +
    '    Items[0]: DirectiveNode'+ #13#10 +
    '      SemicolonNode: (none)'+ #13#10 +
    '      KeywordNode: DeprecatedSemikeyword |deprecated|'+ #13#10 +
    '      ValueNode: StringLiteral |''Blah''|'+ #13#10 +
    '      DataNode: (none)', RTRecordType)); // this should succeed

  OK('record end', TTestParser.ParsesAs('record end',
    'RecordTypeNode' + #13#10 +
    '  RecordKeywordNode: RecordKeyword |record|' + #13#10 +
    '  ContentListNode: ListNode' + #13#10 +
    '  VariantSectionNode: (none)' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|'+ #13#10 +
    '  DirectivesNode: (none)', RTRecordType));

  OK('record procedure Foo; end', TTestParser.ParsesAs('record procedure Foo; end',
    'RecordTypeNode' + #13#10 +
    '  RecordKeywordNode: RecordKeyword |record|' + #13#10 +
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
    '  VariantSectionNode: (none)' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|'+ #13#10 +
    '  DirectivesNode: (none)', RTRecordType));

  OK('record case Integer of 1: (); end',
    TTestParser.ParsesAs('record case Integer of 1: (); end',
    'RecordTypeNode' + #13#10 +
    '  RecordKeywordNode: RecordKeyword |record|' + #13#10 +
    '  ContentListNode: ListNode' + #13#10 +
    '  VariantSectionNode: VariantSectionNode' + #13#10 +
    '    CaseKeywordNode: CaseKeyword |case|' + #13#10 +
    '    NameNode: (none)' + #13#10 +
    '    ColonNode: (none)' + #13#10 +
    '    TypeNode: Identifier |Integer|' + #13#10 +
    '    OfKeywordNode: OfKeyword |of|' + #13#10 +
    '    VariantGroupListNode: ListNode' + #13#10 +
    '      Items[0]: VariantGroupNode' + #13#10 +
    '        ValueListNode: ListNode' + #13#10 +
    '          Items[0]: DelimitedItemNode' + #13#10 +
    '            ItemNode: Number |1|' + #13#10 +
    '            DelimiterNode: (none)' + #13#10 +
    '        ColonNode: Colon |:|' + #13#10 +
    '        OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '        FieldDeclListNode: ListNode' + #13#10 +
    '        VariantSectionNode: (none)' + #13#10 +
    '        CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '        SemicolonNode: Semicolon |;|' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|'+ #13#10 +
    '  DirectivesNode: (none)', RTRecordType));

//const X = 16; type
//  TMyRec = record
//
//  end align X deprecated 'x' align 2 align 4; // permitted
//
//  TMyRec7 = record
//
//  end deprecated 'Blah' deprecated 'x' align 2 align 4; // only 1 deprecated accepted
//                        ^ E1030 Invalid compiler directive
//
//  TMyRec6 = record
//
//  end deprecated 'Blah' align X deprecated 'x' align 2 align 4; // only 1 deprecated accepted
//
//  TMyRec3 = record
//
//  end align 1 shl 2; // permitted
//
//  TMyRec2 = record
//
//  end align; // E2029 Expression expected but ';' found
//
//  TMyRec4 = record
//
//  end; align; // E2029 '=' expected but ';' found


end;
{$ELSE}

procedure TTestRecordType.TestRecordTypeAppGlue;
const
  CAppGlue = 'type' + #13#10 +
  'Pandroid_app = ^Tandroid_app;' + #13#10 +
  'Pandroid_poll_source = ^android_poll_source;' + #13#10 +
  '' + #13#10 +
  'android_poll_source = record' + #13#10 +
  '  // The identifier of this source.  May be LOOPER_ID_MAIN or' + #13#10 +
  '  // LOOPER_ID_INPUT.' + #13#10 +
  '  id : Int32;' + #13#10 +
  '  // The android_app this ident is associated with.' + #13#10 +
  '  app : Pandroid_app;' + #13#10 +
  '  // Function to call to perform the standard processing of data from' + #13#10 +
  '  // this source.' + #13#10 +
  '  process : procedure(app: Pandroid_app; source: Pandroid_poll_source); cdecl;' + #13#10 +
  'end;';
begin
  OK(CAppGlue, TTestParser.ParsesAs(CAppGlue,
    'TypeSectionNode'+ #13#10 +
    '  TypeKeywordNode: TypeKeyword |type|'+ #13#10 +
    '  TypeListNode: ListNode'+ #13#10 +
    '    Items[0]: TypeDeclNode'+ #13#10 +
    '      AttributesListNode: (none)'+ #13#10 +
    '      NameNode: Identifier |Pandroid_app|'+ #13#10 +
    '      TypeParams: (none)'+ #13#10 +
    '      EqualSignNode: EqualSign |=|'+ #13#10 +
    '      TypeKeywordNode: (none)'+ #13#10 +
    '      TypeNode: PointerTypeNode'+ #13#10 +
    '        CaretNode: Caret |^|'+ #13#10 +
    '        TypeNode: Identifier |Tandroid_app|'+ #13#10 +
    '      PortabilityDirectiveListNode: (none)'+ #13#10 +
    '      SemicolonNode: Semicolon |;|'+ #13#10 +
    '    Items[1]: TypeDeclNode'+ #13#10 +
    '      AttributesListNode: (none)'+ #13#10 +
    '      NameNode: Identifier |Pandroid_poll_source|'+ #13#10 +
    '      TypeParams: (none)'+ #13#10 +
    '      EqualSignNode: EqualSign |=|'+ #13#10 +
    '      TypeKeywordNode: (none)'+ #13#10 +
    '      TypeNode: PointerTypeNode'+ #13#10 +
    '        CaretNode: Caret |^|'+ #13#10 +
    '        TypeNode: Identifier |android_poll_source|'+ #13#10 +
    '      PortabilityDirectiveListNode: (none)'+ #13#10 +
    '      SemicolonNode: Semicolon |;|'+ #13#10 +
    '    Items[2]: TypeDeclNode'+ #13#10 +
    '      AttributesListNode: (none)'+ #13#10 +
    '      NameNode: Identifier |android_poll_source|'+ #13#10 +
    '      TypeParams: (none)'+ #13#10 +
    '      EqualSignNode: EqualSign |=|'+ #13#10 +
    '      TypeKeywordNode: (none)'+ #13#10 +
    '      TypeNode: RecordTypeNode'+ #13#10 +
    '        RecordKeywordNode: RecordKeyword |record|'+ #13#10 +
    '        ContentListNode: ListNode'+ #13#10 +
    '          Items[0]: VisibilitySectionNode'+ #13#10 +
    '            VisibilityNode: (none)'+ #13#10 +
    '            ContentListNode: ListNode'+ #13#10 +
    '              Items[0]: FieldSectionNode'+ #13#10 +
    '                ClassKeywordNode: (none)'+ #13#10 +
    '                VarKeywordNode: (none)'+ #13#10 +
    '                FieldListNode: ListNode'+ #13#10 +
    '                  Items[0]: FieldDeclNode'+ #13#10 +
    '                    NameListNode: ListNode'+ #13#10 +
    '                      Items[0]: DelimitedItemNode'+ #13#10 +
    '                        ItemNode: Identifier |id|'+ #13#10 +
    '                        DelimiterNode: (none)'+ #13#10 +
    '                    ColonNode: Colon |:|'+ #13#10 +
    '                    TypeNode: Identifier |Int32|'+ #13#10 +
    '                    PortabilityDirectiveListNode: (none)'+ #13#10 +
    '                    SemicolonNode: Semicolon |;|'+ #13#10 +
    '                  Items[1]: FieldDeclNode'+ #13#10 +
    '                    NameListNode: ListNode'+ #13#10 +
    '                      Items[0]: DelimitedItemNode'+ #13#10 +
    '                        ItemNode: Identifier |app|'+ #13#10 +
    '                        DelimiterNode: (none)'+ #13#10 +
    '                    ColonNode: Colon |:|'+ #13#10 +
    '                    TypeNode: Identifier |Pandroid_app|'+ #13#10 +
    '                    PortabilityDirectiveListNode: (none)'+ #13#10 +
    '                    SemicolonNode: Semicolon |;|'+ #13#10 +
    '                  Items[2]: FieldDeclNode'+ #13#10 +
    '                    NameListNode: ListNode'+ #13#10 +
    '                      Items[0]: DelimitedItemNode'+ #13#10 +
    '                        ItemNode: Identifier |process|'+ #13#10 +
    '                        DelimiterNode: (none)'+ #13#10 +
    '                    ColonNode: Colon |:|'+ #13#10 +
    '                    TypeNode: ProcedureTypeNode'+ #13#10 +
    '                      MethodTypeNode: ProcedureKeyword |procedure|'+ #13#10 +
    '                      OpenParenthesisNode: OpenParenthesis |(|'+ #13#10 +
    '                      ParameterListNode: ListNode'+ #13#10 +
    '                        Items[0]: DelimitedItemNode'+ #13#10 +
    '                          ItemNode: ParameterNode'+ #13#10 +
    '                            ModifierNode: (none)'+ #13#10 +
    '                            NameListNode: ListNode'+ #13#10 +
    '                              Items[0]: DelimitedItemNode'+ #13#10 +
    '                                ItemNode: IdentAttrNode'+ #13#10 +
    '                                  AttributesListNode: (none)'+ #13#10 +
    '                                  Ident: Identifier |app|'+ #13#10 +
    '                                DelimiterNode: (none)'+ #13#10 +
    '                            ColonNode: Colon |:|'+ #13#10 +
    '                            TypeNode: Identifier |Pandroid_app|'+ #13#10 +
    '                            EqualSignNode: (none)'+ #13#10 +
    '                            DefaultValueNode: (none)'+ #13#10 +
    '                          DelimiterNode: Semicolon |;|'+ #13#10 +
    '                        Items[1]: DelimitedItemNode'+ #13#10 +
    '                          ItemNode: ParameterNode'+ #13#10 +
    '                            ModifierNode: (none)'+ #13#10 +
    '                            NameListNode: ListNode'+ #13#10 +
    '                              Items[0]: DelimitedItemNode'+ #13#10 +
    '                                ItemNode: IdentAttrNode'+ #13#10 +
    '                                  AttributesListNode: (none)'+ #13#10 +
    '                                  Ident: Identifier |source|'+ #13#10 +
    '                                DelimiterNode: (none)'+ #13#10 +
    '                            ColonNode: Colon |:|'+ #13#10 +
    '                            TypeNode: Identifier |Pandroid_poll_source|'+ #13#10 +
    '                            EqualSignNode: (none)'+ #13#10 +
    '                            DefaultValueNode: (none)'+ #13#10 +
    '                          DelimiterNode: (none)'+ #13#10 +
    '                      CloseParenthesisNode: CloseParenthesis |)|'+ #13#10 +
    '                      ColonNode: (none)'+ #13#10 +
    '                      ReturnTypeNode: (none)'+ #13#10 +
    '                      FirstDirectiveListNode: ListNode'+ #13#10 +
    '                        Items[0]: DirectiveNode'+ #13#10 +
    '                          SemicolonNode: Semicolon |;|'+ #13#10 +
    '                          KeywordNode: CdeclSemikeyword |cdecl|'+ #13#10 +
    '                          ValueNode: (none)'+ #13#10 +
    '                          DataNode: (none)'+ #13#10 +
    '                      OfKeywordNode: (none)'+ #13#10 +
    '                      ObjectKeywordNode: (none)'+ #13#10 +
    '                      SecondDirectiveListNode: (none)'+ #13#10 +
    '                    PortabilityDirectiveListNode: (none)'+ #13#10 +
    '                    SemicolonNode: Semicolon |;|'+ #13#10 +
    '        VariantSectionNode: (none)'+ #13#10 +
    '        EndKeywordNode: EndKeyword |end|'+ #13#10 +
    '        DirectivesNode: (none)'+ #13#10 +
    '      PortabilityDirectiveListNode: (none)'+ #13#10 +
    '      SemicolonNode: Semicolon |;|', RTTypeSection));
end;

procedure TTestRecordType.TestRecordTypeAlignNoData;
begin
  try
    TTestParser.ParsesAs('record end align', '', RTRecordType);
    // this should fail because an expression is expected after align
    OK(False, '() exception');
  except
    on ETestException do;
    on EParseException do
      OK(True, '() exception');
  else
    OK(False, '() exception');
  end;
end;

procedure TTestRecordType.TestRecordTypeAlign2;
//type
//  X = record end align 2;  // valid
//  Y = record end; align 4; // not valid due to ; separating end and align
begin
  OK('record end align 2', TTestParser.ParsesAs('record end align 2',
     'RecordTypeNode'+ #13#10 +
     '  RecordKeywordNode: RecordKeyword |record|'+ #13#10 +
     '  ContentListNode: (none)'+ #13#10 +
     '  VariantSectionNode: (none)'+ #13#10 +
     '  EndKeywordNode: EndKeyword |end|'+ #13#10 +
     '  DirectivesNode: ListNode'+ #13#10 +
     '    Items[0]: RecordAlignSpecifierNode'+ #13#10 +
     '      KeywordNode: AlignSemikeyword |align|'+ #13#10 +
     '      ValueNode: Number |2|', RTRecordType)); // this should succeed
end;

procedure TTestRecordType.TestRecordTypeAlign4;
begin
  OK('record end align 4', TTestParser.ParsesAs('record end align 4',
     'RecordTypeNode'+ #13#10 +
     '  RecordKeywordNode: RecordKeyword |record|'+ #13#10 +
     '  ContentListNode: (none)'+ #13#10 +
     '  VariantSectionNode: (none)'+ #13#10 +
     '  EndKeywordNode: EndKeyword |end|'+ #13#10 +
     '  DirectivesNode: ListNode'+ #13#10 +
     '    Items[0]: RecordAlignSpecifierNode'+ #13#10 +
     '      KeywordNode: AlignSemikeyword |align|'+ #13#10 +
     '      ValueNode: Number |4|', RTRecordType)); // this should succeed
end;

procedure TTestRecordType.TestRecordTypeDeprecated;
begin
  OK('record end deprecated', TTestParser.ParsesAs('record end deprecated',
    'RecordTypeNode'+ #13#10 +
    '  RecordKeywordNode: RecordKeyword |record|'+ #13#10 +
    '  ContentListNode: (none)'+ #13#10 +
    '  VariantSectionNode: (none)'+ #13#10 +
    '  EndKeywordNode: EndKeyword |end|'+ #13#10 +
    '  DirectivesNode: ListNode'+ #13#10 +
    '    Items[0]: DirectiveNode'+ #13#10 +
    '      SemicolonNode: (none)'+ #13#10 +
    '      KeywordNode: DeprecatedSemikeyword |deprecated|'+ #13#10 +
    '      ValueNode: (none)'+ #13#10 +
    '      DataNode: (none)', RTRecordType)); // this should succeed
end;

procedure TTestRecordType.TestRecordTypeDeprecatedMessage;
begin
  OK('record end deprecated ''Blah''', TTestParser.ParsesAs('record end deprecated ''Blah''',
    'RecordTypeNode'+ #13#10 +
    '  RecordKeywordNode: RecordKeyword |record|'+ #13#10 +
    '  ContentListNode: (none)'+ #13#10 +
    '  VariantSectionNode: (none)'+ #13#10 +
    '  EndKeywordNode: EndKeyword |end|'+ #13#10 +
    '  DirectivesNode: ListNode'+ #13#10 +
    '    Items[0]: DirectiveNode'+ #13#10 +
    '      SemicolonNode: (none)'+ #13#10 +
    '      KeywordNode: DeprecatedSemikeyword |deprecated|'+ #13#10 +
    '      ValueNode: StringLiteral |''Blah''|'+ #13#10 +
    '      DataNode: (none)', RTRecordType)); // this should succeedend;
end;

procedure TTestRecordType.TestEmptyRecord;
begin
  OK('record end', TTestParser.ParsesAs('record end',
    'RecordTypeNode' + #13#10 +
    '  RecordKeywordNode: RecordKeyword |record|' + #13#10 +
    '  ContentListNode: (none)' + #13#10 +
    '  VariantSectionNode: (none)' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|'+ #13#10 +
    '  DirectivesNode: (none)', RTRecordType));
end;

procedure TTestRecordType.TestRecordTypeMethod;
begin
  OK('record procedure Foo; end', TTestParser.ParsesAs('record procedure Foo; end',
    'RecordTypeNode' + #13#10 +
    '  RecordKeywordNode: RecordKeyword |record|' + #13#10 +
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
    '  VariantSectionNode: (none)' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|'+ #13#10 +
    '  DirectivesNode: (none)', RTRecordType));
end;

procedure TTestRecordType.TestRecordTypeVariant;
begin

  OK('record case Integer of 1: (); end',
    TTestParser.ParsesAs('record case Integer of 1: (); end',
    'RecordTypeNode' + #13#10 +
    '  RecordKeywordNode: RecordKeyword |record|' + #13#10 +
    '  ContentListNode: (none)' + #13#10 +
    '  VariantSectionNode: VariantSectionNode' + #13#10 +
    '    CaseKeywordNode: CaseKeyword |case|' + #13#10 +
    '    NameNode: (none)' + #13#10 +
    '    ColonNode: (none)' + #13#10 +
    '    TypeNode: Identifier |Integer|' + #13#10 +
    '    OfKeywordNode: OfKeyword |of|' + #13#10 +
    '    VariantGroupListNode: ListNode' + #13#10 +
    '      Items[0]: VariantGroupNode' + #13#10 +
    '        ValueListNode: ListNode' + #13#10 +
    '          Items[0]: DelimitedItemNode' + #13#10 +
    '            ItemNode: Number |1|' + #13#10 +
    '            DelimiterNode: (none)' + #13#10 +
    '        ColonNode: Colon |:|' + #13#10 +
    '        OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '        FieldDeclListNode: (none)' + #13#10 +
    '        VariantSectionNode: (none)' + #13#10 +
    '        CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '        SemicolonNode: Semicolon |;|' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|'+ #13#10 +
    '  DirectivesNode: (none)', RTRecordType));

//const X = 16; type
//  TMyRec = record
//
//  end align X deprecated 'x' align 2 align 4; // permitted
//
//  TMyRec7 = record
//
//  end deprecated 'Blah' deprecated 'x' align 2 align 4; // only 1 deprecated accepted
//                        ^ E1030 Invalid compiler directive
//
//  TMyRec6 = record
//
//  end deprecated 'Blah' align X deprecated 'x' align 2 align 4; // only 1 deprecated accepted
//
//  TMyRec3 = record
//
//  end align 1 shl 2; // permitted
//
//  TMyRec2 = record
//
//  end align; // E2029 Expression expected but ';' found
//
//  TMyRec4 = record
//
//  end; align; // E2029 '=' expected but ';' found


end;

procedure TTestRecordType.TestRecordTypeProcedure;
const
  CT1RecordAProcessProcedure: string =
   'type'#13#10+
   '  T1 = record'#13#10+
   '    AProcess: procedure;'#13#10+
   '  end;'; // should pass
begin
  OK(CT1RecordAProcessProcedure, TTestParser.ParsesAs(CT1RecordAProcessProcedure,
   'TypeSectionNode'+ #13#10 +
   '  TypeKeywordNode: TypeKeyword |type|'+ #13#10 +
   '  TypeListNode: ListNode'+ #13#10 +
   '    Items[0]: TypeDeclNode'+ #13#10 +
   '      AttributesListNode: (none)'+ #13#10 +
   '      NameNode: Identifier |T1|'+ #13#10 +
   '      TypeParams: (none)'+ #13#10 +
   '      EqualSignNode: EqualSign |=|'+ #13#10 +
   '      TypeKeywordNode: (none)'+ #13#10 +
   '      TypeNode: RecordTypeNode'+ #13#10 +
   '        RecordKeywordNode: RecordKeyword |record|'+ #13#10 +
   '        ContentListNode: ListNode'+ #13#10 +
   '          Items[0]: VisibilitySectionNode'+ #13#10 +
   '            VisibilityNode: (none)'+ #13#10 +
   '            ContentListNode: ListNode'+ #13#10 +
   '              Items[0]: FieldSectionNode'+ #13#10 +
   '                ClassKeywordNode: (none)'+ #13#10 +
   '                VarKeywordNode: (none)'+ #13#10 +
   '                FieldListNode: ListNode'+ #13#10 +
   '                  Items[0]: FieldDeclNode'+ #13#10 +
   '                    NameListNode: ListNode'+ #13#10 +
   '                      Items[0]: DelimitedItemNode'+ #13#10 +
   '                        ItemNode: Identifier |AProcess|'+ #13#10 +
   '                        DelimiterNode: (none)'+ #13#10 +
   '                    ColonNode: Colon |:|'+ #13#10 +
   '                    TypeNode: ProcedureTypeNode'+ #13#10 +
   '                      MethodTypeNode: ProcedureKeyword |procedure|'+ #13#10 +
   '                      OpenParenthesisNode: (none)'+ #13#10 +
   '                      ParameterListNode: (none)'+ #13#10 +
   '                      CloseParenthesisNode: (none)'+ #13#10 +
   '                      ColonNode: (none)'+ #13#10 +
   '                      ReturnTypeNode: (none)'+ #13#10 +
   '                      FirstDirectiveListNode: (none)'+ #13#10 +
   '                      OfKeywordNode: (none)'+ #13#10 +
   '                      ObjectKeywordNode: (none)'+ #13#10 +
   '                      SecondDirectiveListNode: (none)'+ #13#10 +
   '                    PortabilityDirectiveListNode: (none)'+ #13#10 +
   '                    SemicolonNode: Semicolon |;|'+ #13#10 +
   '        VariantSectionNode: (none)'+ #13#10 +
   '        EndKeywordNode: EndKeyword |end|'+ #13#10 +
   '        DirectivesNode: (none)'+ #13#10 +
   '      PortabilityDirectiveListNode: (none)'+ #13#10 +
   '      SemicolonNode: Semicolon |;|', RTTypeSection));
end;

procedure TTestRecordType.TestRecordTypeReferenceToProcedure;
const
  CT2RecordAProcessReferenceToProcedure: string =
   'type'#13#10+
   '  T2 = record'#13#10+
   '    AProcess: reference to procedure;'#13#10+
   '  end;'; // should fail
begin
  OK(CT2RecordAProcessReferenceToProcedure, TTestParser.ParsesAs(CT2RecordAProcessReferenceToProcedure,
   'TypeSectionNode'+ #13#10 +
   '  TypeKeywordNode: TypeKeyword |type|'+ #13#10 +
   '  TypeListNode: ListNode'+ #13#10 +
   '    Items[0]: TypeDeclNode'+ #13#10 +
   '      AttributesListNode: (none)'+ #13#10 +
   '      NameNode: Identifier |T2|'+ #13#10 +
   '      TypeParams: (none)'+ #13#10 +
   '      EqualSignNode: EqualSign |=|'+ #13#10 +
   '      TypeKeywordNode: (none)'+ #13#10 +
   '      TypeNode: RecordTypeNode'+ #13#10 +
   '        RecordKeywordNode: RecordKeyword |record|'+ #13#10 +
   '        ContentListNode: ListNode'+ #13#10 +
   '          Items[0]: VisibilitySectionNode'+ #13#10 +
   '            VisibilityNode: (none)'+ #13#10 +
   '            ContentListNode: ListNode'+ #13#10 +
   '              Items[0]: FieldSectionNode'+ #13#10 +
   '                ClassKeywordNode: (none)'+ #13#10 +
   '                VarKeywordNode: (none)'+ #13#10 +
   '                FieldListNode: ListNode'+ #13#10 +
   '                  Items[0]: FieldDeclNode'+ #13#10 +
   '                    NameListNode: ListNode'+ #13#10 +
   '                      Items[0]: DelimitedItemNode'+ #13#10 +
   '                        ItemNode: Identifier |AProcess|'+ #13#10 +
   '                        DelimiterNode: (none)'+ #13#10 +
   '                    ColonNode: Colon |:|'+ #13#10 +
   '                    TypeNode: AnonymousMethodTypeNode'+ #13#10 +
   '                      ReferenceKeywordNode: ReferenceSemikeyword |reference|'+ #13#10 +
   '                      ToKeywordNode: ToKeyword |to|'+ #13#10 +
   '                      MethodNode: ProcedureTypeNode'+ #13#10 +
   '                        MethodTypeNode: ProcedureKeyword |procedure|'+ #13#10 +
   '                        OpenParenthesisNode: (none)'+ #13#10 +
   '                        ParameterListNode: (none)'+ #13#10 +
   '                        CloseParenthesisNode: (none)'+ #13#10 +
   '                        ColonNode: (none)'+ #13#10 +
   '                        ReturnTypeNode: (none)'+ #13#10 +
   '                        FirstDirectiveListNode: (none)'+ #13#10 +
   '                        OfKeywordNode: (none)'+ #13#10 +
   '                        ObjectKeywordNode: (none)'+ #13#10 +
   '                        SecondDirectiveListNode: (none)'+ #13#10 +
   '                    PortabilityDirectiveListNode: (none)'+ #13#10 +
   '                    SemicolonNode: Semicolon |;|'+ #13#10 +
   '        VariantSectionNode: (none)'+ #13#10 +
   '        EndKeywordNode: EndKeyword |end|'+ #13#10 +
   '        DirectivesNode: (none)'+ #13#10 +
   '      PortabilityDirectiveListNode: (none)'+ #13#10 +
   '      SemicolonNode: Semicolon |;|', RTTypeSection));
end;

initialization
  RegisterTest(TTestRecordType.Suite);
{$ENDIF}
end.
