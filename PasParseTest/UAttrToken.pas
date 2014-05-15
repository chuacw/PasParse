unit UAttrToken;

interface

uses UASTNode, UToken, UListNode, UTokenType;

type

  TTokenWithAttr = class(TToken)
  protected
    FAttributes: TListNode;
  public
    procedure AttachAttributes(const AAttributes: TListNode);
    function Clone: TASTNode; overload; override;
    class function Clone(AToken: TToken): TTokenWithAttr; reintroduce; overload;
    function WithTokenType(ATokenType: TTokenType): TTokenWithAttr; reintroduce;
    destructor Destroy; override;
  end;

implementation

{ TTokenWithAttr }

procedure TTokenWithAttr.AttachAttributes(const AAttributes: TListNode);
begin
  FAttributes := AAttributes;
end;

function TTokenWithAttr.Clone: TASTNode;
begin
  Result := WithTokenType(TokenType);
end;

class function TTokenWithAttr.Clone(AToken: TToken): TTokenWithAttr;
var
  AResult: TTokenWithAttr;
  I: Integer;
begin
  AResult := TTokenWithAttr.Create(AToken.TokenType, AToken.Location.Clone,
    AToken.Text, AToken.ParsedText);

  Result := AResult;

  AResult.LineBreaksBefore := AToken.LineBreaksBefore;
  AResult.LineBreaksAfter := AToken.LineBreaksAfter;

  for I := 0 to AToken.CommentsBefore.Count - 1 do
    AResult.CommentsBefore.Add(AToken.CommentsBefore[I].Clone);

  for I := 0 to AToken.CommentsAfter.Count - 1 do
    AResult.CommentsAfter.Add(AToken.CommentsAfter[I].Clone);

end;

destructor TTokenWithAttr.Destroy;
begin
  FAttributes.Free;
  inherited;
end;

function TTokenWithAttr.WithTokenType(ATokenType: TTokenType): TTokenWithAttr;
var
  I: Integer;
begin
  Result := TTokenWithAttr.Create(ATokenType, Location.Clone, Text, ParsedText);
  Result.LineBreaksBefore := FLineBreaksBefore;
  Result.LineBreaksAfter := FLineBreaksAfter;

  for I := 0 to FCommentsBefore.Count - 1 do
    Result.CommentsBefore.Add(FCommentsBefore[I].Clone);

  for I := 0 to FCommentsAfter.Count - 1 do
    Result.CommentsAfter.Add(FCommentsAfter[I].Clone);
end;

end.

