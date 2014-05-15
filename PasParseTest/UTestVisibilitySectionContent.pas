unit UTestVisibilitySectionContent;

interface

uses
  UTest;

type
  TTestVisibilitySectionContent = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestFooInteger;
    procedure TestProcedureFoo;
    procedure TestConstFooEqual24;
    procedure TestTypeTFooEqualInteger;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestVisibilitySectionContent }
{$IF NOT DEFINED(DUNIT)}
class function TTestVisibilitySectionContent.GetName: string;
begin
  Result := 'VisibilitySectionContent';
end;

class procedure TTestVisibilitySectionContent.TestAll;
begin
  OK('Foo: Integer;', TTestParser.ParsesAs('Foo: Integer;',
    'FieldSectionNode' + #13#10 +
    '  ClassKeywordNode: (none)' + #13#10 +
    '  VarKeywordNode: (none)' + #13#10 +
    '  FieldListNode: ListNode' + #13#10 +
    '    Items[0]: FieldDeclNode' + #13#10 +
    '      NameListNode: ListNode' + #13#10 +
    '        Items[0]: DelimitedItemNode' + #13#10 +
    '          ItemNode: Identifier |Foo|' + #13#10 +
    '          DelimiterNode: (none)' + #13#10 +
    '      ColonNode: Colon |:|' + #13#10 +
    '      TypeNode: Identifier |Integer|' + #13#10 +
    '      PortabilityDirectiveListNode: ListNode' + #13#10 +
    '      SemicolonNode: Semicolon |;|', RTVisibilitySectionContent));

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
    '  SemicolonNode: Semicolon |;|', RTVisibilitySectionContent));

  OK('const Foo = 24;', TTestParser.ParsesAs('const Foo = 24;',
    'ConstSectionNode' + #13#10 +
    '  ConstKeywordNode: ConstKeyword |const|' + #13#10 +
    '  ConstListNode: ListNode' + #13#10 +
    '    Items[0]: ConstantDeclNode' + #13#10 +
    '      NameNode: Identifier |Foo|' + #13#10 +
    '      ColonNode: (none)' + #13#10 +
    '      TypeNode: (none)' + #13#10 +
    '      EqualSignNode: EqualSign |=|' + #13#10 +
    '      ValueNode: Number |24|' + #13#10 +
    '      PortabilityDirectiveListNode: ListNode' + #13#10 +
    '      SemicolonNode: Semicolon |;|', RTVisibilitySectionContent));

  OK('type TFoo = Integer;', TTestParser.ParsesAs('type TFoo = Integer;',
    'TypeSectionNode'+ #13#10 +
    '  TypeKeywordNode: TypeKeyword |type|'+ #13#10 +
    '  TypeListNode: ListNode'+ #13#10 +
    '    Items[0]: TypeDeclNode'+ #13#10 +
    '      NameNode: Identifier |TFoo|'+ #13#10 +
    '      TypeParams: (none)'+ #13#10 +
    '      EqualSignNode: EqualSign |=|'+ #13#10 +
    '      TypeKeywordNode: (none)'+ #13#10 +
    '      TypeNode: Identifier |Integer|'+ #13#10 +
    '      PortabilityDirectiveListNode: ListNode'+ #13#10 +
    '      SemicolonNode: Semicolon |;|', RTVisibilitySectionContent));
end;
{$ELSE}

procedure TTestVisibilitySectionContent.TestFooInteger;
begin
  OK('Foo: Integer;', TTestParser.ParsesAs('Foo: Integer;',
    'FieldSectionNode'+ #13#10 +
    '  ClassKeywordNode: (none)'+ #13#10 +
    '  VarKeywordNode: (none)'+ #13#10 +
    '  FieldListNode: ListNode'+ #13#10 +
    '    Items[0]: FieldDeclNode'+ #13#10 +
    '      NameListNode: ListNode'+ #13#10 +
    '        Items[0]: DelimitedItemNode'+ #13#10 +
    '          ItemNode: IdentAttrNode'+ #13#10 +
    '            AttributesListNode: (none)'+ #13#10 +
    '            Ident: Identifier |Foo|'+ #13#10 +
    '          DelimiterNode: (none)'+ #13#10 +
    '      ColonNode: Colon |:|'+ #13#10 +
    '      TypeNode: Identifier |Integer|'+ #13#10 +
    '      PortabilityDirectiveListNode: (none)'+ #13#10 +
    '      SemicolonNode: Semicolon |;|', RTVisibilitySectionContent));
end;

procedure TTestVisibilitySectionContent.TestProcedureFoo;
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
    '  SemicolonNode: Semicolon |;|', RTVisibilitySectionContent));
end;

procedure TTestVisibilitySectionContent.TestConstFooEqual24;
begin
  OK('const Foo = 24;', TTestParser.ParsesAs('const Foo = 24;',
    'ConstSectionNode' + #13#10 +
    '  ConstKeywordNode: ConstKeyword |const|' + #13#10 +
    '  ConstListNode: ListNode' + #13#10 +
    '    Items[0]: ConstantDeclNode' + #13#10 +
    '      NameNode: Identifier |Foo|' + #13#10 +
    '      ColonNode: (none)' + #13#10 +
    '      TypeNode: (none)' + #13#10 +
    '      EqualSignNode: EqualSign |=|' + #13#10 +
    '      ValueNode: Number |24|' + #13#10 +
    '      PortabilityDirectiveListNode: (none)' + #13#10 +
    '      SemicolonNode: Semicolon |;|', RTVisibilitySectionContent));
end;

procedure TTestVisibilitySectionContent.TestTypeTFooEqualInteger;
begin
  OK('type TFoo = Integer;', TTestParser.ParsesAs('type TFoo = Integer;',
    'TypeSectionNode'+ #13#10 +
    '  TypeKeywordNode: TypeKeyword |type|'+ #13#10 +
    '  TypeListNode: ListNode'+ #13#10 +
    '    Items[0]: TypeDeclNode'+ #13#10 +
    '      AttributesListNode: (none)'+ #13#10 +
    '      NameNode: Identifier |TFoo|'+ #13#10 +
    '      TypeParams: (none)'+ #13#10 +
    '      EqualSignNode: EqualSign |=|'+ #13#10 +
    '      TypeKeywordNode: (none)'+ #13#10 +
    '      TypeNode: Identifier |Integer|'+ #13#10 +
    '      PortabilityDirectiveListNode: (none)'+ #13#10 +
    '      SemicolonNode: Semicolon |;|', RTVisibilitySectionContent));
end;

initialization
  RegisterTest(TTestVisibilitySectionContent.Suite);
{$ENDIF}
end.
