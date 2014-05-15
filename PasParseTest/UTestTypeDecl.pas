unit UTestTypeDecl;

interface

uses
  UTest;

type
  TTestTypeDecl = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestTypeDecl;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestTypeDecl }
{$IF NOT DEFINED(DUNIT)}
class function TTestTypeDecl.GetName: string;
begin
  Result := 'TypeDecl';
end;

class procedure TTestTypeDecl.TestAll;
begin
  OK('TFoo = Integer;', TTestParser.ParsesAs('TFoo = Integer;',
    'TypeDeclNode'+ #13#10 +
    '  AttributesListNode: (none)'+ #13#10 +
    '  NameNode: Identifier |TFoo|'+ #13#10 +
    '  TypeParams: (none)'+ #13#10 +
    '  EqualSignNode: EqualSign |=|'+ #13#10 +
    '  TypeKeywordNode: (none)'+ #13#10 +
    '  TypeNode: Identifier |Integer|'+ #13#10 +
    '  PortabilityDirectiveListNode: ListNode'+ #13#10 +
    '  SemicolonNode: Semicolon |;|', RTTypeDecl));

  OK('TFoo = type Integer;', TTestParser.ParsesAs('TFoo = type Integer;',
    'TypeDeclNode' + #13#10 +
    '  AttributesListNode: (none)'+ #13#10 +
    '  NameNode: Identifier |TFoo|' + #13#10 +
    '  TypeParams: (none)'+ #13#10 +
    '  EqualSignNode: EqualSign |=|' + #13#10 +
    '  TypeKeywordNode: TypeKeyword |type|' + #13#10 +
    '  TypeNode: Identifier |Integer|' + #13#10 +
    '  PortabilityDirectiveListNode: ListNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTTypeDecl));

  OK('TFoo = Integer experimental platform;', TTestParser.ParsesAs('TFoo = Integer experimental platform;',
    'TypeDeclNode'+ #13#10 +
    '  AttributesListNode: (none)'+ #13#10 +
    '  NameNode: Identifier |TFoo|'+ #13#10 +
    '  TypeParams: (none)'+ #13#10 +
    '  EqualSignNode: EqualSign |=|'+ #13#10 +
    '  TypeKeywordNode: (none)'+ #13#10 +
    '  TypeNode: Identifier |Integer|'+ #13#10 +
    '  PortabilityDirectiveListNode: ListNode'+ #13#10 +
    '    Items[0]: DirectiveNode'+ #13#10 +
    '      SemicolonNode: (none)'+ #13#10 +
    '      KeywordNode: ExperimentalSemikeyword |experimental|'+ #13#10 +
    '      ValueNode: (none)'+ #13#10 +
    '      DataNode: (none)'+ #13#10 +
    '    Items[1]: DirectiveNode'+ #13#10 +
    '      SemicolonNode: (none)'+ #13#10 +
    '      KeywordNode: PlatformSemikeyword |platform|'+ #13#10 +
    '      ValueNode: (none)'+ #13#10 +
    '      DataNode: (none)'+ #13#10 +
    '  SemicolonNode: Semicolon |;|', RTTypeDecl));

  OK('TFoo = class;', TTestParser.ParsesAs('TFoo = class;',
    'TypeForwardDeclarationNode' + #13#10 +
    '  AttributesListNode: (none)'+ #13#10 +
    '  NameNode: Identifier |TFoo|' + #13#10 +
    '  EqualSignNode: EqualSign |=|' + #13#10 +
    '  TypeNode: ClassKeyword |class|' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTTypeDecl));

  OK('IFoo = dispinterface;', TTestParser.ParsesAs('IFoo = dispinterface;',
    'TypeForwardDeclarationNode' + #13#10 +
    '  NameNode: Identifier |IFoo|' + #13#10 +
    '  EqualSignNode: EqualSign |=|' + #13#10 +
    '  TypeNode: DispInterfaceKeyword |dispinterface|' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTTypeDecl));

  OK('IFoo = interface;', TTestParser.ParsesAs('IFoo = interface;',
    'TypeForwardDeclarationNode' + #13#10 +
    '  NameNode: Identifier |IFoo|' + #13#10 +
    '  EqualSignNode: EqualSign |=|' + #13#10 +
    '  TypeNode: InterfaceKeyword |interface|' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTTypeDecl));
end;
{$ELSE}

procedure TTestTypeDecl.TestTypeDecl;
begin
  OK('TFoo = Integer;', TTestParser.ParsesAs('TFoo = Integer;',
    'TypeDeclNode'+ #13#10 +
    '  AttributesListNode: (none)'+ #13#10 +
    '  NameNode: Identifier |TFoo|'+ #13#10 +
    '  TypeParams: (none)'+ #13#10 +
    '  EqualSignNode: EqualSign |=|'+ #13#10 +
    '  TypeKeywordNode: (none)'+ #13#10 +
    '  TypeNode: Identifier |Integer|'+ #13#10 +
    '  PortabilityDirectiveListNode: (none)'+ #13#10 +
    '  SemicolonNode: Semicolon |;|', RTTypeDecl));

  OK('TFoo = type Integer;', TTestParser.ParsesAs('TFoo = type Integer;',
    'TypeDeclNode' + #13#10 +
    '  AttributesListNode: (none)'+ #13#10 +
    '  NameNode: Identifier |TFoo|' + #13#10 +
    '  TypeParams: (none)'+ #13#10 +
    '  EqualSignNode: EqualSign |=|' + #13#10 +
    '  TypeKeywordNode: TypeKeyword |type|' + #13#10 +
    '  TypeNode: Identifier |Integer|' + #13#10 +
    '  PortabilityDirectiveListNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTTypeDecl));

  OK('TFoo = Integer experimental platform;', TTestParser.ParsesAs('TFoo = Integer experimental platform;',
    'TypeDeclNode'+ #13#10 +
    '  AttributesListNode: (none)'+ #13#10 +
    '  NameNode: Identifier |TFoo|'+ #13#10 +
    '  TypeParams: (none)'+ #13#10 +
    '  EqualSignNode: EqualSign |=|'+ #13#10 +
    '  TypeKeywordNode: (none)'+ #13#10 +
    '  TypeNode: Identifier |Integer|'+ #13#10 +
    '  PortabilityDirectiveListNode: ListNode'+ #13#10 +
    '    Items[0]: DirectiveNode'+ #13#10 +
    '      SemicolonNode: (none)'+ #13#10 +
    '      KeywordNode: ExperimentalSemikeyword |experimental|'+ #13#10 +
    '      ValueNode: (none)'+ #13#10 +
    '      DataNode: (none)'+ #13#10 +
    '    Items[1]: DirectiveNode'+ #13#10 +
    '      SemicolonNode: (none)'+ #13#10 +
    '      KeywordNode: PlatformSemikeyword |platform|'+ #13#10 +
    '      ValueNode: (none)'+ #13#10 +
    '      DataNode: (none)'+ #13#10 +
    '  SemicolonNode: Semicolon |;|', RTTypeDecl));

  OK('TFoo = class;', TTestParser.ParsesAs('TFoo = class;',
    'TypeForwardDeclarationNode' + #13#10 +
    '  NameNode: Identifier |TFoo|' + #13#10 +
    '  EqualSignNode: EqualSign |=|' + #13#10 +
    '  TypeNode: ClassKeyword |class|' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTTypeDecl));

  OK('IFoo = dispinterface;', TTestParser.ParsesAs('IFoo = dispinterface;',
    'TypeForwardDeclarationNode' + #13#10 +
    '  NameNode: Identifier |IFoo|' + #13#10 +
    '  EqualSignNode: EqualSign |=|' + #13#10 +
    '  TypeNode: DispInterfaceKeyword |dispinterface|' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTTypeDecl));

  OK('IFoo = interface;', TTestParser.ParsesAs('IFoo = interface;',
    'TypeForwardDeclarationNode' + #13#10 +
    '  NameNode: Identifier |IFoo|' + #13#10 +
    '  EqualSignNode: EqualSign |=|' + #13#10 +
    '  TypeNode: InterfaceKeyword |interface|' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTTypeDecl));
end;

initialization
  RegisterTest(TTestTypeDecl.Suite);
{$ENDIF}
end.
