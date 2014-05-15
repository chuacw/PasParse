unit UTestStringType;

interface

uses
  UTest;

type
  TTestStringType = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestStringType;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestStringType }
{$IF NOT DEFINED(DUNIT)}
class function TTestStringType.GetName: string;
begin
  Result := 'StringType';
end;

class procedure TTestStringType.TestAll;
begin
  OK('string', TTestParser.ParsesAs('string', 'StringKeyword |string|', RTStringType));

  OK('string[42]', TTestParser.ParsesAs('string[42]',
    'StringOfLengthNode' + #13#10 +
    '  StringKeywordNode: StringKeyword |string|' + #13#10 +
    '  OpenBracketNode: OpenBracket |[|' + #13#10 +
    '  LengthNode: Number |42|' + #13#10 +
    '  CloseBracketNode: CloseBracket |]|', RTStringType));
end;
{$ELSE}

procedure TTestStringType.TestStringType;
begin
  OK('string', TTestParser.ParsesAs('string', 'StringKeyword |string|', RTStringType));

  OK('string[42]', TTestParser.ParsesAs('string[42]',
    'StringOfLengthNode' + #13#10 +
    '  StringKeywordNode: StringKeyword |string|' + #13#10 +
    '  OpenBracketNode: OpenBracket |[|' + #13#10 +
    '  LengthNode: Number |42|' + #13#10 +
    '  CloseBracketNode: CloseBracket |]|', RTStringType));
end;

initialization
  RegisterTest(TTestStringType.Suite);
{$ENDIF}
end.
