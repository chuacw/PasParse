unit UTestExtendedIdent;

interface

uses
  UTest;

type
  TTestExtendedIdent = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType, UTokenSets, UTokenType, System.TypInfo, System.SysUtils;

{ TTestExtendedIdent }

class function TTestExtendedIdent.GetName: string;
begin
  Result := 'ExtendedIdent';
end;

class procedure TTestExtendedIdent.TestAll;
var
  AWord: string;
  ATokenType: TTokenType;
begin
  OK('Foo', TTestParser.ParsesAs('Foo', 'Identifier |Foo|', RTExtendedIdent));

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
        'Identifier |' + AWord + '|', RTExtendedIdent));
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

      OK(AWord, TTestParser.ParsesAs(AWord,
        'Identifier |' + AWord + '|', RTExtendedIdent));
    end;
  end;
end;

end.
