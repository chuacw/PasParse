unit UTestParameter;

interface

uses
  UTest;

type
  TTestParameter = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestFooColonBar;
    procedure TestFooCommaBarColonTBaz;
    procedure TestVarFooColonTBar;
    procedure TestConstFooColonTBar;
    procedure TestVarFoo;
    procedure TestFooColonTBarEqual42;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestParameter }
{$IF NOT DEFINED(DUNIT)}
class function TTestParameter.GetName: string;
begin
  Result := 'Parameter';
end;

class procedure TTestParameter.TestAll;
begin
  OK('Foo: TBar', TTestParser.ParsesAs('Foo: TBar',
    'ParameterNode' + #13#10 +
    '  ModifierNode: (none)' + #13#10 +
    '  NameListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  TypeNode: Identifier |TBar|' + #13#10 +
    '  EqualSignNode: (none)' + #13#10 +
    '  DefaultValueNode: (none)', RTParameter));

  OK('Foo, Bar: TBaz', TTestParser.ParsesAs('Foo, Bar: TBaz',
    'ParameterNode' + #13#10 +
    '  ModifierNode: (none)' + #13#10 +
    '  NameListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: Comma |,|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Bar|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  TypeNode: Identifier |TBaz|' + #13#10 +
    '  EqualSignNode: (none)' + #13#10 +
    '  DefaultValueNode: (none)', RTParameter));

  OK('var Foo: TBar', TTestParser.ParsesAs('var Foo: TBar',
    'ParameterNode' + #13#10 +
    '  ModifierNode: VarKeyword |var|' + #13#10 +
    '  NameListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  TypeNode: Identifier |TBar|' + #13#10 +
    '  EqualSignNode: (none)' + #13#10 +
    '  DefaultValueNode: (none)', RTParameter));

  OK('const Foo: TBar', TTestParser.ParsesAs('const Foo: TBar',
    'ParameterNode' + #13#10 +
    '  ModifierNode: ConstKeyword |const|' + #13#10 +
    '  NameListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  TypeNode: Identifier |TBar|' + #13#10 +
    '  EqualSignNode: (none)' + #13#10 +
    '  DefaultValueNode: (none)', RTParameter));

  OK('out Foo: TBar', TTestParser.ParsesAs('out Foo: TBar',
    'ParameterNode' + #13#10 +
    '  ModifierNode: OutSemikeyword |out|' + #13#10 +
    '  NameListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  TypeNode: Identifier |TBar|' + #13#10 +
    '  EqualSignNode: (none)' + #13#10 +
    '  DefaultValueNode: (none)', RTParameter));

  OK('var Foo', TTestParser.ParsesAs('var Foo',
    'ParameterNode' + #13#10 +
    '  ModifierNode: VarKeyword |var|' + #13#10 +
    '  NameListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  TypeNode: (none)' + #13#10 +
    '  EqualSignNode: (none)' + #13#10 +
    '  DefaultValueNode: (none)', RTParameter));

  OK('Foo: TBar = 42', TTestParser.ParsesAs('Foo: TBar = 42',
    'ParameterNode' + #13#10 +
    '  ModifierNode: (none)' + #13#10 +
    '  NameListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  TypeNode: Identifier |TBar|' + #13#10 +
    '  EqualSignNode: EqualSign |=|' + #13#10 +
    '  DefaultValueNode: Number |42|', RTParameter));
end;
{$ELSE}

procedure TTestParameter.TestFooColonBar;
begin
  OK('Foo: TBar', TTestParser.ParsesAs('Foo: TBar',
     'ParameterNode'+ #13#10 +
     '  ModifierNode: (none)'+ #13#10 +
     '  NameListNode: ListNode'+ #13#10 +
     '    Items[0]: DelimitedItemNode'+ #13#10 +
     '      ItemNode: IdentAttrNode'+ #13#10 +
     '        AttributesListNode: (none)'+ #13#10 +
     '        Ident: Identifier |Foo|'+ #13#10 +
     '      DelimiterNode: (none)'+ #13#10 +
     '  ColonNode: Colon |:|'+ #13#10 +
     '  TypeNode: Identifier |TBar|'+ #13#10 +
     '  EqualSignNode: (none)'+ #13#10 +
     '  DefaultValueNode: (none)', RTParameter));
end;

procedure TTestParameter.TestFooCommaBarColonTBaz;
begin
  OK('Foo, Bar: TBaz', TTestParser.ParsesAs('Foo, Bar: TBaz',
     'ParameterNode'+ #13#10 +
     '  ModifierNode: (none)'+ #13#10 +
     '  NameListNode: ListNode'+ #13#10 +
     '    Items[0]: DelimitedItemNode'+ #13#10 +
     '      ItemNode: IdentAttrNode'+ #13#10 +
     '        AttributesListNode: (none)'+ #13#10 +
     '        Ident: Identifier |Foo|'+ #13#10 +
     '      DelimiterNode: Comma |,|'+ #13#10 +
     '    Items[1]: DelimitedItemNode'+ #13#10 +
     '      ItemNode: IdentAttrNode'+ #13#10 +
     '        AttributesListNode: (none)'+ #13#10 +
     '        Ident: Identifier |Bar|'+ #13#10 +
     '      DelimiterNode: (none)'+ #13#10 +
     '  ColonNode: Colon |:|'+ #13#10 +
     '  TypeNode: Identifier |TBaz|'+ #13#10 +
     '  EqualSignNode: (none)'+ #13#10 +
     '  DefaultValueNode: (none)', RTParameter));
end;

procedure TTestParameter.TestVarFooColonTBar;
begin
  OK('var Foo: TBar', TTestParser.ParsesAs('var Foo: TBar',
     'ParameterNode'+ #13#10 +
     '  ModifierNode: VarKeyword |var|'+ #13#10 +
     '  NameListNode: ListNode'+ #13#10 +
     '    Items[0]: DelimitedItemNode'+ #13#10 +
     '      ItemNode: IdentAttrNode'+ #13#10 +
     '        AttributesListNode: (none)'+ #13#10 +
     '        Ident: Identifier |Foo|'+ #13#10 +
     '      DelimiterNode: (none)'+ #13#10 +
     '  ColonNode: Colon |:|'+ #13#10 +
     '  TypeNode: Identifier |TBar|'+ #13#10 +
     '  EqualSignNode: (none)'+ #13#10 +
     '  DefaultValueNode: (none)', RTParameter));
end;

procedure TTestParameter.TestConstFooColonTBar;
begin
  OK('const Foo: TBar', TTestParser.ParsesAs('const Foo: TBar',
     'ParameterNode'+ #13#10 +
     '  ModifierNode: ConstKeyword |const|'+ #13#10 +
     '  NameListNode: ListNode'+ #13#10 +
     '    Items[0]: DelimitedItemNode'+ #13#10 +
     '      ItemNode: IdentAttrNode'+ #13#10 +
     '        AttributesListNode: (none)'+ #13#10 +
     '        Ident: Identifier |Foo|'+ #13#10 +
     '      DelimiterNode: (none)'+ #13#10 +
     '  ColonNode: Colon |:|'+ #13#10 +
     '  TypeNode: Identifier |TBar|'+ #13#10 +
     '  EqualSignNode: (none)'+ #13#10 +
     '  DefaultValueNode: (none)', RTParameter));
end;

procedure TTestParameter.TestVarFoo;
begin
  OK('var Foo', TTestParser.ParsesAs('var Foo',
     'ParameterNode'+ #13#10 +
     '  ModifierNode: VarKeyword |var|'+ #13#10 +
     '  NameListNode: ListNode'+ #13#10 +
     '    Items[0]: DelimitedItemNode'+ #13#10 +
     '      ItemNode: IdentAttrNode'+ #13#10 +
     '        AttributesListNode: (none)'+ #13#10 +
     '        Ident: Identifier |Foo|'+ #13#10 +
     '      DelimiterNode: (none)'+ #13#10 +
     '  ColonNode: (none)'+ #13#10 +
     '  TypeNode: (none)'+ #13#10 +
     '  EqualSignNode: (none)'+ #13#10 +
     '  DefaultValueNode: (none)', RTParameter));
end;

procedure TTestParameter.TestFooColonTBarEqual42;
begin
  OK('Foo: TBar = 42', TTestParser.ParsesAs('Foo: TBar = 42',
     'ParameterNode'+ #13#10 +
     '  ModifierNode: (none)'+ #13#10 +
     '  NameListNode: ListNode'+ #13#10 +
     '    Items[0]: DelimitedItemNode'+ #13#10 +
     '      ItemNode: IdentAttrNode'+ #13#10 +
     '        AttributesListNode: (none)'+ #13#10 +
     '        Ident: Identifier |Foo|'+ #13#10 +
     '      DelimiterNode: (none)'+ #13#10 +
     '  ColonNode: Colon |:|'+ #13#10 +
     '  TypeNode: Identifier |TBar|'+ #13#10 +
     '  EqualSignNode: EqualSign |=|'+ #13#10 +
     '  DefaultValueNode: Number |42|', RTParameter));
end;

initialization
  RegisterTest(TTestParameter.Suite);
{$ENDIF}
end.
