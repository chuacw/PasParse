unit UTestTypeParams;

interface

uses
  UTest;

type
  TTestTypeParams = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestOneTypeParamNoConstraint;
    procedure TestTwoTypeParamsNoConstraintCommaSeparator;
    procedure TestTwoTypeParamsNoConstraintSemicolonSeparator;
    procedure TestOneTypeParamWithConstraint;
    procedure TestTwoTypeParamsWithOneConstraint;
    procedure TestTwoTypeParamsWithTwoConstraints;
    procedure TestTypeParamException;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType, UParseException{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestTypeParams }
{$IF NOT DEFINED(DUNIT)}
class function TTestTypeParams.GetName: string;
begin
  Result := 'TTestTypeParams';
end;

class procedure TTestTypeParams.TestAll;
begin
  OK('<TSomething>', TTestParser.ParsesAs('<TSomething>',
    'TypeParamsNode' + #13#10 +
    '  OpenBracketNode: LessThan |<|' + #13#10 +
    '  TypeParamDeclNode: TypeParamDeclNode' + #13#10 +
    '    TypeParamListNode: ListNode' + #13#10 +
    '      Items[0]: DelimitedItemNode' + #13#10 +
    '        ItemNode: TypeParamNode' + #13#10 +
    '          ModifierNode: (none)' + #13#10 +
    '          NameNode: Identifier |TSomething|' + #13#10 +
    '        DelimiterNode: (none)' + #13#10 +
    '    ColonNode: (none)' + #13#10 +
    '    ConstraintListNode: (none)' + #13#10 +
    '  CloseBracketNode: GreaterThan |>|', RTTypeParams));

  OK('<TSomething, TAnother>', TTestParser.ParsesAs('<TSomething, TAnother>',
    'TypeParamsNode' + #13#10 +
    '  OpenBracketNode: LessThan |<|' + #13#10 +
    '  TypeParamDeclNode: TypeParamDeclNode' + #13#10 +
    '    TypeParamListNode: ListNode' + #13#10 +
    '      Items[0]: DelimitedItemNode' + #13#10 +
    '        ItemNode: TypeParamNode' + #13#10 +
    '          ModifierNode: (none)' + #13#10 +
    '          NameNode: Identifier |TSomething|' + #13#10 +
    '        DelimiterNode: Comma |,|' + #13#10 +
    '      Items[1]: DelimitedItemNode' + #13#10 +
    '        ItemNode: TypeParamNode' + #13#10 +
    '          ModifierNode: (none)' + #13#10 +
    '          NameNode: Identifier |TAnother|' + #13#10 +
    '        DelimiterNode: (none)' + #13#10 +
    '    ColonNode: (none)' + #13#10 +
    '    ConstraintListNode: (none)' + #13#10 +
    '  CloseBracketNode: GreaterThan |>|', RTTypeParams));

  OK('<TSomething: TAnother>', TTestParser.ParsesAs('<TSomething: TAnother>',
    'TypeParamsNode' + #13#10 +
    '  OpenBracketNode: LessThan |<|' + #13#10 +
    '  TypeParamDeclNode: TypeParamDeclNode' + #13#10 +
    '    TypeParamListNode: ListNode' + #13#10 +
    '      Items[0]: DelimitedItemNode' + #13#10 +
    '        ItemNode: TypeParamNode' + #13#10 +
    '          ModifierNode: (none)' + #13#10 +
    '          NameNode: Identifier |TSomething|' + #13#10 +
    '        DelimiterNode: (none)' + #13#10 +
    '    ColonNode: Colon |:|' + #13#10 +
    '    ConstraintListNode: ListNode' + #13#10 +
    '      Items[0]: DelimitedItemNode' + #13#10 +
    '        ItemNode: Identifier |TAnother|' + #13#10 +
    '        DelimiterNode: (none)' + #13#10 +
    '  CloseBracketNode: GreaterThan |>|', RTTypeParams));

  try
    TTestParser.ParsesAs('TSomething', '', RTTypeParams);
    OK(False, 'no < exception');
  except
    on ETestException do;
    on EParseException do
      OK(True, 'no < exception');
  else
    OK(False, 'no < exception');
  end;
end;
{$ELSE}

procedure TTestTypeParams.TestOneTypeParamNoConstraint;
begin
  OK('<TSomething>', TTestParser.ParsesAs('<TSomething>',
     'TypeParamsNode'+ #13#10 +
     '  OpenBracketNode: LessThan |<|'+ #13#10 +
     '  TypeParamDeclNode: ListNode'+ #13#10 +
     '    Items[0]: DelimitedItemNode'+ #13#10 +
     '      ItemNode: TypeParamDeclNode'+ #13#10 +
     '        TypeParamListNode: ListNode'+ #13#10 +
     '          Items[0]: DelimitedItemNode'+ #13#10 +
     '            ItemNode: TypeParamNode'+ #13#10 +
     '              ModifierNode: (none)'+ #13#10 +
     '              NameNode: Identifier |TSomething|'+ #13#10 +
     '            DelimiterNode: (none)'+ #13#10 +
     '        ColonNode: (none)'+ #13#10 +
     '        ConstraintListNode: (none)'+ #13#10 +
     '      DelimiterNode: (none)'+ #13#10 +
     '  CloseBracketNode: GreaterThan |>|', RTTypeParams));
end;

procedure TTestTypeParams.TestTwoTypeParamsNoConstraintCommaSeparator;
begin
  OK('<TSomething, TAnother>', TTestParser.ParsesAs('<TSomething, TAnother>',
     'TypeParamsNode'+ #13#10 +
     '  OpenBracketNode: LessThan |<|'+ #13#10 +
     '  TypeParamDeclNode: ListNode'+ #13#10 +
     '    Items[0]: DelimitedItemNode'+ #13#10 +
     '      ItemNode: TypeParamDeclNode'+ #13#10 +
     '        TypeParamListNode: ListNode'+ #13#10 +
     '          Items[0]: DelimitedItemNode'+ #13#10 +
     '            ItemNode: TypeParamNode'+ #13#10 +
     '              ModifierNode: (none)'+ #13#10 +
     '              NameNode: Identifier |TSomething|'+ #13#10 +
     '            DelimiterNode: Comma |,|'+ #13#10 +
     '          Items[1]: DelimitedItemNode'+ #13#10 +
     '            ItemNode: TypeParamNode'+ #13#10 +
     '              ModifierNode: (none)'+ #13#10 +
     '              NameNode: Identifier |TAnother|'+ #13#10 +
     '            DelimiterNode: (none)'+ #13#10 +
     '        ColonNode: (none)'+ #13#10 +
     '        ConstraintListNode: (none)'+ #13#10 +
     '      DelimiterNode: (none)'+ #13#10 +
     '  CloseBracketNode: GreaterThan |>|', RTTypeParams));
end;

procedure TTestTypeParams.TestTwoTypeParamsNoConstraintSemicolonSeparator;
begin
  OK('<TSomething; TAnother>', TTestParser.ParsesAs('<TSomething; TAnother>',
     'TypeParamsNode'+ #13#10 +
     '  OpenBracketNode: LessThan |<|'+ #13#10 +
     '  TypeParamDeclNode: ListNode'+ #13#10 +
     '    Items[0]: DelimitedItemNode'+ #13#10 +
     '      ItemNode: TypeParamDeclNode'+ #13#10 +
     '        TypeParamListNode: ListNode'+ #13#10 +
     '          Items[0]: DelimitedItemNode'+ #13#10 +
     '            ItemNode: TypeParamNode'+ #13#10 +
     '              ModifierNode: (none)'+ #13#10 +
     '              NameNode: Identifier |TSomething|'+ #13#10 +
     '            DelimiterNode: (none)'+ #13#10 +
     '        ColonNode: (none)'+ #13#10 +
     '        ConstraintListNode: (none)'+ #13#10 +
     '      DelimiterNode: Semicolon |;|'+ #13#10 +
     '    Items[1]: DelimitedItemNode'+ #13#10 +
     '      ItemNode: TypeParamDeclNode'+ #13#10 +
     '        TypeParamListNode: ListNode'+ #13#10 +
     '          Items[0]: DelimitedItemNode'+ #13#10 +
     '            ItemNode: TypeParamNode'+ #13#10 +
     '              ModifierNode: (none)'+ #13#10 +
     '              NameNode: Identifier |TAnother|'+ #13#10 +
     '            DelimiterNode: (none)'+ #13#10 +
     '        ColonNode: (none)'+ #13#10 +
     '        ConstraintListNode: (none)'+ #13#10 +
     '      DelimiterNode: (none)'+ #13#10 +
     '  CloseBracketNode: GreaterThan |>|', RTTypeParams));
end;

procedure TTestTypeParams.TestOneTypeParamWithConstraint;
begin
  OK('<TSomething: TAnother>', TTestParser.ParsesAs('<TSomething: TAnother>',
     'TypeParamsNode'+ #13#10 +
     '  OpenBracketNode: LessThan |<|'+ #13#10 +
     '  TypeParamDeclNode: ListNode'+ #13#10 +
     '    Items[0]: DelimitedItemNode'+ #13#10 +
     '      ItemNode: TypeParamDeclNode'+ #13#10 +
     '        TypeParamListNode: ListNode'+ #13#10 +
     '          Items[0]: DelimitedItemNode'+ #13#10 +
     '            ItemNode: TypeParamNode'+ #13#10 +
     '              ModifierNode: (none)'+ #13#10 +
     '              NameNode: Identifier |TSomething|'+ #13#10 +
     '            DelimiterNode: (none)'+ #13#10 +
     '        ColonNode: Colon |:|'+ #13#10 +
     '        ConstraintListNode: ListNode'+ #13#10 +
     '          Items[0]: DelimitedItemNode'+ #13#10 +
     '            ItemNode: Identifier |TAnother|'+ #13#10 +
     '            DelimiterNode: (none)'+ #13#10 +
     '      DelimiterNode: (none)'+ #13#10 +
     '  CloseBracketNode: GreaterThan |>|', RTTypeParams));
end;

procedure TTestTypeParams.TestTwoTypeParamsWithOneConstraint;
const
  CTestStr: string = '<TSomething: TAnother; TSomething2>';
begin
  OK(CTestStr, TTestParser.ParsesAs(CTestStr,
    'TypeParamsNode'+ #13#10 +
    '  OpenBracketNode: LessThan |<|'+ #13#10 +
    '  TypeParamDeclNode: ListNode'+ #13#10 +
    '    Items[0]: DelimitedItemNode'+ #13#10 +
    '      ItemNode: TypeParamDeclNode'+ #13#10 +
    '        TypeParamListNode: ListNode'+ #13#10 +
    '          Items[0]: DelimitedItemNode'+ #13#10 +
    '            ItemNode: TypeParamNode'+ #13#10 +
    '              ModifierNode: (none)'+ #13#10 +
    '              NameNode: Identifier |TSomething|'+ #13#10 +
    '            DelimiterNode: (none)'+ #13#10 +
    '        ColonNode: Colon |:|'+ #13#10 +
    '        ConstraintListNode: ListNode'+ #13#10 +
    '          Items[0]: DelimitedItemNode'+ #13#10 +
    '            ItemNode: Identifier |TAnother|'+ #13#10 +
    '            DelimiterNode: (none)'+ #13#10 +
    '      DelimiterNode: Semicolon |;|'+ #13#10 +
    '    Items[1]: DelimitedItemNode'+ #13#10 +
    '      ItemNode: TypeParamDeclNode'+ #13#10 +
    '        TypeParamListNode: ListNode'+ #13#10 +
    '          Items[0]: DelimitedItemNode'+ #13#10 +
    '            ItemNode: TypeParamNode'+ #13#10 +
    '              ModifierNode: (none)'+ #13#10 +
    '              NameNode: Identifier |TSomething2|'+ #13#10 +
    '            DelimiterNode: (none)'+ #13#10 +
    '        ColonNode: (none)'+ #13#10 +
    '        ConstraintListNode: (none)'+ #13#10 +
    '      DelimiterNode: (none)'+ #13#10 +
    '  CloseBracketNode: GreaterThan |>|', RTTypeParams));
end;

procedure TTestTypeParams.TestTwoTypeParamsWithTwoConstraints;
const
  CTestStr: string = '<TSomething: TAnother; TSomething2: TAnother2>';
begin
  OK(CTestStr, TTestParser.ParsesAs(CTestStr,
    'TypeParamsNode'+ #13#10 +
    '  OpenBracketNode: LessThan |<|'+ #13#10 +
    '  TypeParamDeclNode: ListNode'+ #13#10 +
    '    Items[0]: DelimitedItemNode'+ #13#10 +
    '      ItemNode: TypeParamDeclNode'+ #13#10 +
    '        TypeParamListNode: ListNode'+ #13#10 +
    '          Items[0]: DelimitedItemNode'+ #13#10 +
    '            ItemNode: TypeParamNode'+ #13#10 +
    '              ModifierNode: (none)'+ #13#10 +
    '              NameNode: Identifier |TSomething|'+ #13#10 +
    '            DelimiterNode: (none)'+ #13#10 +
    '        ColonNode: Colon |:|'+ #13#10 +
    '        ConstraintListNode: ListNode'+ #13#10 +
    '          Items[0]: DelimitedItemNode'+ #13#10 +
    '            ItemNode: Identifier |TAnother|'+ #13#10 +
    '            DelimiterNode: (none)'+ #13#10 +
    '      DelimiterNode: Semicolon |;|'+ #13#10 +
    '    Items[1]: DelimitedItemNode'+ #13#10 +
    '      ItemNode: TypeParamDeclNode'+ #13#10 +
    '        TypeParamListNode: ListNode'+ #13#10 +
    '          Items[0]: DelimitedItemNode'+ #13#10 +
    '            ItemNode: TypeParamNode'+ #13#10 +
    '              ModifierNode: (none)'+ #13#10 +
    '              NameNode: Identifier |TSomething2|'+ #13#10 +
    '            DelimiterNode: (none)'+ #13#10 +
    '        ColonNode: Colon |:|'+ #13#10 +
    '        ConstraintListNode: ListNode'+ #13#10 +
    '          Items[0]: DelimitedItemNode'+ #13#10 +
    '            ItemNode: Identifier |TAnother2|'+ #13#10 +
    '            DelimiterNode: (none)'+ #13#10 +
    '      DelimiterNode: (none)'+ #13#10 +
    '  CloseBracketNode: GreaterThan |>|', RTTypeParams));
end;

procedure TTestTypeParams.TestTypeParamException;
begin
  try
    TTestParser.ParsesAs('TSomething', '', RTTypeParams);
    OK(False, 'no < exception');
  except
    on ETestException do;
    on EParseException do
      OK(True, 'no < exception');
  else
    OK(False, 'no < exception');
  end;
end;

initialization
  RegisterTest(TTestTypeParams.Suite);
{$ENDIF}
end.

