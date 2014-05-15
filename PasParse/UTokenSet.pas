unit UTokenSet;
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}
{$WEAKLINKRTTI ON}
interface

uses
  UTokenType, UITokenSet;

type
  /// A named set of token types
  TTokenSet = class(ITokenSet)
  private
    FTokenSet: set of TTokenType;
    FName: string;

  protected
    function GetName: string; override;

  public
    /// Standard constructor. Creates an empty set.
    constructor Create(const AName: string);

    /// Add one token type to the set
    procedure Add(ATokenType: TTokenType);
    /// Add a range of token types to the set
    procedure AddRange(ATokenSet: TTokenSet);
    procedure RemoveRange(ATokenSet: TTokenSet);
    procedure Remove(ATokenType: TTokenType);
    /// Checks whether the set contains the given token type
    function Contains(ATokenType: TTokenType): Boolean; override;
    function ToString: string; override;
  end;

implementation
uses System.SysUtils;

{ TTokenSet }

procedure TTokenSet.Add(ATokenType: TTokenType);
begin
  // Add given token type to the set
  Include(FTokenSet, ATokenType);
end;

procedure TTokenSet.AddRange(ATokenSet: TTokenSet);
var
  ATokenType: TTokenType;
begin
  // Iterate through all available token types
  for ATokenType := Low(TTokenType) to High(TTokenType) do
  begin
    // If the given token set contains the current token type
    if ATokenSet.Contains(ATokenType) then
      // Add the token type to our own token set too
      Add(ATokenType);
  end;
end;

procedure TTokenSet.RemoveRange(ATokenSet: TTokenSet);
var
  LTokenType: TTokenType;
begin
  // Iterate through all available token types
  for LTokenType := Low(TTokenType) to High(TTokenType) do
  begin
    // If the given token set contains the current token type
    if ATokenSet.Contains(LTokenType) then
      // Remove the token type from our own token set too
      Remove(LTokenType);
  end;
end;

procedure TTokenSet.Remove(ATokenType: TTokenType);
begin
  Exclude(FTokenSet, ATokenType);
end;

function TTokenSet.Contains(ATokenType: TTokenType): Boolean;
begin
  Result := (ATokenType in FTokenSet);
end;

constructor TTokenSet.Create(const AName: string);
begin
  FName := AName;
  FTokenSet := [];
end;

function TTokenSet.GetName: string;
begin
  Result := FName;
end;

function TTokenSet.ToString: string;
var
  SB: TStringBuilder;
  LToken: TTokenType;
  LTokenCount: Integer;
begin
  SB := TStringBuilder.Create('one of "');
  LTokenCount := 0;
  try
    for LToken in FTokenSet do
      begin
        if LTokenCount>0 then
          SB.Append(',');
        SB.AppendFormat('''%s''', [LToken.ToString]);
        Inc(LTokenCount);
      end;
    SB.Append('"');
    Result := SB.ToString;
  finally
    SB.Free;
  end;
end;

end.
