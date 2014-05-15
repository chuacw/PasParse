unit UTestRecordHelperType;

interface

uses
  UTest;

type
  TTestRecordHelperType = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestRecordHelperType;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestRecordHelperType }
{$IF NOT DEFINED(DUNIT)}
class function TTestRecordHelperType.GetName: string;
begin
  Result := 'RecordHelperType';
end;

class procedure TTestRecordHelperType.TestAll;
begin
  OK('record helper for TPoint end',
    TTestParser.ParsesAs('record helper for TPoint end',
    'TypeHelperNode' + #13#10 +
    '  TypeKeywordNode: RecordKeyword |record|' + #13#10 +
    '  HelperSemikeywordNode: HelperSemikeyword |helper|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  BaseHelperTypeNode: (none)' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ForKeywordNode: ForKeyword |for|' + #13#10 +
    '  TypeNode: Identifier |TPoint|' + #13#10 +
    '  ContentListNode: ListNode' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTRecordHelperType));

  OK('record helper for TObject procedure Foo; end',
    TTestParser.ParsesAs('record helper for TObject procedure Foo; end',
    'TypeHelperNode' + #13#10 +
    '  TypeKeywordNode: RecordKeyword |record|' + #13#10 +
    '  HelperSemikeywordNode: HelperSemikeyword |helper|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  BaseHelperTypeNode: (none)' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ForKeywordNode: ForKeyword |for|' + #13#10 +
    '  TypeNode: Identifier |TObject|' + #13#10 +
    '  ContentListNode: ListNode' + #13#10 +
    '    Items[0]: VisibilitySectionNode' + #13#10 +
    '      VisibilityNode: (none)' + #13#10 +
    '      ContentListNode: ListNode' + #13#10 +
    '        Items[0]: MethodHeadingNode' + #13#10 +
    '          ClassKeywordNode: (none)' + #13#10 +
    '          MethodTypeNode: ProcedureKeyword |procedure|' + #13#10 +
    '          NameNode: Identifier |Foo|' + #13#10 +
    '          OpenParenthesisNode: (none)' + #13#10 +
    '          ParameterListNode: ListNode' + #13#10 +
    '          CloseParenthesisNode: (none)' + #13#10 +
    '          ColonNode: (none)' + #13#10 +
    '          ReturnTypeNode: (none)' + #13#10 +
    '          DirectiveListNode: ListNode' + #13#10 +
    '          SemicolonNode: Semicolon |;|' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTRecordHelperType));
end;
{$ELSE}

procedure TTestRecordHelperType.TestRecordHelperType;
begin
  OK('record helper for TPoint end',
    TTestParser.ParsesAs('record helper for TPoint end',
    'TypeHelperNode' + #13#10 +
    '  TypeKeywordNode: RecordKeyword |record|' + #13#10 +
    '  HelperSemikeywordNode: HelperSemikeyword |helper|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  BaseHelperTypeNode: (none)' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ForKeywordNode: ForKeyword |for|' + #13#10 +
    '  TypeNode: Identifier |TPoint|' + #13#10 +
    '  ContentListNode: (none)' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTRecordHelperType));

  OK('record helper for TObject procedure Foo; end',
    TTestParser.ParsesAs('record helper for TObject procedure Foo; end',
    'TypeHelperNode' + #13#10 +
    '  TypeKeywordNode: RecordKeyword |record|' + #13#10 +
    '  HelperSemikeywordNode: HelperSemikeyword |helper|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  BaseHelperTypeNode: (none)' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ForKeywordNode: ForKeyword |for|' + #13#10 +
    '  TypeNode: Identifier |TObject|' + #13#10 +
    '  ContentListNode: ListNode' + #13#10 +
    '    Items[0]: VisibilitySectionNode' + #13#10 +
    '      VisibilityNode: (none)' + #13#10 +
    '      ContentListNode: ListNode' + #13#10 +
    '        Items[0]: MethodHeadingNode' + #13#10 +
    '          ClassKeywordNode: (none)' + #13#10 +
    '          MethodTypeNode: ProcedureKeyword |procedure|' + #13#10 +
    '          NameNode: Identifier |Foo|' + #13#10 +
    '          OpenParenthesisNode: (none)' + #13#10 +
    '          ParameterListNode: (none)' + #13#10 +
    '          CloseParenthesisNode: (none)' + #13#10 +
    '          ColonNode: (none)' + #13#10 +
    '          ReturnTypeNode: (none)' + #13#10 +
    '          DirectiveListNode: (none)' + #13#10 +
    '          SemicolonNode: Semicolon |;|' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTRecordHelperType));
end;

initialization
  RegisterTest(TTestRecordHelperType.Suite);
{$ENDIF}
end.
