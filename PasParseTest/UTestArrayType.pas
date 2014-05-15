unit UTestArrayType;

interface

uses
  UTest;

type
  TTestArrayType = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestArrayOfInteger;
    procedure TestArrayBlahBlahOfInteger;
    procedure TestArrayIdentIdentOfInteger;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestArrayType }
{$IF NOT DEFINED(DUNIT)}
class function TTestArrayType.GetName: string;
begin
  Result := 'ArrayType';
end;

class procedure TTestArrayType.TestAll;
begin
  OK('array of Integer', TTestParser.ParsesAs('array of Integer',
    'ArrayTypeNode' + #13#10 +
    '  ArrayKeywordNode: ArrayKeyword |array|' + #13#10 +
    '  OpenBracketNode: (none)' + #13#10 +
    '  IndexListNode: ListNode' + #13#10 +
    '  CloseBracketNode: (none)' + #13#10 +
    '  OfKeywordNode: OfKeyword |of|' + #13#10 +
    '  TypeNode: Identifier |Integer|', RTArrayType));

  OK('array [24..42, Byte] of Integer',
    TTestParser.ParsesAs('array [24..42, Byte] of Integer',
    'ArrayTypeNode' + #13#10 +
    '  ArrayKeywordNode: ArrayKeyword |array|' + #13#10 +
    '  OpenBracketNode: OpenBracket |[|' + #13#10 +
    '  IndexListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: BinaryOperationNode' + #13#10 +
    '        LeftNode: Number |24|' + #13#10 +
    '        OperatorNode: DotDot |..|' + #13#10 +
    '        RightNode: Number |42|' + #13#10 +
    '      DelimiterNode: Comma |,|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Byte|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  CloseBracketNode: CloseBracket |]|' + #13#10 +
    '  OfKeywordNode: OfKeyword |of|' + #13#10 +
    '  TypeNode: Identifier |Integer|', RTArrayType));
end;
{$ELSE}

procedure TTestArrayType.TestArrayOfInteger;
begin
  OK('array of Integer', TTestParser.ParsesAs('array of Integer',
    'ArrayTypeNode' + #13#10 +
    '  ArrayKeywordNode: ArrayKeyword |array|' + #13#10 +
    '  OpenBracketNode: (none)' + #13#10 +
    '  IndexListNode: (none)' + #13#10 +
    '  CloseBracketNode: (none)' + #13#10 +
    '  OfKeywordNode: OfKeyword |of|' + #13#10 +
    '  TypeNode: Identifier |Integer|', RTArrayType));
end;

procedure TTestArrayType.TestArrayBlahBlahOfInteger;
begin
  OK('array [24..42, Byte] of Integer',
    TTestParser.ParsesAs('array [24..42, Byte] of Integer',
    'ArrayTypeNode' + #13#10 +
    '  ArrayKeywordNode: ArrayKeyword |array|' + #13#10 +
    '  OpenBracketNode: OpenBracket |[|' + #13#10 +
    '  IndexListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: BinaryOperationNode' + #13#10 +
    '        LeftNode: Number |24|' + #13#10 +
    '        OperatorNode: DotDot |..|' + #13#10 +
    '        RightNode: Number |42|' + #13#10 +
    '      DelimiterNode: Comma |,|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Byte|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  CloseBracketNode: CloseBracket |]|' + #13#10 +
    '  OfKeywordNode: OfKeyword |of|' + #13#10 +
    '  TypeNode: Identifier |Integer|', RTArrayType));
end;

procedure TTestArrayType.TestArrayIdentIdentOfInteger;
begin
  OK('array[ciSingleInstance..ciMultiInstance] of Integer',
    TTestParser.ParsesAs('array[ciSingleInstance..ciMultiInstance] of Integer',
    'ArrayTypeNode'+ #13#10 +
    '  ArrayKeywordNode: ArrayKeyword |array|'+ #13#10 +
    '  OpenBracketNode: OpenBracket |[|'+ #13#10 +
    '  IndexListNode: ListNode'+ #13#10 +
    '    Items[0]: DelimitedItemNode'+ #13#10 +
    '      ItemNode: BinaryOperationNode'+ #13#10 +
    '        LeftNode: Identifier |ciSingleInstance|'+ #13#10 +
    '        OperatorNode: DotDot |..|'+ #13#10 +
    '        RightNode: Identifier |ciMultiInstance|'+ #13#10 +
    '      DelimiterNode: (none)'+ #13#10 +
    '  CloseBracketNode: CloseBracket |]|'+ #13#10 +
    '  OfKeywordNode: OfKeyword |of|'+ #13#10 +
    '  TypeNode: Identifier |Integer|', RTArrayType));
end;

initialization
  RegisterTest(TTestArrayType.Suite);
{$ENDIF}

end.
