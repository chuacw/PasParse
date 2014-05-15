unit UTestLabelDeclSection;

interface

uses
  UTest;

type
  TTestLabelDeclSection = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestLabelDeclSection;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestLabelDeclSection }
{$IF NOT DEFINED(DUNIT)}
class function TTestLabelDeclSection.GetName: string;
begin
  Result := 'LabelDeclSection';
end;

class procedure TTestLabelDeclSection.TestAll;
begin
  OK('label 42;', TTestParser.ParsesAs('label 42;',
    'LabelDeclSectionNode' + #13#10 +
    '  LabelKeywordNode: LabelKeyword |label|' + #13#10 +
    '  LabelListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Number |42|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTLabelDeclSection));

  OK('label Foo;', TTestParser.ParsesAs('label Foo;',
    'LabelDeclSectionNode' + #13#10 +
    '  LabelKeywordNode: LabelKeyword |label|' + #13#10 +
    '  LabelListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTLabelDeclSection));

  OK('label Absolute;', TTestParser.ParsesAs('label Absolute;',
    'LabelDeclSectionNode' + #13#10 +
    '  LabelKeywordNode: LabelKeyword |label|' + #13#10 +
    '  LabelListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Absolute|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTLabelDeclSection));

  OK('label Answer, 42;', TTestParser.ParsesAs('label Answer, 42;',
    'LabelDeclSectionNode' + #13#10 +
    '  LabelKeywordNode: LabelKeyword |label|' + #13#10 +
    '  LabelListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Answer|' + #13#10 +
    '      DelimiterNode: Comma |,|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Number |42|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTLabelDeclSection));
end;
{$ELSE}

procedure TTestLabelDeclSection.TestLabelDeclSection;
begin
  OK('label 42;', TTestParser.ParsesAs('label 42;',
    'LabelDeclSectionNode' + #13#10 +
    '  LabelKeywordNode: LabelKeyword |label|' + #13#10 +
    '  LabelListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Number |42|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTLabelDeclSection));

  OK('label Foo;', TTestParser.ParsesAs('label Foo;',
    'LabelDeclSectionNode' + #13#10 +
    '  LabelKeywordNode: LabelKeyword |label|' + #13#10 +
    '  LabelListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTLabelDeclSection));

  OK('label Absolute;', TTestParser.ParsesAs('label Absolute;',
    'LabelDeclSectionNode' + #13#10 +
    '  LabelKeywordNode: LabelKeyword |label|' + #13#10 +
    '  LabelListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Absolute|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTLabelDeclSection));

  OK('label Answer, 42;', TTestParser.ParsesAs('label Answer, 42;',
    'LabelDeclSectionNode' + #13#10 +
    '  LabelKeywordNode: LabelKeyword |label|' + #13#10 +
    '  LabelListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Answer|' + #13#10 +
    '      DelimiterNode: Comma |,|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Number |42|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTLabelDeclSection));
end;

initialization
  RegisterTest(TTestLabelDeclSection.Suite);
{$ENDIF}
end.
