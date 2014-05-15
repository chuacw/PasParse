unit UTestExportsSpecifier;

interface

uses
  UTest;

type
  TTestExportsSpecifier = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestExportsSpecifier;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestExportsSpecifier }
{$IF NOT DEFINED(DUNIT)}
class function TTestExportsSpecifier.GetName: string;
begin
  Result := 'ExportsSpecifier';
end;

class procedure TTestExportsSpecifier.TestAll;
begin
  OK('index 42', TTestParser.ParsesAs('index 42',
    'ExportsSpecifierNode' + #13#10 +
    '  KeywordNode: IndexSemikeyword |index|' + #13#10 +
    '  ValueNode: Number |42|', RTExportsSpecifier));

  OK('name ''Foo''', TTestParser.ParsesAs('name ''Foo''',
    'ExportsSpecifierNode' + #13#10 +
    '  KeywordNode: NameSemikeyword |name|' + #13#10 +
    '  ValueNode: StringLiteral |''Foo''|', RTExportsSpecifier));

end;
{$ELSE}

procedure TTestExportsSpecifier.TestExportsSpecifier;
begin
  OK('index 42', TTestParser.ParsesAs('index 42',
    'ExportsSpecifierNode' + #13#10 +
    '  KeywordNode: IndexSemikeyword |index|' + #13#10 +
    '  ValueNode: Number |42|', RTExportsSpecifier));

  OK('name ''Foo''', TTestParser.ParsesAs('name ''Foo''',
    'ExportsSpecifierNode' + #13#10 +
    '  KeywordNode: NameSemikeyword |name|' + #13#10 +
    '  ValueNode: StringLiteral |''Foo''|', RTExportsSpecifier));

end;

initialization
  RegisterTest(TTestExportsSpecifier.Suite);
{$ENDIF}
end.
