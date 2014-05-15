unit UTestEnumeratedType;

interface

uses
  UTest;

type
  TTestEnumeratedType = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestEnumeratedType;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType, UParseException{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestEnumeratedType }
{$IF NOT DEFINED(DUNIT)}
class function TTestEnumeratedType.GetName: string;
begin
  Result := 'EnumeratedType';
end;

class procedure TTestEnumeratedType.TestAll;
begin
  try
    TTestParser.ParsesAs('()', '', RTEnumeratedType);
    OK(False, '() exception');
  except
    on ETestException do;
    on EParseException do
      OK(True, '() exception');
  else
    OK(False, '() exception');
  end;

  OK('(Foo)', TTestParser.ParsesAs('(Foo)',
    'EnumeratedTypeNode' + #13#10 +
    '  OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '  ItemListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: EnumeratedTypeElementNode' + #13#10 +
    '        NameNode: Identifier |Foo|' + #13#10 +
    '        EqualSignNode: (none)' + #13#10 +
    '        ValueNode: (none)' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  CloseParenthesisNode: CloseParenthesis |)|', RTEnumeratedType));

  OK('(Foo, Bar)', TTestParser.ParsesAs('(Foo, Bar)',
    'EnumeratedTypeNode' + #13#10 +
    '  OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '  ItemListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: EnumeratedTypeElementNode' + #13#10 +
    '        NameNode: Identifier |Foo|' + #13#10 +
    '        EqualSignNode: (none)' + #13#10 +
    '        ValueNode: (none)' + #13#10 +
    '      DelimiterNode: Comma |,|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: EnumeratedTypeElementNode' + #13#10 +
    '        NameNode: Identifier |Bar|' + #13#10 +
    '        EqualSignNode: (none)' + #13#10 +
    '        ValueNode: (none)' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  CloseParenthesisNode: CloseParenthesis |)|', RTEnumeratedType));
end;
{$ELSE}

procedure TTestEnumeratedType.TestEnumeratedType;
begin
  try
    TTestParser.ParsesAs('()', '', RTEnumeratedType);
    OK(False, '() exception');
  except
    on ETestException do;
    on EParseException do
      OK(True, '() exception');
  else
    OK(False, '() exception');
  end;

  OK('(Foo)', TTestParser.ParsesAs('(Foo)',
    'EnumeratedTypeNode' + #13#10 +
    '  OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '  ItemListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: EnumeratedTypeElementNode' + #13#10 +
    '        NameNode: Identifier |Foo|' + #13#10 +
    '        EqualSignNode: (none)' + #13#10 +
    '        ValueNode: (none)' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  CloseParenthesisNode: CloseParenthesis |)|', RTEnumeratedType));

  OK('(Foo, Bar)', TTestParser.ParsesAs('(Foo, Bar)',
    'EnumeratedTypeNode' + #13#10 +
    '  OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '  ItemListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: EnumeratedTypeElementNode' + #13#10 +
    '        NameNode: Identifier |Foo|' + #13#10 +
    '        EqualSignNode: (none)' + #13#10 +
    '        ValueNode: (none)' + #13#10 +
    '      DelimiterNode: Comma |,|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: EnumeratedTypeElementNode' + #13#10 +
    '        NameNode: Identifier |Bar|' + #13#10 +
    '        EqualSignNode: (none)' + #13#10 +
    '        ValueNode: (none)' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  CloseParenthesisNode: CloseParenthesis |)|', RTEnumeratedType));
end;

initialization
  RegisterTest(TTestEnumeratedType.Suite);
{$ENDIF}
end.
