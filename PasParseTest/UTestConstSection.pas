unit UTestConstSection;

interface

uses
  UTest;

type
  TTestConstSection = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestConstFooEqual24BarEqual42;
    procedure TestResourcestringFooEqualBar;
    procedure TestConstConst;
    procedure TestConstException;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType, UParseException
{$IF DEFINED(DUNIT)}, TestFramework, UCompilerDefines, UParser{$ENDIF};

{ TTestConstSection }
{$IF NOT DEFINED(DUNIT)}
class function TTestConstSection.GetName: string;
begin
  Result := 'ConstSection';
end;

class procedure TTestConstSection.TestAll;
begin
  OK('const Foo = 24; Bar = 42;', TTestParser.ParsesAs('const Foo = 24; Bar = 42;',
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
    '      SemicolonNode: Semicolon |;|' + #13#10 +
    '    Items[1]: ConstantDeclNode' + #13#10 +
    '      NameNode: Identifier |Bar|' + #13#10 +
    '      ColonNode: (none)' + #13#10 +
    '      TypeNode: (none)' + #13#10 +
    '      EqualSignNode: EqualSign |=|' + #13#10 +
    '      ValueNode: Number |42|' + #13#10 +
    '      PortabilityDirectiveListNode: (none)' + #13#10 +
    '      SemicolonNode: Semicolon |;|', RTConstSection));

  OK('resourcestring Foo = ''Bar'';', TTestParser.ParsesAs('resourcestring Foo = ''Bar'';',
    'ConstSectionNode' + #13#10 +
    '  ConstKeywordNode: ResourceStringKeyword |resourcestring|' + #13#10 +
    '  ConstListNode: ListNode' + #13#10 +
    '    Items[0]: ConstantDeclNode' + #13#10 +
    '      NameNode: Identifier |Foo|' + #13#10 +
    '      ColonNode: (none)' + #13#10 +
    '      TypeNode: (none)' + #13#10 +
    '      EqualSignNode: EqualSign |=|' + #13#10 +
    '      ValueNode: StringLiteral |''Bar''|' + #13#10 +
    '      PortabilityDirectiveListNode: ListNode' + #13#10 +
    '      SemicolonNode: Semicolon |;|', RTConstSection));

  try
    TTestParser.ParsesAs('const', '', RTConstSection);
    OK(False, 'const exception');
  except
    on ETestException do;
    on EParseException do
      OK(True, 'const exception');
  else
    OK(False, 'const exception');
  end;
end;
{$ELSE}

var
  ACompilerDefines: TCompilerDefines;

procedure TTestConstSection.SetUp;
begin
  ACompilerDefines := TCompilerDefines.Create;
end;

procedure TTestConstSection.TearDown;
begin
  ACompilerDefines.Free;
end;

procedure TTestConstSection.TestConstConst;
const
  CConstConst: string =
    'const' +
    '{$IFDEF MSWINDOWS}' +
    '  unwind = ''unwind.dll'';' +
    '{$ENDIF MSWINDOWS}' +
    '{$IFDEF LINUX}' +
    '  unwind = ''libcgunwind.so.1'';' +
    '{$ENDIF LINUX}' +
    '{$IFDEF MACOS}' +
    '  unwind = ''libcgunwind.1.0.dylib'';' +
    '{$ENDIF MACOS}' +
    '' +
    'const' +
    '  {$IFDEF UNDERSCOREIMPORTNAME}' +
    '  _PU = ''_'';' +
    '  {$ELSE}' +
    '  _PU = '''';' +
    '  {$ENDIF}';
var
  AParser: TParser;
begin
  AParser := TParser.CreateFromText(CConstConst, '', ACompilerDefines, nil);
  try
    OK(CConstConst, not AParser.CanParseRule(RTConstSection));
  finally
    AParser.Free;
  end;
end;

procedure TTestConstSection.TestConstFooEqual24BarEqual42;
begin
  OK('const Foo = 24; Bar = 42;', TTestParser.ParsesAs('const Foo = 24; Bar = 42;',
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
    '      SemicolonNode: Semicolon |;|' + #13#10 +
    '    Items[1]: ConstantDeclNode' + #13#10 +
    '      NameNode: Identifier |Bar|' + #13#10 +
    '      ColonNode: (none)' + #13#10 +
    '      TypeNode: (none)' + #13#10 +
    '      EqualSignNode: EqualSign |=|' + #13#10 +
    '      ValueNode: Number |42|' + #13#10 +
    '      PortabilityDirectiveListNode: (none)' + #13#10 +
    '      SemicolonNode: Semicolon |;|', RTConstSection));
end;

procedure TTestConstSection.TestResourcestringFooEqualBar;
begin
  OK('resourcestring Foo = ''Bar'';', TTestParser.ParsesAs('resourcestring Foo = ''Bar'';',
    'ConstSectionNode' + #13#10 +
    '  ConstKeywordNode: ResourceStringKeyword |resourcestring|' + #13#10 +
    '  ConstListNode: ListNode' + #13#10 +
    '    Items[0]: ConstantDeclNode' + #13#10 +
    '      NameNode: Identifier |Foo|' + #13#10 +
    '      ColonNode: (none)' + #13#10 +
    '      TypeNode: (none)' + #13#10 +
    '      EqualSignNode: EqualSign |=|' + #13#10 +
    '      ValueNode: StringLiteral |''Bar''|' + #13#10 +
    '      PortabilityDirectiveListNode: (none)' + #13#10 +
    '      SemicolonNode: Semicolon |;|', RTConstSection));
end;

procedure TTestConstSection.TestConstException;
begin
  try
    TTestParser.ParsesAs('const', '', RTConstSection);
    OK(False, 'const exception');
  except
    on ETestException do;
    on EParseException do
      OK(True, 'const exception');
  else
    OK(False, 'const exception');
  end;
end;

initialization
  RegisterTest(TTestConstSection.Suite);
{$ENDIF}
end.
