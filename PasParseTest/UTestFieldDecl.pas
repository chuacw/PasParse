unit UTestFieldDecl;

interface

uses
  UTest;

type
  TTestFieldDecl = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestFieldDecl;
    procedure TestFieldDecl2;
    procedure TestFieldDecl3;
    procedure TestFieldDecl4;
    procedure TestFieldDeclReturnTypeGenerics;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType, UParser, UCompilerDefines{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestFieldDecl }
{$IF NOT DEFINED(DUNIT)}
class function TTestFieldDecl.GetName: string;
begin
  Result := 'FieldDecl';
end;

class procedure TTestFieldDecl.TestAll;
var
  ACompilerDefines: TCompilerDefines;
  AParser: TParser;
begin
  OK('Foo: Integer', TTestParser.ParsesAs('Foo: Integer',
    'FieldDeclNode' + #13#10 +
    '  NameListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  TypeNode: Identifier |Integer|' + #13#10 +
    '  PortabilityDirectiveListNode: ListNode' + #13#10 +
    '  SemicolonNode: (none)', RTFieldDecl));

  OK('Foo: Integer library deprecated;', 
    TTestParser.ParsesAs('Foo: Integer library deprecated;', 
    'FieldDeclNode' + #13#10 +
    '  NameListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  TypeNode: Identifier |Integer|' + #13#10 +
    '  PortabilityDirectiveListNode: ListNode' + #13#10 +
    '    Items[0]: LibraryKeyword |library|' + #13#10 +
    '    Items[1]: DeprecatedSemikeyword |deprecated|' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTFieldDecl));

  ACompilerDefines := TCompilerDefines.Create;

  AParser := TParser.CreateFromText('public', '', ACompilerDefines, nil);
  OK('LookAhead: public', not AParser.CanParseRule(RTFieldDecl));
  AParser.Free;

  AParser := TParser.CreateFromText('strict private', '', ACompilerDefines, nil);
  OK('LookAhead: strict private', not AParser.CanParseRule(RTFieldDecl));
  AParser.Free;

  ACompilerDefines.Free;
end;
{$ELSE}

procedure TTestFieldDecl.TestFieldDecl;
begin
  OK('Foo: Integer', TTestParser.ParsesAs('Foo: Integer',
    'FieldDeclNode' + #13#10 +
    '  NameListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  TypeNode: Identifier |Integer|' + #13#10 +
    '  PortabilityDirectiveListNode: (none)' + #13#10 +
    '  SemicolonNode: (none)', RTFieldDecl));
end;

procedure TTestFieldDecl.TestFieldDecl2;
begin
  OK('Foo: Integer library deprecated;',
    TTestParser.ParsesAs('Foo: Integer library deprecated;',
     'FieldDeclNode'+ #13#10 +
     '  NameListNode: ListNode'+ #13#10 +
     '    Items[0]: DelimitedItemNode'+ #13#10 +
     '      ItemNode: Identifier |Foo|'+ #13#10 +
     '      DelimiterNode: (none)'+ #13#10 +
     '  ColonNode: Colon |:|'+ #13#10 +
     '  TypeNode: Identifier |Integer|'+ #13#10 +
     '  PortabilityDirectiveListNode: ListNode'+ #13#10 +
     '    Items[0]: DirectiveNode'+ #13#10 +
     '      SemicolonNode: (none)'+ #13#10 +
     '      KeywordNode: LibraryKeyword |library|'+ #13#10 +
     '      ValueNode: (none)'+ #13#10 +
     '      DataNode: (none)'+ #13#10 +
     '    Items[1]: DirectiveNode'+ #13#10 +
     '      SemicolonNode: (none)'+ #13#10 +
     '      KeywordNode: DeprecatedSemikeyword |deprecated|'+ #13#10 +
     '      ValueNode: (none)'+ #13#10 +
     '      DataNode: (none)'+ #13#10 +
     '  SemicolonNode: Semicolon |;|', RTFieldDecl));
end;

procedure TTestFieldDecl.TestFieldDecl3;
var
  ACompilerDefines: TCompilerDefines;
  AParser: TParser;
begin
  ACompilerDefines := TCompilerDefines.Create;
  try
    AParser := TParser.CreateFromText('strict private', '', ACompilerDefines, nil);
    try
      OK('LookAhead: strict private', not AParser.CanParseRule(RTFieldDecl));
    finally
      AParser.Free;
    end;
  finally
    ACompilerDefines.Free;
  end;
end;

procedure TTestFieldDecl.TestFieldDecl4;
var
  ACompilerDefines: TCompilerDefines;
  AParser: TParser;
begin
  ACompilerDefines := TCompilerDefines.Create;
  try
    AParser := TParser.CreateFromText('public', '', ACompilerDefines, nil);
    try
      OK('LookAhead: public', not AParser.CanParseRule(RTFieldDecl));
    finally
      AParser.Free;
    end;
  finally
    ACompilerDefines.Free;
  end;
end;

procedure TTestFieldDecl.TestFieldDeclReturnTypeGenerics;
const
  CTestStr: string = 'FMethodInfoData: TArray<JNIMethodInvokeData>';
begin
  OK(CTestStr, TTestParser.ParsesAs(CTestStr,
   'FieldDeclNode'+ #13#10 +
   '  NameListNode: ListNode'+ #13#10 +
   '    Items[0]: DelimitedItemNode'+ #13#10 +
   '      ItemNode: Identifier |FMethodInfoData|'+ #13#10 +
   '      DelimiterNode: (none)'+ #13#10 +
   '  ColonNode: Colon |:|'+ #13#10 +
   '  TypeNode: IdentTypeArgsNode'+ #13#10 +
   '    Ident: Identifier |TArray|'+ #13#10 +
   '    TypeArgsNode: TypeParamsUsageNode'+ #13#10 +
   '      OpenBracketNode: LessThan |<|'+ #13#10 +
   '      TypeParamNode: ListNode'+ #13#10 +
   '        Items[0]: DelimitedItemNode'+ #13#10 +
   '          ItemNode: Identifier |JNIMethodInvokeData|'+ #13#10 +
   '          DelimiterNode: (none)'+ #13#10 +
   '      CloseBracketNode: GreaterThan |>|'+ #13#10 +
   '  PortabilityDirectiveListNode: (none)'+ #13#10 +
   '  SemicolonNode: (none)', RTFieldDecl));
end;


initialization
  RegisterTest(TTestFieldDecl.Suite);
{$ENDIF}
end.
