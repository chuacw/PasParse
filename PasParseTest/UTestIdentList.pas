unit UTestIdentList;

interface

uses
  UTest;

type
  TTestIdentList = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestIdentList;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestIdentList }
{$IF NOT DEFINED(DUNIT)}
class function TTestIdentList.GetName: string;
begin
  Result := 'IdentList';
end;

class procedure TTestIdentList.TestAll;
begin
  OK('Foo', TTestParser.ParsesAs('Foo',
    'ListNode' + #13#10 +
    '  Items[0]: DelimitedItemNode' + #13#10 +
    '    ItemNode: Identifier |Foo|' + #13#10 +
    '    DelimiterNode: (none)', RTIdentList));
  OK('Foo, Bar', TTestParser.ParsesAs('Foo, Bar',
    'ListNode' + #13#10 +
    '  Items[0]: DelimitedItemNode' + #13#10 +
    '    ItemNode: Identifier |Foo|' + #13#10 +
    '    DelimiterNode: Comma |,|' + #13#10 +
    '  Items[1]: DelimitedItemNode' + #13#10 +
    '    ItemNode: Identifier |Bar|' + #13#10 +
    '    DelimiterNode: (none)', RTIdentList));
  OK('Absolute, Index', TTestParser.ParsesAs('Absolute, Index',
    'ListNode' + #13#10 +
    '  Items[0]: DelimitedItemNode' + #13#10 +
    '    ItemNode: Identifier |Absolute|' + #13#10 +
    '    DelimiterNode: Comma |,|' + #13#10 +
    '  Items[1]: DelimitedItemNode' + #13#10 +
    '    ItemNode: Identifier |Index|' + #13#10 +
    '    DelimiterNode: (none)', RTIdentList));
end;
{$ELSE}

procedure TTestIdentList.TestIdentList;
begin
  OK('Foo', TTestParser.ParsesAs('Foo',
    'ListNode' + #13#10 +
    '  Items[0]: DelimitedItemNode' + #13#10 +
    '    ItemNode: Identifier |Foo|' + #13#10 +
    '    DelimiterNode: (none)', RTIdentList));
  OK('Foo, Bar', TTestParser.ParsesAs('Foo, Bar',
    'ListNode' + #13#10 +
    '  Items[0]: DelimitedItemNode' + #13#10 +
    '    ItemNode: Identifier |Foo|' + #13#10 +
    '    DelimiterNode: Comma |,|' + #13#10 +
    '  Items[1]: DelimitedItemNode' + #13#10 +
    '    ItemNode: Identifier |Bar|' + #13#10 +
    '    DelimiterNode: (none)', RTIdentList));
  OK('Absolute, Index', TTestParser.ParsesAs('Absolute, Index',
    'ListNode' + #13#10 +
    '  Items[0]: DelimitedItemNode' + #13#10 +
    '    ItemNode: Identifier |Absolute|' + #13#10 +
    '    DelimiterNode: Comma |,|' + #13#10 +
    '  Items[1]: DelimitedItemNode' + #13#10 +
    '    ItemNode: Identifier |Index|' + #13#10 +
    '    DelimiterNode: (none)', RTIdentList));
end;

initialization
  RegisterTest(TTestIdentList.Suite);
{$ENDIF}
end.
