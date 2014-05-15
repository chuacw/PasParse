unit UTestRelOp;

interface

uses
  UTest;

type
  TTestRelOp = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestRelOp;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestRelOp }

{$IF NOT DEFINED(DUNIT)}
class function TTestRelOp.GetName: string;
begin
  Result := 'RelOp';
end;

class procedure TTestRelOp.TestAll;
begin
  OK('=', TTestParser.ParsesAs('=', 'EqualSign |=|', RTRelOp));
  OK('>', TTestParser.ParsesAs('>', 'GreaterThan |>|', RTRelOp));
  OK('<', TTestParser.ParsesAs('<', 'LessThan |<|', RTRelOp));
  OK('<=', TTestParser.ParsesAs('<=', 'LessOrEqual |<=|', RTRelOp));
  OK('>=', TTestParser.ParsesAs('>=', 'GreaterOrEqual |>=|', RTRelOp));
  OK('<>', TTestParser.ParsesAs('<>', 'NotEqual |<>|', RTRelOp));
  OK('in', TTestParser.ParsesAs('in', 'InKeyword |in|', RTRelOp));
  OK('is', TTestParser.ParsesAs('is', 'IsKeyword |is|', RTRelOp));
  OK('as', TTestParser.ParsesAs('as', 'AsKeyword |as|', RTRelOp));
end;
{$ELSE}
procedure TTestRelOp.TestRelOp;
begin
  OK('=', TTestParser.ParsesAs('=', 'EqualSign |=|', RTRelOp));
  OK('>', TTestParser.ParsesAs('>', 'GreaterThan |>|', RTRelOp));
  OK('<', TTestParser.ParsesAs('<', 'LessThan |<|', RTRelOp));
  OK('<=', TTestParser.ParsesAs('<=', 'LessOrEqual |<=|', RTRelOp));
  OK('>=', TTestParser.ParsesAs('>=', 'GreaterOrEqual |>=|', RTRelOp));
  OK('<>', TTestParser.ParsesAs('<>', 'NotEqual |<>|', RTRelOp));
  OK('in', TTestParser.ParsesAs('in', 'InKeyword |in|', RTRelOp));
  OK('is', TTestParser.ParsesAs('is', 'IsKeyword |is|', RTRelOp));
  OK('as', TTestParser.ParsesAs('as', 'AsKeyword |as|', RTRelOp));
end;

initialization
  RegisterTest(TTestRelOp.Suite);
{$ENDIF}
end.
