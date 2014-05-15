unit UTestBlock;

interface

uses
  UTest;

type
  TTestBlock = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestBlock;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestBlock }
{$IF NOT DEFINED(DUNIT)}
class function TTestBlock.GetName: string;
begin
  Result := 'Block';
end;

class procedure TTestBlock.TestAll;
begin
  OK('begin end', TTestParser.ParsesAs('begin end',
    'BlockNode' + #13#10 +
    '  BeginKeywordNode: BeginKeyword |begin|' + #13#10 +
    '  StatementListNode: ListNode' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTBlock));

  OK('begin Foo; Bar; end', TTestParser.ParsesAs('begin Foo; Bar; end',
    'BlockNode' + #13#10 +
    '  BeginKeywordNode: BeginKeyword |begin|' + #13#10 +
    '  StatementListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: Semicolon |;|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Bar|' + #13#10 +
    '      DelimiterNode: Semicolon |;|' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTBlock));

  OK('asm end', TTestParser.ParsesAs('asm end',
    'AssemblerStatementNode' + #13#10 +
    '  AsmKeywordNode: AsmKeyword |asm|' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTBlock));
end;
{$ELSE}

procedure TTestBlock.TestBlock;
begin
  OK('begin end', TTestParser.ParsesAs('begin end',
    'BlockNode' + #13#10 +
    '  BeginKeywordNode: BeginKeyword |begin|' + #13#10 +
    '  StatementListNode: (none)' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTBlock));

  OK('begin Foo; Bar; end', TTestParser.ParsesAs('begin Foo; Bar; end',
    'BlockNode' + #13#10 +
    '  BeginKeywordNode: BeginKeyword |begin|' + #13#10 +
    '  StatementListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: Semicolon |;|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Bar|' + #13#10 +
    '      DelimiterNode: Semicolon |;|' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTBlock));

  OK('asm end', TTestParser.ParsesAs('asm end',
    'AssemblerStatementNode' + #13#10 +
    '  AsmKeywordNode: AsmKeyword |asm|' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTBlock));
end;

initialization
  RegisterTest(TTestBlock.Suite);
{$ENDIF}
end.
