unit UFrame;
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}
{$WEAKLINKRTTI ON}
interface

uses
  ULocation, UTokenType, UITokenSet, UToken, UIFrame;

type
  TFrame = class(IFrame)
  private
    FToken: TToken;
    FNext: IFrame;
    
  protected
    function GetDisplayName: string; override;
    function GetIsEOF: Boolean; override;
    function GetLocation: TLocation; override;
    function GetNext: IFrame; override;
    procedure SetNext(const Value: IFrame); override;
    function GetTokenType: TTokenType; override;

  public
    constructor Create(AToken: TToken);
    destructor Destroy; override;
    
    function CanParseToken(ATokenSet: ITokenSet): Boolean; override;
    function ParseToken(ATokenSet: ITokenSet): TToken; override;

    property Token: TToken read FToken;
  end;

implementation

uses
  System.TypInfo, UEOFFrame, UParseException;

{ TFrame }

function TFrame.CanParseToken(ATokenSet: ITokenSet): Boolean;
begin
  Result := ATokenSet.Contains(FToken.TokenType);
end;

constructor TFrame.Create(AToken: TToken);
begin
  FNext := nil;
  FToken := AToken.Clone as TToken;
end;

destructor TFrame.Destroy;
begin
  FToken.Free;
  inherited;
end;

function TFrame.GetDisplayName: string;
var
  AType: string;
begin
  AType := GetEnumName(TypeInfo(TTokenType), Integer(FToken.TokenType));
  Result := Copy(AType, 3, Length(AType) - 2);
end;

function TFrame.GetIsEOF: Boolean;
begin
  Result := False;
end;

function TFrame.GetLocation: TLocation;
begin
  Result := FToken.Location;
end;

function TFrame.GetNext: IFrame;
begin
  if FNext = nil then
    Result := TEOFFrame.Create(FToken.EndLocation.Clone)
  else
    Result := FNext;
end;

function TFrame.GetTokenType: TTokenType;
begin
  Result := FToken.TokenType;
end;

function TFrame.ParseToken(ATokenSet: ITokenSet): TToken;
begin
  if CanParseToken(ATokenSet) then
    Result := FToken.Clone as TToken
  else
    raise EParseException.Create('Expected ' + ATokenSet.Name + ' but found ' +
      DisplayName, Location.Clone);
end;

procedure TFrame.SetNext(const Value: IFrame);
begin
  FNext := Value;
end;

end.
