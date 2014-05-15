unit UTestStatement;

interface

uses
  UTest;

type
  TTestStatement = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestStatement;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestStatement }
{$IF NOT DEFINED(DUNIT)}
class function TTestStatement.GetName: string;
begin
  Result := 'Statement';
end;

class procedure TTestStatement.TestAll;
begin
  OK('Foo', TTestParser.ParsesAs('Foo', 'Identifier |Foo|', RTStatement));

  OK('Foo:', TTestParser.ParsesAs('Foo:',
    'LabeledStatementNode' + #13#10 +
    '  LabelIdNode: Identifier |Foo|' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  StatementNode: (none)', RTStatement));

  OK('Foo: Bar', TTestParser.ParsesAs('Foo: Bar',
    'LabeledStatementNode' + #13#10 +
    '  LabelIdNode: Identifier |Foo|' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  StatementNode: Identifier |Bar|', RTStatement));
end;
{$ELSE}

procedure TTestStatement.TestStatement;
begin
  OK('Foo', TTestParser.ParsesAs('Foo', 'Identifier |Foo|', RTStatement));

  OK('Foo:', TTestParser.ParsesAs('Foo:',
    'LabeledStatementNode' + #13#10 +
    '  LabelIdNode: Identifier |Foo|' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  StatementNode: (none)', RTStatement));

  OK('Foo: Bar', TTestParser.ParsesAs('Foo: Bar',
    'LabeledStatementNode' + #13#10 +
    '  LabelIdNode: Identifier |Foo|' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  StatementNode: Identifier |Bar|', RTStatement));
end;

initialization
  RegisterTest(TTestStatement.Suite);
{$ENDIF}
end.
