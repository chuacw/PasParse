unit UListNode;
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}
{$WEAKLINKRTTI ON}
interface

uses
  UNonTerminalNode, UASTNode, System.Generics.Collections;

type
  TListNode = class;
  TListNodeEnumerator = class
  private
    FIndex: Integer;
    FListNode: TListNode;
  public
    constructor Create(const AListNode: TListNode);
    function GetCurrent: TASTNode;
    function MoveNext: Boolean;
    property Current: TASTNode read GetCurrent;
  end;

  TListNode = class(TNonTerminalNode)
  private
    function GetItem(const AIndex: Integer): TASTNode;
    function GetCount: Integer;

  public
    constructor Create(AItems: TObjectList<TASTNode>);

    function Clone: TASTNode; override;
    function GetEnumerator: TListNodeEnumerator;

    property Items[const AIndex: Integer]: TASTNode read GetItem;
    property ItemsCount: Integer read GetCount;
  end;

implementation

uses
  System.SysUtils;

{ TListNode }

function TListNode.Clone: TASTNode;
var
  AList: TObjectList<TASTNode>;
  I: Integer;
  AASTNode: TASTNode;
begin
  AList := TObjectList<TASTNode>.Create(False);

  for I := 0 to FChildNodes.Count - 1 do
  begin
    if FChildNodes[I] <> nil then
      AASTNode := FChildNodes[I].Clone
    else
      AASTNode := nil;
      
    AList.Add(AASTNode);
  end;

  Result := TListNode.Create(AList);
  AList.Free;
end;

constructor TListNode.Create(AItems: TObjectList<TASTNode>);
var
  I: Integer;
begin
  inherited Create;

  for I := 0 to AItems.Count - 1 do
  begin
    FChildNodes.Add(AItems[I]);
    FProperties.Add(TASTNodeProperty.Create('Items[' + IntToStr(I) + ']', (AItems[I] as TASTNode)));
  end;
end;

function TListNode.GetCount: Integer;
begin
  Result := FChildNodes.Count;
end;

function TListNode.GetEnumerator: TListNodeEnumerator;
begin
  Result := TListNodeEnumerator.Create(Self);
end;

function TListNode.GetItem(const AIndex: Integer): TASTNode;
begin
  Result := FChildNodes.Items[AIndex];
end;

{ TListNodeEnumerator }

constructor TListNodeEnumerator.Create(const AListNode: TListNode);
begin
  inherited Create;
  FIndex := -1;
  FListNode := AListNode;
end;

function TListNodeEnumerator.GetCurrent: TASTNode;
begin
  Result := FListNode.Items[FIndex];
end;

function TListNodeEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FListNode.ItemsCount-1;
  if Result then
    Inc(FIndex);
end;

end.
