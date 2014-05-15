unit UTestGoal;

interface

uses
  UTest;

type
  TTestGoal = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestEmptyPackage;
    procedure TestEmptyUnit;
    procedure TestEmptyProgram;
    procedure TestEmptyLibrary;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestGoal }
{$IF NOT DEFINED(DUNIT)}
class function TTestGoal.GetName: string;
begin
  Result := 'Goal';
end;

class procedure TTestGoal.TestAll;
begin
  OK('package Foo; end.', TTestParser.ParsesAs('package Foo; end.',
    'PackageNode' + #13#10 +
    '  PackageKeywordNode: PackageSemikeyword |package|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  SemicolonNode: Semicolon |;|' + #13#10 +
    '  RequiresClauseNode: (none)' + #13#10 +
    '  ContainsClauseNode: (none)' + #13#10 +
    '  AttributeListNode: ListNode' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|' + #13#10 +
    '  DotNode: Dot |.|', RTGoal));

  OK('unit Foo; interface implementation end.',
    TTestParser.ParsesAs('unit Foo; interface implementation end.',
    'UnitNode' + #13#10 +
    '  UnitKeywordNode: UnitKeyword |unit|' + #13#10 +
    '  UnitNameNode: Identifier |Foo|' + #13#10 +
    '  PortabilityDirectiveListNode: ListNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|' + #13#10 +
    '  InterfaceSectionNode: UnitSectionNode' + #13#10 +
    '    HeaderKeywordNode: InterfaceKeyword |interface|' + #13#10 +
    '    UsesClauseNode: (none)' + #13#10 +
    '    ContentListNode: ListNode' + #13#10 +
    '  ImplementationSectionNode: UnitSectionNode' + #13#10 +
    '    HeaderKeywordNode: ImplementationKeyword |implementation|' + #13#10 +
    '    UsesClauseNode: (none)' + #13#10 +
    '    ContentListNode: ListNode' + #13#10 +
    '  InitSectionNode: InitSectionNode' + #13#10 +
    '    InitializationKeywordNode: (none)' + #13#10 +
    '    InitializationStatementListNode: ListNode' + #13#10 +
    '    FinalizationKeywordNode: (none)' + #13#10 +
    '    FinalizationStatementListNode: ListNode' + #13#10 +
    '    EndKeywordNode: EndKeyword |end|' + #13#10 +
    '  DotNode: Dot |.|', RTGoal));

  OK('program Foo; end.', TTestParser.ParsesAs('program Foo; end.',
    'ProgramNode' + #13#10 +
    '  ProgramKeywordNode: ProgramKeyword |program|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  NoiseOpenParenthesisNode: (none)' + #13#10 +
    '  NoiseContentListNode: ListNode' + #13#10 +
    '  NoiseCloseParenthesisNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|' + #13#10 +
    '  UsesClauseNode: (none)' + #13#10 +
    '  DeclarationListNode: ListNode' + #13#10 +
    '  InitSectionNode: InitSectionNode' + #13#10 +
    '    InitializationKeywordNode: (none)' + #13#10 +
    '    InitializationStatementListNode: ListNode' + #13#10 +
    '    FinalizationKeywordNode: (none)' + #13#10 +
    '    FinalizationStatementListNode: ListNode' + #13#10 +
    '    EndKeywordNode: EndKeyword |end|' + #13#10 +
    '  DotNode: Dot |.|', RTGoal));

  OK('library Foo; end.', TTestParser.ParsesAs('library Foo; end.',
    'ProgramNode' + #13#10 +
    '  ProgramKeywordNode: LibraryKeyword |library|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  NoiseOpenParenthesisNode: (none)' + #13#10 +
    '  NoiseContentListNode: ListNode' + #13#10 +
    '  NoiseCloseParenthesisNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|' + #13#10 +
    '  UsesClauseNode: (none)' + #13#10 +
    '  DeclarationListNode: ListNode' + #13#10 +
    '  InitSectionNode: InitSectionNode' + #13#10 +
    '    InitializationKeywordNode: (none)' + #13#10 +
    '    InitializationStatementListNode: ListNode' + #13#10 +
    '    FinalizationKeywordNode: (none)' + #13#10 +
    '    FinalizationStatementListNode: ListNode' + #13#10 +
    '    EndKeywordNode: EndKeyword |end|' + #13#10 +
    '  DotNode: Dot |.|', RTGoal));    
end;
{$ELSE}

procedure TTestGoal.TestEmptyPackage;
begin
  OK('package Foo; end.', TTestParser.ParsesAs('package Foo; end.',
    'PackageNode' + #13#10 +
    '  PackageKeywordNode: PackageSemikeyword |package|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  SemicolonNode: Semicolon |;|' + #13#10 +
    '  RequiresClauseNode: (none)' + #13#10 +
    '  ContainsClauseNode: (none)' + #13#10 +
    '  AttributeListNode: (none)' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|' + #13#10 +
    '  DotNode: Dot |.|', RTGoal));
end;

procedure TTestGoal.TestEmptyUnit;
begin
  OK('unit Foo; interface implementation end.',
    TTestParser.ParsesAs('unit Foo; interface implementation end.',
    'UnitNode'+ #13#10 +
    '  UnitKeywordNode: UnitKeyword |unit|'+ #13#10 +
    '  UnitNameNode: Identifier |Foo|'+ #13#10 +
    '  PortabilityDirectiveListNode: (none)'+ #13#10 +
    '  SemicolonNode: Semicolon |;|'+ #13#10 +
    '  InterfaceSectionNode: UnitSectionNode'+ #13#10 +
    '    HeaderKeywordNode: InterfaceKeyword |interface|'+ #13#10 +
    '    UsesClauseNode: (none)'+ #13#10 +
    '    ContentListNode: (none)'+ #13#10 +
    '  ImplementationSectionNode: UnitSectionNode'+ #13#10 +
    '    HeaderKeywordNode: ImplementationKeyword |implementation|'+ #13#10 +
    '    UsesClauseNode: (none)'+ #13#10 +
    '    ContentListNode: (none)'+ #13#10 +
    '  InitSectionNode: InitSectionNode'+ #13#10 +
    '    AttributesListNode: (none)'+ #13#10 +
    '    InitializationKeywordNode: (none)'+ #13#10 +
    '    InitializationStatementListNode: (none)'+ #13#10 +
    '    FinalizationKeywordNode: (none)'+ #13#10 +
    '    FinalizationStatementListNode: (none)'+ #13#10 +
    '    EndKeywordNode: EndKeyword |end|'+ #13#10 +
    '  DotNode: Dot |.|', RTGoal));
end;

procedure TTestGoal.TestEmptyProgram;
begin
  OK('program Foo; end.', TTestParser.ParsesAs('program Foo; end.',
    'ProgramNode' + #13#10 +
    '  ProgramKeywordNode: ProgramKeyword |program|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  NoiseOpenParenthesisNode: (none)' + #13#10 +
    '  NoiseContentListNode: (none)' + #13#10 +
    '  NoiseCloseParenthesisNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|' + #13#10 +
    '  UsesClauseNode: (none)' + #13#10 +
    '  DeclarationListNode: (none)' + #13#10 +
    '  InitSectionNode: InitSectionNode' + #13#10 +
    '    AttributesListNode: (none)'+ #13#10 +
    '    InitializationKeywordNode: (none)' + #13#10 +
    '    InitializationStatementListNode: (none)' + #13#10 +
    '    FinalizationKeywordNode: (none)' + #13#10 +
    '    FinalizationStatementListNode: (none)' + #13#10 +
    '    EndKeywordNode: EndKeyword |end|' + #13#10 +
    '  DotNode: Dot |.|', RTGoal));
end;

procedure TTestGoal.TestEmptyLibrary;
begin
  OK('library Foo; end.', TTestParser.ParsesAs('library Foo; end.',
    'ProgramNode' + #13#10 +
    '  ProgramKeywordNode: LibraryKeyword |library|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  NoiseOpenParenthesisNode: (none)' + #13#10 +
    '  NoiseContentListNode: (none)' + #13#10 +
    '  NoiseCloseParenthesisNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|' + #13#10 +
    '  UsesClauseNode: (none)' + #13#10 +
    '  DeclarationListNode: (none)' + #13#10 +
    '  InitSectionNode: InitSectionNode' + #13#10 +
    '    AttributesListNode: (none)'+ #13#10 +
    '    InitializationKeywordNode: (none)' + #13#10 +
    '    InitializationStatementListNode: (none)' + #13#10 +
    '    FinalizationKeywordNode: (none)' + #13#10 +
    '    FinalizationStatementListNode: (none)' + #13#10 +
    '    EndKeywordNode: EndKeyword |end|' + #13#10 +
    '  DotNode: Dot |.|', RTGoal));
end;

initialization
  RegisterTest(TTestGoal.Suite);
{$ENDIF}
end.
