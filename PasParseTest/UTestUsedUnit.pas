unit UTestUsedUnit;

interface

uses
  UTest;

type
  TTestUsedUnit = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestUsedUnit;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestUsedUnit }
{$IF NOT DEFINED(DUNIT)}
class function TTestUsedUnit.GetName: string;
begin
  Result := 'UsedUnit';
end;

class procedure TTestUsedUnit.TestAll;
begin
  OK('Foo', TTestParser.ParsesAs('Foo',
    'UsedUnitNode' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  InKeywordNode: (none)' + #13#10 +
    '  FileNameNode: (none)', RTUsedUnit));
  OK('Foo.Bar', TTestParser.ParsesAs('Foo.Bar',
    'UsedUnitNode' + #13#10 +
    '  NameNode: BinaryOperationNode' + #13#10 +
    '    LeftNode: Identifier |Foo|' + #13#10 +
    '    OperatorNode: Dot |.|' + #13#10 +
    '    RightNode: Identifier |Bar|' + #13#10 +
    '  InKeywordNode: (none)' + #13#10 +
    '  FileNameNode: (none)', RTUsedUnit));
  OK('Foo in ''Foo.pas''', TTestParser.ParsesAs('Foo in ''Foo.pas''',
    'UsedUnitNode' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  InKeywordNode: InKeyword |in|' + #13#10 +
    '  FileNameNode: StringLiteral |''Foo.pas''|', RTUsedUnit));
end;
{$ELSE}

procedure TTestUsedUnit.TestUsedUnit;
begin
  OK('Foo', TTestParser.ParsesAs('Foo',
    'UsedUnitNode' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  InKeywordNode: (none)' + #13#10 +
    '  FileNameNode: (none)', RTUsedUnit));
  OK('Foo.Bar', TTestParser.ParsesAs('Foo.Bar',
    'UsedUnitNode' + #13#10 +
    '  NameNode: BinaryOperationNode' + #13#10 +
    '    LeftNode: Identifier |Foo|' + #13#10 +
    '    OperatorNode: Dot |.|' + #13#10 +
    '    RightNode: Identifier |Bar|' + #13#10 +
    '  InKeywordNode: (none)' + #13#10 +
    '  FileNameNode: (none)', RTUsedUnit));
  OK('Foo in ''Foo.pas''', TTestParser.ParsesAs('Foo in ''Foo.pas''',
    'UsedUnitNode' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  InKeywordNode: InKeyword |in|' + #13#10 +
    '  FileNameNode: StringLiteral |''Foo.pas''|', RTUsedUnit));
end;

initialization
  RegisterTest(TTestUsedUnit.Suite);
{$ENDIF}
end.
