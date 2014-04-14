unit UTestTypeSection;

interface

uses
  UTest;

type
  TTestTypeSection = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType, UParseException;

{ TTestTypeSection }

class function TTestTypeSection.GetName: string;
begin
  Result := 'TypeSection';
end;

class procedure TTestTypeSection.TestAll;
begin
  OK('type TProc = reference to procedure;',
    TTestParser.ParsesAs('type TProc = reference to procedure;',
    'TypeSectionNode' + #13#10 +
    '  TypeKeywordNode: TypeKeyword |type|' + #13#10 +
    '  TypeListNode: ListNode' + #13#10 +
    '    Items[0]: TypeDeclNode' + #13#10 +
    '      NameNode: Identifier |TProc|' + #13#10 +
    '      EqualSignNode: EqualSign |=|' + #13#10 +
    '      TypeKeywordNode: (none)' + #13#10 +
    '      TypeNode: AnonymousMethodTypeNode' + #13#10 +
    '        ReferenceKeywordNode: ReferenceSemikeyword |reference|' + #13#10 +
    '        ToKeywordNode: ToKeyword |to|' + #13#10 +
    '        MethodNode: ProcedureTypeNode' + #13#10 +
    '          MethodTypeNode: ProcedureKeyword |procedure|' + #13#10 +
    '          OpenParenthesisNode: (none)' + #13#10 +
    '          ParameterListNode: ListNode' + #13#10 +
    '          CloseParenthesisNode: (none)' + #13#10 +
    '          ColonNode: (none)' + #13#10 +
    '          ReturnTypeNode: (none)' + #13#10 +
    '          FirstDirectiveListNode: ListNode' + #13#10 +
    '          OfKeywordNode: (none)' + #13#10 +
    '          ObjectKeywordNode: (none)' + #13#10 +
    '          SecondDirectiveListNode: ListNode' + #13#10 +
    '      PortabilityDirectiveListNode: ListNode' + #13#10 +
    '      SemicolonNode: Semicolon |;|', RTTypeSection));

  OK('type TFoo = Integer; TBar = Byte;', 
    TTestParser.ParsesAs('type TFoo = Integer; TBar = Byte;',
    'TypeSectionNode' + #13#10 +
    '  TypeKeywordNode: TypeKeyword |type|' + #13#10 +
    '  TypeListNode: ListNode' + #13#10 +
    '    Items[0]: TypeDeclNode' + #13#10 +
    '      NameNode: Identifier |TFoo|' + #13#10 +
    '      EqualSignNode: EqualSign |=|' + #13#10 +
    '      TypeKeywordNode: (none)' + #13#10 +
    '      TypeNode: Identifier |Integer|' + #13#10 +
    '      PortabilityDirectiveListNode: ListNode' + #13#10 +
    '      SemicolonNode: Semicolon |;|' + #13#10 +
    '    Items[1]: TypeDeclNode' + #13#10 +
    '      NameNode: Identifier |TBar|' + #13#10 +
    '      EqualSignNode: EqualSign |=|' + #13#10 +
    '      TypeKeywordNode: (none)' + #13#10 +
    '      TypeNode: Identifier |Byte|' + #13#10 +
    '      PortabilityDirectiveListNode: ListNode' + #13#10 +
    '      SemicolonNode: Semicolon |;|', RTTypeSection));

  OK('type TFoo = class;', TTestParser.ParsesAs('type TFoo = class;',
    'TypeSectionNode' + #13#10 +
    '  TypeKeywordNode: TypeKeyword |type|' + #13#10 +
    '  TypeListNode: ListNode' + #13#10 +
    '    Items[0]: TypeForwardDeclarationNode' + #13#10 +
    '      NameNode: Identifier |TFoo|' + #13#10 +
    '      EqualSignNode: EqualSign |=|' + #13#10 +
    '      TypeNode: ClassKeyword |class|' + #13#10 +
    '      SemicolonNode: Semicolon |;|', RTTypeSection));

  try
    TTestParser.ParsesAs('type', '', RTTypeSection);
    OK(False, 'type exception');
  except
    on ETestException do;
    on EParseException do
      OK(True, 'type exception');
  else
    OK(False, 'type exception');
  end;
end;

end.
