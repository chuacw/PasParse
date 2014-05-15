unit UTestDirective;

interface

uses
  UTest;

type
  TTestDirective = class(TTest)
  private
    class function SimpleDirective(const AKeyword: string): string;
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestDeprecatedDirective1;
    procedure TestLibraryDirective;
    procedure TestPascalDirective;
    procedure TestPlatformDirective;
    procedure TestRegisterDirective;
    procedure TestReintroduceDirective;
    procedure TestSafecallDirective;
    procedure TestStaticDirective;
    procedure TestStdcallDirective;
    procedure TestVarArgsDirective;
    procedure TestVirtualDirective;
    procedure TestAbstractDirective1;
    procedure TestAbstractDirective2;
    procedure TestAssemblerDirective;
    procedure TestCdeclDirective;
    procedure TestDispDirective1;
    procedure TestDispDirective2;
    procedure TestDelayedDirective;
    procedure TestDynamicDirective;
    procedure TestExportDirective;
    procedure TestExternalDirective1;
    procedure TestExternalDirective2;
    procedure TestExternalDirective4;
    procedure TestExternalFooDllIndex45NameBarDelayed;
    procedure TestExternalDirective6;
    procedure TestFarDirective;
    procedure TestFinalDirective;
    procedure TestForwardDirective;
    procedure TestInlineDirective;
    procedure TestLocalDirective;
    procedure TestMessageDirective1;
    procedure TestMessageDirective2;
    procedure TestMessageDirective3;
    procedure TestNearDirective;
    procedure TestOverloadDirective;
    procedure TestOverrideDirective;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType, UParseException{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestDirective }

class function TTestDirective.SimpleDirective(const AKeyword: string): string;
begin
  Result := 'DirectiveNode' + #13#10 +
    '  SemicolonNode: (none)' + #13#10 +
    '  KeywordNode: ' + AKeyword + #13#10 +
    '  ValueNode: (none)' + #13#10 +
    '  DataNode: (none)';
end;

{$IF NOT DEFINED(DUNIT)}
class function TTestDirective.GetName: string;
begin
  Result := 'Directive';
end;

class procedure TTestDirective.TestAll;
begin
  OK('abstract', TTestParser.ParsesAs('abstract',
    SimpleDirective('AbstractSemikeyword |abstract|'), RTDirective));
  OK('assembler', TTestParser.ParsesAs('assembler',
    SimpleDirective('AssemblerSemikeyword |assembler|'), RTDirective));
  OK('cdecl', TTestParser.ParsesAs('cdecl',
    SimpleDirective('CdeclSemikeyword |cdecl|'), RTDirective));

  try
    TTestParser.ParsesAs('dispid', '', RTDirective);
    OK(False, 'dispid exception');
  except
    on ETestException do;
    on EParseException do
      OK(True, 'dispid exception');
  else
    OK(False, 'dispid exception');
  end;

  OK('dispid 42', TTestParser.ParsesAs('dispid 42',
    'DirectiveNode' + #13#10 +
    '  SemicolonNode: (none)' + #13#10 +
    '  KeywordNode: DispIdSemikeyword |dispid|' + #13#10 +
    '  ValueNode: Number |42|' + #13#10 +
    '  DataNode: ListNode', RTDirective));

  OK('dynamic', TTestParser.ParsesAs('dynamic',
    SimpleDirective('DynamicSemikeyword |dynamic|'), RTDirective));
  OK('export', TTestParser.ParsesAs('export',
    SimpleDirective('ExportSemikeyword |export|'), RTDirective));

  OK('external', TTestParser.ParsesAs('external',
    'DirectiveNode' + #13#10 +
    '  SemicolonNode: (none)' + #13#10 +
    '  KeywordNode: ExternalSemikeyword |external|' + #13#10 +
    '  ValueNode: (none)' + #13#10 +
    '  DataNode: ListNode', RTDirective));

  OK('external ''Foo.dll''', TTestParser.ParsesAs('external ''Foo.dll''',
    'DirectiveNode' + #13#10 +
    '  SemicolonNode: (none)' + #13#10 +
    '  KeywordNode: ExternalSemikeyword |external|' + #13#10 +
    '  ValueNode: StringLiteral |''Foo.dll''|' + #13#10 +
    '  DataNode: ListNode', RTDirective));

  OK('external ''Foo.dll'' index 42 name ''Bar''',
    TTestParser.ParsesAs('external ''Foo.dll'' index 42 name ''Bar''',
    'DirectiveNode' + #13#10 +
    '  SemicolonNode: (none)' + #13#10 +
    '  KeywordNode: ExternalSemikeyword |external|' + #13#10 +
    '  ValueNode: StringLiteral |''Foo.dll''|' + #13#10 +
    '  DataNode: ListNode' + #13#10 +
    '    Items[0]: ExportsSpecifierNode' + #13#10 +
    '      KeywordNode: IndexSemikeyword |index|' + #13#10 +
    '      ValueNode: Number |42|' + #13#10 +
    '    Items[1]: ExportsSpecifierNode' + #13#10 +
    '      KeywordNode: NameSemikeyword |name|' + #13#10 +
    '      ValueNode: StringLiteral |''Bar''|', RTDirective));

  OK('external ''Foo.dll'' index 42 name ''Bar'' delayed',
    TTestParser.ParsesAs('external ''Foo.dll'' index 42 name ''Bar'' delayed',
    'DirectiveNode' + #13#10 +
    '  SemicolonNode: (none)' + #13#10 +
    '  KeywordNode: ExternalSemikeyword |external|' + #13#10 +
    '  ValueNode: StringLiteral |''Foo.dll''|' + #13#10 +
    '  DataNode: ListNode' + #13#10 +
    '    Items[0]: ExportsSpecifierNode' + #13#10 +
    '      KeywordNode: IndexSemikeyword |index|' + #13#10 +
    '      ValueNode: Number |42|' + #13#10 +
    '    Items[1]: ExportsSpecifierNode' + #13#10 +
    '      KeywordNode: NameSemikeyword |name|' + #13#10 +
    '      ValueNode: StringLiteral |''Bar''|' + #13#10 +
    '    Items[2]: ExportsSpecifierNode' + #13#10 +
    '      KeywordNode: DelayedSemikeyword |delayed|' + #13#10 +
    '      ValueNode: (none)', RTDirective));

  OK('far', TTestParser.ParsesAs('far',
    SimpleDirective('FarSemikeyword |far|'), RTDirective));
  OK('final', TTestParser.ParsesAs('final',
    SimpleDirective('FinalSemikeyword |final|'), RTDirective));
  OK('forward', TTestParser.ParsesAs('forward',
    SimpleDirective('ForwardSemikeyword |forward|'), RTDirective));
  OK('inline', TTestParser.ParsesAs('inline',
    SimpleDirective('InlineKeyword |inline|'), RTDirective));
  OK('local', TTestParser.ParsesAs('local',
    SimpleDirective('LocalSemikeyword |local|'), RTDirective));

  try
    TTestParser.ParsesAs('message', '', RTDirective);
    OK(False, 'message exception');
  except
    on ETestException do;
    on EParseException do
      OK(True, 'message exception');
  else
    OK(False, 'message exception');
  end;

  OK('message WM_ULTIMATEANSWER',
    TTestParser.ParsesAs('message WM_ULTIMATEANSWER',
    'DirectiveNode' + #13#10 +
    '  SemicolonNode: (none)' + #13#10 +
    '  KeywordNode: MessageSemikeyword |message|' + #13#10 +
    '  ValueNode: Identifier |WM_ULTIMATEANSWER|' + #13#10 +
    '  DataNode: ListNode', RTDirective));

  OK('near', TTestParser.ParsesAs('near',
    SimpleDirective('NearSemikeyword |near|'), RTDirective));
  OK('overload', TTestParser.ParsesAs('overload',
    SimpleDirective('OverloadSemikeyword |overload|'), RTDirective));
  OK('override', TTestParser.ParsesAs('override',
    SimpleDirective('OverrideSemikeyword |override|'), RTDirective));
  OK('pascal', TTestParser.ParsesAs('pascal',
    SimpleDirective('PascalSemikeyword |pascal|'), RTDirective));
  OK('register', TTestParser.ParsesAs('register',
    SimpleDirective('RegisterSemikeyword |register|'), RTDirective));
  OK('reintroduce', TTestParser.ParsesAs('reintroduce',
    SimpleDirective('ReintroduceSemikeyword |reintroduce|'), RTDirective));
  OK('safecall', TTestParser.ParsesAs('safecall',
    SimpleDirective('SafecallSemikeyword |safecall|'), RTDirective));
  OK('static', TTestParser.ParsesAs('static',
    SimpleDirective('StaticSemikeyword |static|'), RTDirective));
  OK('stdcall', TTestParser.ParsesAs('stdcall',
    SimpleDirective('StdcallSemikeyword |stdcall|'), RTDirective));
  OK('varargs', TTestParser.ParsesAs('varargs',
    SimpleDirective('VarArgsSemikeyword |varargs|'), RTDirective));
  OK('virtual', TTestParser.ParsesAs('virtual',
    SimpleDirective('VirtualSemikeyword |virtual|'), RTDirective));
  OK('platform', TTestParser.ParsesAs('platform',
    SimpleDirective('PlatformSemikeyword |platform|'), RTDirective));
  OK('deprecated', TTestParser.ParsesAs('deprecated',
    SimpleDirective('DeprecatedSemikeyword |deprecated|'), RTDirective));
  OK('library', TTestParser.ParsesAs('library',
    SimpleDirective('LibraryKeyword |library|'), RTDirective));

  OK('; abstract', TTestParser.ParsesAs('; abstract',
    'DirectiveNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|' + #13#10 +
    '  KeywordNode: AbstractSemikeyword |abstract|' + #13#10 +
    '  ValueNode: (none)' + #13#10 +
    '  DataNode: ListNode', RTDirective));

  OK('; message WM_ULTIMATEANSWER',
    TTestParser.ParsesAs('; message WM_ULTIMATEANSWER',
    'DirectiveNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|' + #13#10 +
    '  KeywordNode: MessageSemikeyword |message|' + #13#10 +
    '  ValueNode: Identifier |WM_ULTIMATEANSWER|' + #13#10 +
    '  DataNode: ListNode', RTDirective));

  OK('; external', TTestParser.ParsesAs('; external',
    'DirectiveNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|' + #13#10 +
    '  KeywordNode: ExternalSemikeyword |external|' + #13#10 +
    '  ValueNode: (none)' + #13#10 +
    '  DataNode: ListNode', RTDirective));
end;
{$ELSE}

procedure TTestDirective.TestAbstractDirective1;
const
  CAbstract: string = 'abstract';
begin
  OK(CAbstract, TTestParser.ParsesAs(CAbstract,
    SimpleDirective('AbstractSemikeyword |abstract|'), RTDirective));
end;

procedure TTestDirective.TestAssemblerDirective;
const
  CAssembler: string = 'assembler';
begin
  OK(CAssembler, TTestParser.ParsesAs(CAssembler,
    SimpleDirective('AssemblerSemikeyword |assembler|'), RTDirective));
end;

procedure TTestDirective.TestCdeclDirective;
const
  CCdecl: string = 'cdecl';
begin
  OK(CCdecl, TTestParser.ParsesAs(CCdecl,
    SimpleDirective('CdeclSemikeyword |cdecl|'), RTDirective));
end;

procedure TTestDirective.TestDispDirective1;
begin
  try
    TTestParser.ParsesAs('dispid', '', RTDirective);
    OK(False, 'dispid exception');
  except
    on ETestException do;
    on EParseException do
      OK(True, 'dispid exception');
  else
    OK(False, 'dispid exception');
  end;
end;

procedure TTestDirective.TestDispDirective2;
const
  CDispid42: string = 'dispid 42';
begin
  OK(CDispid42, TTestParser.ParsesAs(CDispid42,
    'DirectiveNode' + #13#10 +
    '  SemicolonNode: (none)' + #13#10 +
    '  KeywordNode: DispIdSemikeyword |dispid|' + #13#10 +
    '  ValueNode: Number |42|' + #13#10 +
    '  DataNode: (none)', RTDirective));
end;

procedure TTestDirective.TestDelayedDirective;
const
  CDelayed: string = 'delayed';
begin
  OK(CDelayed, TTestParser.ParsesAs(CDelayed,
    'DirectiveNode' + #13#10 +
    '  SemicolonNode: (none)' + #13#10 +
    '  KeywordNode: DelayedSemikeyword |delayed|' + #13#10 +
    '  ValueNode: (none)' + #13#10 +
    '  DataNode: (none)', RTDirective));
end;

procedure TTestDirective.TestDynamicDirective;
const
  CDynamic: string = 'dynamic';
begin
  OK(CDynamic, TTestParser.ParsesAs(CDynamic,
    SimpleDirective('DynamicSemikeyword |dynamic|'), RTDirective));
end;

procedure TTestDirective.TestExportDirective;
const
  CExport: string = 'export';
begin
  OK(CExport, TTestParser.ParsesAs(CExport,
    SimpleDirective('ExportSemikeyword |export|'), RTDirective));
end;

procedure TTestDirective.TestExternalDirective1;
const
  CExternal: string = 'external';
begin
  OK(CExternal, TTestParser.ParsesAs(CExternal,
    'DirectiveNode' + #13#10 +
    '  SemicolonNode: (none)' + #13#10 +
    '  KeywordNode: ExternalSemikeyword |external|' + #13#10 +
    '  ValueNode: (none)' + #13#10 +
    '  DataNode: (none)', RTDirective));
end;

procedure TTestDirective.TestExternalDirective2;
const
  CExternalFooDll: string = 'external ''Foo.dll''';
begin
  OK(CExternalFooDll, TTestParser.ParsesAs(CExternalFooDll,
    'DirectiveNode' + #13#10 +
    '  SemicolonNode: (none)' + #13#10 +
    '  KeywordNode: ExternalSemikeyword |external|' + #13#10 +
    '  ValueNode: StringLiteral |''Foo.dll''|' + #13#10 +
    '  DataNode: (none)', RTDirective));
end;

procedure TTestDirective.TestExternalDirective4;
const
  CExternalFooDllIndex42NameBar: string =
    'external ''Foo.dll'' index 42 name ''Bar''';
begin
  OK(CExternalFooDllIndex42NameBar,
    TTestParser.ParsesAs(CExternalFooDllIndex42NameBar,
    'DirectiveNode'+ #13#10 +
    '  SemicolonNode: (none)'+ #13#10 +
    '  KeywordNode: ExternalSemikeyword |external|'+ #13#10 +
    '  ValueNode: StringLiteral |''Foo.dll''|'+ #13#10 +
    '  DataNode: ListNode'+ #13#10 +
    '    Items[0]: ExternalSpecifierNode'+ #13#10 +
    '      KeywordNode: IndexSemikeyword |index|'+ #13#10 +
    '      ValueNode: Number |42|'+ #13#10 +
    '    Items[1]: ExternalSpecifierNode'+ #13#10 +
    '      KeywordNode: NameSemikeyword |name|'+ #13#10 +
    '      ValueNode: StringLiteral |''Bar''|', RTDirective));
end;

procedure TTestDirective.TestExternalFooDllIndex45NameBarDelayed;
const
  CExternalFooDllIndex45NameBarDelayed: string =
    'external ''Foo.dll'' index 45 name ''Bar'' delayed';
begin
  OK(CExternalFooDllIndex45NameBarDelayed,
    TTestParser.ParsesAs(CExternalFooDllIndex45NameBarDelayed,
    'DirectiveNode'+ #13#10 +
    '  SemicolonNode: (none)'+ #13#10 +
    '  KeywordNode: ExternalSemikeyword |external|'+ #13#10 +
    '  ValueNode: StringLiteral |''Foo.dll''|'+ #13#10 +
    '  DataNode: ListNode'+ #13#10 +
    '    Items[0]: ExternalSpecifierNode'+ #13#10 +
    '      KeywordNode: IndexSemikeyword |index|'+ #13#10 +
    '      ValueNode: Number |45|'+ #13#10 +
    '    Items[1]: ExternalSpecifierNode'+ #13#10 +
    '      KeywordNode: NameSemikeyword |name|'+ #13#10 +
    '      ValueNode: StringLiteral |''Bar''|'+ #13#10 +
    '    Items[2]: ExternalSpecifierNode'+ #13#10 +
    '      KeywordNode: DelayedSemikeyword |delayed|'+ #13#10 +
    '      ValueNode: (none)', RTDirective));
end;

procedure TTestDirective.TestFarDirective;
const
  CFar: string = 'far';
begin
  OK(CFar, TTestParser.ParsesAs(CFar,
    SimpleDirective('FarSemikeyword |far|'), RTDirective));
end;

procedure TTestDirective.TestFinalDirective;
const
  CFinal: string = 'final';
begin
  OK(CFinal, TTestParser.ParsesAs(CFinal,
    SimpleDirective('FinalSemikeyword |final|'), RTDirective));
end;

procedure TTestDirective.TestForwardDirective;
const
  CForward: string = 'forward';
begin
  OK(CForward, TTestParser.ParsesAs(CForward,
    SimpleDirective('ForwardSemikeyword |forward|'), RTDirective));
end;

procedure TTestDirective.TestInlineDirective;
const
  CInline: string = 'inline';
begin
  OK(CInline, TTestParser.ParsesAs(CInline,
    SimpleDirective('InlineKeyword |inline|'), RTDirective));
end;

procedure TTestDirective.TestLocalDirective;
const
  CLocal: string = 'local';
begin
  OK(CLocal, TTestParser.ParsesAs(CLocal,
    SimpleDirective('LocalSemikeyword |local|'), RTDirective));
end;

procedure TTestDirective.TestMessageDirective1;
begin
  try
    TTestParser.ParsesAs('message', '', RTDirective);
    OK(False, 'message exception');
  except
    on ETestException do;
    on EParseException do
      OK(True, 'message exception');
  else
    OK(False, 'message exception');
  end;
end;

procedure TTestDirective.TestMessageDirective2;
const
  CMessageWM_ULTIMATEANSWER: string = 'message WM_ULTIMATEANSWER';
begin
  OK(CMessageWM_ULTIMATEANSWER,
    TTestParser.ParsesAs(CMessageWM_ULTIMATEANSWER,
    'DirectiveNode' + #13#10 +
    '  SemicolonNode: (none)' + #13#10 +
    '  KeywordNode: MessageSemikeyword |message|' + #13#10 +
    '  ValueNode: Identifier |WM_ULTIMATEANSWER|' + #13#10 +
    '  DataNode: (none)', RTDirective));
end;

procedure TTestDirective.TestNearDirective;
const
  CNear: string = 'near';
begin
  OK(CNear, TTestParser.ParsesAs(CNear,
    SimpleDirective('NearSemikeyword |near|'), RTDirective));
end;

procedure TTestDirective.TestOverloadDirective;
const
  COverload: string = 'overload';
begin
  OK(COverload, TTestParser.ParsesAs(COverload,
    SimpleDirective('OverloadSemikeyword |overload|'), RTDirective));
end;

procedure TTestDirective.TestOverrideDirective;
const
  COverride: string = 'override';
begin
  OK(COverride, TTestParser.ParsesAs(COverride,
    SimpleDirective('OverrideSemikeyword |override|'), RTDirective));
end;

procedure TTestDirective.TestPascalDirective;
const
  CPascal: string = 'pascal';
begin
  OK(CPascal, TTestParser.ParsesAs(CPascal,
    SimpleDirective('PascalSemikeyword |pascal|'), RTDirective));
end;

procedure TTestDirective.TestRegisterDirective;
const
  CRegister: string = 'register';
begin
  OK(CRegister, TTestParser.ParsesAs(CRegister,
    SimpleDirective('RegisterSemikeyword |register|'), RTDirective));
end;

procedure TTestDirective.TestReintroduceDirective;
const
  CReintroduce: string = 'reintroduce';
begin
  OK(CReintroduce, TTestParser.ParsesAs(CReintroduce,
    SimpleDirective('ReintroduceSemikeyword |reintroduce|'), RTDirective));
end;

procedure TTestDirective.TestSafecallDirective;
const
  CSafecall: string = 'safecall';
begin
  OK(CSafecall, TTestParser.ParsesAs(CSafecall,
    SimpleDirective('SafecallSemikeyword |safecall|'), RTDirective));
end;

procedure TTestDirective.TestStaticDirective;
const
  CStatic: string = 'static';
begin
  OK(CStatic, TTestParser.ParsesAs(CStatic,
    SimpleDirective('StaticSemikeyword |static|'), RTDirective));
end;

procedure TTestDirective.TestStdcallDirective;
const
  CStdcall: string = 'stdcall';
begin
  OK(CStdcall, TTestParser.ParsesAs(CStdcall,
    SimpleDirective('StdcallSemikeyword |stdcall|'), RTDirective));
end;

procedure TTestDirective.TestVarArgsDirective;
const
  CVarargs: string = 'varargs';
begin
  OK(CVarargs, TTestParser.ParsesAs(CVarargs,
    SimpleDirective('VarArgsSemikeyword |varargs|'), RTDirective));
end;

procedure TTestDirective.TestVirtualDirective;
const
  CVirtual: string = 'virtual';
begin
  OK(CVirtual, TTestParser.ParsesAs(CVirtual,
    SimpleDirective('VirtualSemikeyword |virtual|'), RTDirective));
end;

procedure TTestDirective.TestPlatformDirective;
const
  CPlatform: string = 'platform';
begin
  OK(CPlatform, TTestParser.ParsesAs(CPlatform,
    SimpleDirective('PlatformSemikeyword |platform|'), RTDirective));
end;

procedure TTestDirective.TestDeprecatedDirective1;
const
  CDeprecated: string = 'deprecated';
begin
  OK(CDeprecated, TTestParser.ParsesAs(CDeprecated,
    SimpleDirective('DeprecatedSemikeyword |deprecated|'), RTDirective));
end;

procedure TTestDirective.TestLibraryDirective;
const
  CLibrary: string = 'library';
begin
  OK(CLibrary, TTestParser.ParsesAs(CLibrary,
    SimpleDirective('LibraryKeyword |library|'), RTDirective));
end;

procedure TTestDirective.TestAbstractDirective2;
const
  CSemicolonAbstract: string = '; abstract';
begin
  OK(CSemicolonAbstract, TTestParser.ParsesAs(CSemicolonAbstract,
    'DirectiveNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|' + #13#10 +
    '  KeywordNode: AbstractSemikeyword |abstract|' + #13#10 +
    '  ValueNode: (none)' + #13#10 +
    '  DataNode: (none)', RTDirective));
end;

procedure TTestDirective.TestMessageDirective3;
const
  CSemicolonMessageWM_ULTIMATEANSWER: string = '; message WM_ULTIMATEANSWER';
begin
  OK(CSemicolonMessageWM_ULTIMATEANSWER,
    TTestParser.ParsesAs(CSemicolonMessageWM_ULTIMATEANSWER,
    'DirectiveNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|' + #13#10 +
    '  KeywordNode: MessageSemikeyword |message|' + #13#10 +
    '  ValueNode: Identifier |WM_ULTIMATEANSWER|' + #13#10 +
    '  DataNode: (none)', RTDirective));
end;

procedure TTestDirective.TestExternalDirective6;
const
  CSemicolonExternal: string = '; external';
begin
  OK(CSemicolonExternal, TTestParser.ParsesAs(CSemicolonExternal,
    'DirectiveNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|' + #13#10 +
    '  KeywordNode: ExternalSemikeyword |external|' + #13#10 +
    '  ValueNode: (none)' + #13#10 +
    '  DataNode: (none)', RTDirective));
end;

initialization
  RegisterTest(TTestDirective.Suite);
{$ENDIF}
end.
