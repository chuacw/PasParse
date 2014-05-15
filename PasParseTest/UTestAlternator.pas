unit UTestAlternator;

interface

uses
  TestFramework,
  UTest;

type
  TTestAlternator = class(TTest)
{$IF NOT DEFINED(DUNIT)}
  public
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestAlternator1;
    procedure TestAlternator2;
    procedure TestAlternator3;
{$ENDIF}
  end;

implementation

uses
  UAlternator, UInvalidOperationException, UTokenSet, System.SysUtils;

{ TTestAlternator }
{$IF NOT DEFINED(DUNIT)}
class function TTestAlternator.GetName: string;
begin
  Result := 'Alternator';
end;

class procedure TTestAlternator.TestAll;
var
  AAlternator: TAlternator;
  ATokenSet1, ATokenSet2, ATokenSet3: TTokenSet;
begin
  AAlternator := TAlternator.Create;

  try
    AAlternator.DisplayText;
    OK(False, 'DisplayTextWithNoAlternates exception');
  except
    on ETestException do;
    on EInvalidOperationException do
      OK(True, 'DisplayTextWithNoAlternates exception');
  else
    OK(False, 'DisplayTextWithNoAlternates exception');
  end;

  ATokenSet1 := TTokenSet.Create('foo');
  AAlternator.AddToken(ATokenSet1);
  OK('foo', AAlternator.DisplayText = 'foo');

  ATokenSet2 := TTokenSet.Create('bar');
  AAlternator.AddToken(ATokenSet2);
  OK('foo or bar', AAlternator.DisplayText = 'foo or bar');

  ATokenSet3 := TTokenSet.Create('baz');
  AAlternator.AddToken(ATokenSet3);
  OK('foo, bar or baz', AAlternator.DisplayText = 'foo, bar or baz');

  ATokenSet1.Free;
  ATokenSet2.Free;
  ATokenSet3.Free;

  AAlternator.Free;
end;
{$ELSE}

var
  AAlternator: TAlternator;
  ATokenSet1, ATokenSet2, ATokenSet3: TTokenSet;

procedure TTestAlternator.SetUp;
begin
  AAlternator := TAlternator.Create;
  ATokenSet1 := TTokenSet.Create('foo');
  ATokenSet2 := TTokenSet.Create('bar');
  ATokenSet3 := TTokenSet.Create('baz');
end;

procedure TTestAlternator.TearDown;
begin
  ATokenSet3.Free;
  ATokenSet2.Free;
  ATokenSet1.Free;
  AAlternator.Free;
end;

procedure TTestAlternator.TestAlternator1;
begin

  FreeAndNil(AAlternator);
  AAlternator := TAlternator.Create;
  AAlternator.AddToken(ATokenSet1);
  Check(AAlternator.DisplayText = 'foo', 'foo');

end;

procedure TTestAlternator.TestAlternator2;
begin
  FreeAndNil(AAlternator);
  AAlternator := TAlternator.Create;
  AAlternator.AddToken(ATokenSet1);
  AAlternator.AddToken(ATokenSet2);
  Check(AAlternator.DisplayText = 'foo or bar', 'foo or bar');
end;

procedure TTestAlternator.TestAlternator3;
begin
  FreeAndNil(AAlternator);
  AAlternator := TAlternator.Create;
  AAlternator.AddToken(ATokenSet1);
  AAlternator.AddToken(ATokenSet2);
  AAlternator.AddToken(ATokenSet3);
  Check(AAlternator.DisplayText = 'foo, bar or baz', 'foo, bar or baz');
end;

initialization
  RegisterTest(TTestAlternator.Suite);
{$ENDIF}

end.

