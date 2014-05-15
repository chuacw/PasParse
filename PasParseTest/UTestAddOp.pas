unit UTestAddOp;

interface

uses
  TestFramework,
  UTest;

type
  TTestAddOp = class(TTest)
{$IF NOT DEFINED(DUNIT)}
  public
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestAddOp;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestAddOp }
{$IF NOT DEFINED(DUNIT)}
class function TTestAddOp.GetName: string;
begin
  Result := 'AddOp';
end;

class procedure TTestAddOp.TestAll;
begin
  OK('+', TTestParser.ParsesAs('+', 'PlusSign |+|', RTAddOp));
  OK('-', TTestParser.ParsesAs('-', 'MinusSign |-|', RTAddOp));
  OK('or', TTestParser.ParsesAs('or', 'OrKeyword |or|', RTAddOp));
  OK('xor', TTestParser.ParsesAs('xor', 'XorKeyword |xor|', RTAddOp));
end;
{$ELSE}

procedure TTestAddOp.TestAddOp;
begin
  Check(TTestParser.ParsesAs('+', 'PlusSign |+|', RTAddOp), '+');
  Check(TTestParser.ParsesAs('-', 'MinusSign |-|', RTAddOp), '-');
  Check(TTestParser.ParsesAs('or', 'OrKeyword |or|', RTAddOp), 'or');
  Check(TTestParser.ParsesAs('xor', 'XorKeyword |xor|', RTAddOp), 'xor');
end;

initialization
  RegisterTest(TTestAddOp.Suite);
{$ENDIF}
end.
