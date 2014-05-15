unit UTestGotoStatement;

interface

uses
  UTest;

type
  TTestGotoStatement = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestGotoStatement;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestGotoStatement }
{$IF NOT DEFINED(DUNIT)}
class function TTestGotoStatement.GetName: string;
begin
  Result := 'GotoStatement';
end;

class procedure TTestGotoStatement.TestAll;
begin
  OK('goto 42', TTestParser.ParsesAs('goto 42',
    'GotoStatementNode' + #13#10 +
    '  GotoKeywordNode: GotoKeyword |goto|' + #13#10 +
    '  LabelIdNode: Number |42|', RTGotoStatement));

  OK('goto Foo', TTestParser.ParsesAs('goto Foo',
    'GotoStatementNode' + #13#10 +
    '  GotoKeywordNode: GotoKeyword |goto|' + #13#10 +
    '  LabelIdNode: Identifier |Foo|', RTGotoStatement));

  OK('goto Absolute', TTestParser.ParsesAs('goto Absolute',
    'GotoStatementNode' + #13#10 +
    '  GotoKeywordNode: GotoKeyword |goto|' + #13#10 +
    '  LabelIdNode: Identifier |Absolute|', RTGotoStatement));
end;
{$ELSE}

procedure TTestGotoStatement.TestGotoStatement;
begin
  OK('goto 42', TTestParser.ParsesAs('goto 42',
    'GotoStatementNode' + #13#10 +
    '  GotoKeywordNode: GotoKeyword |goto|' + #13#10 +
    '  LabelIdNode: Number |42|', RTGotoStatement));

  OK('goto Foo', TTestParser.ParsesAs('goto Foo',
    'GotoStatementNode' + #13#10 +
    '  GotoKeywordNode: GotoKeyword |goto|' + #13#10 +
    '  LabelIdNode: Identifier |Foo|', RTGotoStatement));

  OK('goto Absolute', TTestParser.ParsesAs('goto Absolute',
    'GotoStatementNode' + #13#10 +
    '  GotoKeywordNode: GotoKeyword |goto|' + #13#10 +
    '  LabelIdNode: Identifier |Absolute|', RTGotoStatement));
end;

initialization
  RegisterTest(TTestGotoStatement.Suite);
{$ENDIF}
end.
