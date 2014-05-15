unit UTestIdent;

interface

uses
  UTest;

type
  TTestIdent = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestIdent;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType, UTokenType, UTokenSets, UParseException,
  System.TypInfo, System.SysUtils{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestIdent }
{$IF NOT DEFINED(DUNIT)}
class function TTestIdent.GetName: string;
begin
  Result := 'Ident';
end;

class procedure TTestIdent.TestAll;
var
  AWord: string;
  ATokenType: TTokenType;
begin
  OK('Foo', TTestParser.ParsesAs('Foo', 'Identifier |Foo|', RTIdent));

  // Iterate through all available token types
  for ATokenType := Low(TTokenType) to High(TTokenType) do
  begin
    // If the given TTokenSet contains the current token type
    if TTokenSets.TSSemikeyword.Contains(ATokenType) then
    begin
      // Get token name (e.g. TTIfKeyword)
      AWord := GetEnumName(TypeInfo(TTokenType), Integer(ATokenType));
      // Convert token name to keyword (e.g. TTIfKeyword -> If)
      AWord := StringReplace(Copy(AWord, 3, Length(AWord) - 2), 'Semikeyword', '', []);

      OK(AWord, TTestParser.ParsesAs(AWord,
        'Identifier |' + AWord + '|', RTIdent));
    end;
  end;

  // Iterate through all available token types
  for ATokenType := Low(TTokenType) to High(TTokenType) do
  begin
    // If the given TTokenSet contains the current token type
    if TTokenSets.TSKeyword.Contains(ATokenType) then
    begin
      // Get token name (e.g. TTIfKeyword)
      AWord := GetEnumName(TypeInfo(TTokenType), Integer(ATokenType));
      // Convert token name to keyword (e.g. TTIfKeyword -> If)
      AWord := StringReplace(Copy(AWord, 3, Length(AWord) - 2), 'Keyword', '', []);

      try
        TTestParser.ParsesAs(AWord, 'Identifier |' + AWord + '|', RTIdent);
        OK(False, AWord + ' exception');
      except
        on ETestException do;
        on EParseException do
          OK(True, AWord + ' exception');
      else
        OK(False, AWord + ' exception');
      end;
    end;
  end;
end;
{$ELSE}

procedure TTestIdent.TestIdent;
var
  AWord: string;
  ATokenType: TTokenType;
begin
  OK('Foo', TTestParser.ParsesAs('Foo', 'Identifier |Foo|', RTIdent));

  // Iterate through all available token types
  for ATokenType := Low(TTokenType) to High(TTokenType) do
  begin
    // If the given TTokenSet contains the current token type
    if TTokenSets.TSSemikeyword.Contains(ATokenType) then
    begin
      // Get token name (e.g. TTIfKeyword)
      AWord := GetEnumName(TypeInfo(TTokenType), Integer(ATokenType));
      // Convert token name to keyword (e.g. TTIfKeyword -> If)
      AWord := StringReplace(Copy(AWord, 3, Length(AWord) - 2), 'Semikeyword', '', []);

      OK(AWord, TTestParser.ParsesAs(AWord,
        'Identifier |' + AWord + '|', RTIdent));
    end;
  end;

  // Iterate through all available token types
  for ATokenType := Low(TTokenType) to High(TTokenType) do
  begin
    // If the given TTokenSet contains the current token type
    if TTokenSets.TSKeyword.Contains(ATokenType) then
    begin
      // Get token name (e.g. TTIfKeyword)
      AWord := GetEnumName(TypeInfo(TTokenType), Integer(ATokenType));
      // Convert token name to keyword (e.g. TTIfKeyword -> If)
      AWord := StringReplace(Copy(AWord, 3, Length(AWord) - 2), 'Keyword', '', []);

      try
        TTestParser.ParsesAs(AWord, 'Identifier |' + AWord + '|', RTIdent);
        OK(False, AWord + ' exception');
      except
        on ETestException do;
        on EParseException do
          OK(True, AWord + ' exception');
      else
        OK(False, AWord + ' exception');
      end;
    end;
  end;
end;

initialization
  RegisterTest(TTestIdent.Suite);
{$ENDIF}
end.
