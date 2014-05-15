unit UTestInitSection;

interface

uses
  UTest;

type
  TTestInitSection = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestInitSectionNoInitialization;
    procedure TestEmptyInitialization;
    procedure TestEmptyInitializationEmptyFinalization;
    procedure TestSampleInitializationEmptyFinalization;
    procedure TestSampleInitializationSampleFinalization;
    procedure TestEmptyBeginEnd;
    procedure TestSampleBeginEnd;
    procedure TestEmptyAsmEnd;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestInitSection }
{$IF NOT DEFINED(DUNIT)}
class function TTestInitSection.GetName: string;
begin
  Result := 'InitSection';
end;

class procedure TTestInitSection.TestAll;
const
  WinapiGDIPOBJ = 'initialization'+ #13#10 +
'  if not IsLibrary then'+ #13#10 +
'  begin'+ #13#10 +
'    // Initialize StartupInput structure'+ #13#10 +
'    StartupInput.DebugEventCallback := nil;'+ #13#10 +
'    StartupInput.SuppressBackgroundThread := False;'+ #13#10 +
'    StartupInput.SuppressExternalCodecs   := False;'+ #13#10 +
'    StartupInput.GdiplusVersion := 1;'+ #13#10 +
''+ #13#10 +
'    GdiplusStartup(gdiplusToken, @StartupInput, nil);'+ #13#10 +
'  end;'+ #13#10 +
''+ #13#10 +
'finalization'+ #13#10 +
'  if not IsLibrary then'+ #13#10 +
'  begin'+ #13#10 +
'    if Assigned(GenericSansSerifFontFamily) then'+ #13#10 +
'      GenericSansSerifFontFamily.Free;'+ #13#10 +
'    if Assigned(GenericSerifFontFamily) then'+ #13#10 +
'      GenericSerifFontFamily.Free;'+ #13#10 +
'    if Assigned(GenericMonospaceFontFamily) then'+ #13#10 +
'      GenericMonospaceFontFamily.Free;'+ #13#10 +
'    if Assigned(GenericTypographicStringFormatBuffer) then'+ #13#10 +
'      GenericTypographicStringFormatBuffer.free;'+ #13#10 +
'    if Assigned(GenericDefaultStringFormatBuffer) then'+ #13#10 +
'      GenericDefaultStringFormatBuffer.Free;'+ #13#10 +
''+ #13#10 +
'    GdiplusShutdown(gdiplusToken);'+ #13#10 +
'  end;'+ #13#10 +
''+ #13#10 +
'end.';
begin
//  OK(WinapiGDIPOBJ, TTestParser.ParsesAs(WinapiGDIPOBJ,
//   '', RTInitSection));

  OK('end', TTestParser.ParsesAs('end',
    'InitSectionNode' + #13#10 +
    '  InitializationKeywordNode: (none)' + #13#10 +
    '  InitializationStatementListNode: (none)' + #13#10 +
    '  FinalizationKeywordNode: (none)' + #13#10 +
    '  FinalizationStatementListNode: (none)' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTInitSection));

  OK('initialization end', TTestParser.ParsesAs('initialization end',
    'InitSectionNode' + #13#10 +
    '  InitializationKeywordNode: InitializationKeyword |initialization|' + #13#10 +
    '  InitializationStatementListNode: (none)' + #13#10 +
    '  FinalizationKeywordNode: (none)' + #13#10 +
    '  FinalizationStatementListNode: (none)' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTInitSection));

  OK('initialization finalization end', 
    TTestParser.ParsesAs('initialization finalization end',
    'InitSectionNode' + #13#10 +
    '  InitializationKeywordNode: InitializationKeyword |initialization|' + #13#10 +
    '  InitializationStatementListNode: (none)' + #13#10 +
    '  FinalizationKeywordNode: FinalizationKeyword |finalization|' + #13#10 +
    '  FinalizationStatementListNode: (none)' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTInitSection));

  OK('initialization Foo; Bar; end', 
    TTestParser.ParsesAs('initialization Foo; Bar; end',
    'InitSectionNode' + #13#10 +
    '  InitializationKeywordNode: InitializationKeyword |initialization|' + #13#10 +
    '  InitializationStatementListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: Semicolon |;|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Bar|' + #13#10 +
    '      DelimiterNode: Semicolon |;|' + #13#10 +
    '  FinalizationKeywordNode: (none)' + #13#10 +
    '  FinalizationStatementListNode: (none)' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTInitSection));

  OK('initialization Foo; Bar; finalization Baz; Quux; end', 
    TTestParser.ParsesAs('initialization Foo; Bar; finalization Baz; Quux; end',
    'InitSectionNode' + #13#10 +
    '  InitializationKeywordNode: InitializationKeyword |initialization|' + #13#10 +
    '  InitializationStatementListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: Semicolon |;|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Bar|' + #13#10 +
    '      DelimiterNode: Semicolon |;|' + #13#10 +
    '  FinalizationKeywordNode: FinalizationKeyword |finalization|' + #13#10 +
    '  FinalizationStatementListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Baz|' + #13#10 +
    '      DelimiterNode: Semicolon |;|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Quux|' + #13#10 +
    '      DelimiterNode: Semicolon |;|' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTInitSection));

  OK('begin end', TTestParser.ParsesAs('begin end',
    'InitSectionNode' + #13#10 +
    '  InitializationKeywordNode: BeginKeyword |begin|' + #13#10 +
    '  InitializationStatementListNode: (none)' + #13#10 +
    '  FinalizationKeywordNode: (none)' + #13#10 +
    '  FinalizationStatementListNode: (none)' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTInitSection));

  OK('begin Foo; Bar; end', TTestParser.ParsesAs('begin Foo; Bar; end',
    'InitSectionNode' + #13#10 +
    '  InitializationKeywordNode: BeginKeyword |begin|' + #13#10 +
    '  InitializationStatementListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: Semicolon |;|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Bar|' + #13#10 +
    '      DelimiterNode: Semicolon |;|' + #13#10 +
    '  FinalizationKeywordNode: (none)' + #13#10 +
    '  FinalizationStatementListNode: ListNode' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTInitSection));
  
  OK('asm end', TTestParser.ParsesAs('asm end',
    'InitSectionNode' + #13#10 +
    '  InitializationKeywordNode: (none)' + #13#10 +
    '  InitializationStatementListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: AssemblerStatementNode' + #13#10 +
    '        AsmKeywordNode: AsmKeyword |asm|' + #13#10 +
    '        EndKeywordNode: EndKeyword |end|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  FinalizationKeywordNode: (none)' + #13#10 +
    '  FinalizationStatementListNode: ListNode' + #13#10 +
    '  EndKeywordNode: (none)', RTInitSection));
end;
{$ELSE}

procedure TTestInitSection.TestInitSectionNoInitialization;
begin
  OK('end', TTestParser.ParsesAs('end',
    'InitSectionNode' + #13#10 +
    '  AttributesListNode: (none)'+ #13#10 +
    '  InitializationKeywordNode: (none)' + #13#10 +
    '  InitializationStatementListNode: (none)' + #13#10 +
    '  FinalizationKeywordNode: (none)' + #13#10 +
    '  FinalizationStatementListNode: (none)' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTInitSection));
end;

procedure TTestInitSection.TestEmptyInitialization;
begin
  OK('initialization end', TTestParser.ParsesAs('initialization end',
    'InitSectionNode' + #13#10 +
    '  AttributesListNode: (none)'+ #13#10 +
    '  InitializationKeywordNode: InitializationKeyword |initialization|' + #13#10 +
    '  InitializationStatementListNode: (none)' + #13#10 +
    '  FinalizationKeywordNode: (none)' + #13#10 +
    '  FinalizationStatementListNode: (none)' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTInitSection));
end;

procedure TTestInitSection.TestEmptyInitializationEmptyFinalization;
begin
  OK('initialization finalization end',
    TTestParser.ParsesAs('initialization finalization end',
    'InitSectionNode' + #13#10 +
    '  AttributesListNode: (none)'+ #13#10 +
    '  InitializationKeywordNode: InitializationKeyword |initialization|' + #13#10 +
    '  InitializationStatementListNode: (none)' + #13#10 +
    '  FinalizationKeywordNode: FinalizationKeyword |finalization|' + #13#10 +
    '  FinalizationStatementListNode: (none)' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTInitSection));
end;

procedure TTestInitSection.TestSampleInitializationEmptyFinalization;
begin
  OK('initialization Foo; Bar; end',
    TTestParser.ParsesAs('initialization Foo; Bar; end',
    'InitSectionNode' + #13#10 +
    '  AttributesListNode: (none)'+ #13#10 +
    '  InitializationKeywordNode: InitializationKeyword |initialization|' + #13#10 +
    '  InitializationStatementListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: Semicolon |;|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Bar|' + #13#10 +
    '      DelimiterNode: Semicolon |;|' + #13#10 +
    '  FinalizationKeywordNode: (none)' + #13#10 +
    '  FinalizationStatementListNode: (none)' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTInitSection));
end;

procedure TTestInitSection.TestSampleInitializationSampleFinalization;
begin
  OK('initialization Foo; Bar; finalization Baz; Quux; end',
    TTestParser.ParsesAs('initialization Foo; Bar; finalization Baz; Quux; end',
    'InitSectionNode' + #13#10 +
    '  AttributesListNode: (none)'+ #13#10 +
    '  InitializationKeywordNode: InitializationKeyword |initialization|' + #13#10 +
    '  InitializationStatementListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: Semicolon |;|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Bar|' + #13#10 +
    '      DelimiterNode: Semicolon |;|' + #13#10 +
    '  FinalizationKeywordNode: FinalizationKeyword |finalization|' + #13#10 +
    '  FinalizationStatementListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Baz|' + #13#10 +
    '      DelimiterNode: Semicolon |;|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Quux|' + #13#10 +
    '      DelimiterNode: Semicolon |;|' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTInitSection));
end;

procedure TTestInitSection.TestEmptyBeginEnd;
begin
  OK('begin end', TTestParser.ParsesAs('begin end',
    'InitSectionNode' + #13#10 +
    '  AttributesListNode: (none)'+ #13#10 +
    '  InitializationKeywordNode: BeginKeyword |begin|' + #13#10 +
    '  InitializationStatementListNode: (none)' + #13#10 +
    '  FinalizationKeywordNode: (none)' + #13#10 +
    '  FinalizationStatementListNode: (none)' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTInitSection));
end;

procedure TTestInitSection.TestSampleBeginEnd;
begin
  OK('begin Foo; Bar; end', TTestParser.ParsesAs('begin Foo; Bar; end',
    'InitSectionNode' + #13#10 +
    '  AttributesListNode: (none)'+ #13#10 +
    '  InitializationKeywordNode: BeginKeyword |begin|' + #13#10 +
    '  InitializationStatementListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: Semicolon |;|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Bar|' + #13#10 +
    '      DelimiterNode: Semicolon |;|' + #13#10 +
    '  FinalizationKeywordNode: (none)' + #13#10 +
    '  FinalizationStatementListNode: (none)' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTInitSection));
end;

procedure TTestInitSection.TestEmptyAsmEnd;
begin
  OK('asm end', TTestParser.ParsesAs('asm end',
    'InitSectionNode' + #13#10 +
    '  AttributesListNode: (none)'+ #13#10 +
    '  InitializationKeywordNode: (none)' + #13#10 +
    '  InitializationStatementListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: AssemblerStatementNode' + #13#10 +
    '        AsmKeywordNode: AsmKeyword |asm|' + #13#10 +
    '        EndKeywordNode: EndKeyword |end|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  FinalizationKeywordNode: (none)' + #13#10 +
    '  FinalizationStatementListNode: (none)' + #13#10 +
    '  EndKeywordNode: (none)', RTInitSection));
end;

initialization
  RegisterTest(TTestInitSection.Suite);
{$ENDIF}
end.
