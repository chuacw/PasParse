unit UTestMulOp;

interface

uses
  UTest;

type
  TTestMulOp = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestMulOp;
{$ENDIF}
end;

implementation

uses
  UTestParser, URuleType{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestMulOp }
{$IF NOT DEFINED(DUNIT)}
class function TTestMulOp.GetName: string;
begin
  Result := 'MulOp';
end;

class procedure TTestMulOp.TestAll;
begin
  OK('*', TTestParser.ParsesAs('*', 'TimesSign |*|', RTMulOp));
  OK('/', TTestParser.ParsesAs('/', 'DivideBySign |/|', RTMulOp));
  OK('div', TTestParser.ParsesAs('div', 'DivKeyword |div|', RTMulOp));
  OK('mod', TTestParser.ParsesAs('mod', 'ModKeyword |mod|', RTMulOp));
  OK('and', TTestParser.ParsesAs('and', 'AndKeyword |and|', RTMulOp));
  OK('shl', TTestParser.ParsesAs('shl', 'ShlKeyword |shl|', RTMulOp));
  OK('shr', TTestParser.ParsesAs('shr', 'ShrKeyword |shr|', RTMulOp));
end;
{$ELSE}

procedure TTestMulOp.TestMulOp;
begin
  OK('*', TTestParser.ParsesAs('*', 'TimesSign |*|', RTMulOp));
  OK('/', TTestParser.ParsesAs('/', 'DivideBySign |/|', RTMulOp));
  OK('div', TTestParser.ParsesAs('div', 'DivKeyword |div|', RTMulOp));
  OK('mod', TTestParser.ParsesAs('mod', 'ModKeyword |mod|', RTMulOp));
  OK('and', TTestParser.ParsesAs('and', 'AndKeyword |and|', RTMulOp));
  OK('shl', TTestParser.ParsesAs('shl', 'ShlKeyword |shl|', RTMulOp));
  OK('shr', TTestParser.ParsesAs('shr', 'ShrKeyword |shr|', RTMulOp));
end;

initialization
  RegisterTest(TTestMulOp.Suite);
{$ENDIF}
end.
