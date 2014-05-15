unit UTestSetType;

interface

uses
  UTest;

type
  TTestSetType = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestSetType;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestSetType }
{$IF NOT DEFINED(DUNIT)}
class function TTestSetType.GetName: string;
begin
  Result := 'SetType';
end;

class procedure TTestSetType.TestAll;
begin
  OK('set of Byte', TTestParser.ParsesAs('set of Byte',
    'SetOfNode' + #13#10 +
    '  SetKeywordNode: SetKeyword |set|' + #13#10 +
    '  OfKeywordNode: OfKeyword |of|' + #13#10 +
    '  TypeNode: Identifier |Byte|', RTSetType));
end;
{$ELSE}

procedure TTestSetType.TestSetType;
begin
  OK('set of Byte', TTestParser.ParsesAs('set of Byte',
    'SetOfNode' + #13#10 +
    '  SetKeywordNode: SetKeyword |set|' + #13#10 +
    '  OfKeywordNode: OfKeyword |of|' + #13#10 +
    '  TypeNode: Identifier |Byte|', RTSetType));
end;

initialization
  RegisterTest(TTestSetType.Suite);
{$ENDIF}
end.
