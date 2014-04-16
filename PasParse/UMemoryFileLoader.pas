unit UMemoryFileLoader;
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}
{$WEAKLINKRTTI ON}
interface

uses
  UIFileLoader, System.Classes;

type
  TMemoryFileLoader = class(IFileLoader)
  private
    FFileNames: TStringList;
    FFileContents: TStringList;
    function GetFile(const AFileName: string): string;
    procedure SetFile(const AFileName: string; const Value: string);

  public
    constructor Create;
    destructor Destroy; override;

    function ExpandFileName(const ACurrentDirectory, AFileName: string): string; override;
    function Load(const AFileName: string): string; override;
    function Exists(const AFileName: string): Boolean; override;

    property Files[const AFileName: string]: string read GetFile write SetFile; default;
  end;

implementation

uses
  System.SysUtils;

{ TMemoryFileLoader }

constructor TMemoryFileLoader.Create;
begin
  inherited;
  FFileNames := TStringList.Create;
  FFileContents := TStringList.Create;
end;

destructor TMemoryFileLoader.Destroy;
begin
  FFileNames.Free;
  FFileContents.Free;
  inherited;
end;

function TMemoryFileLoader.Exists(const AFileName: string): Boolean;
var
  AIndex: Integer;
begin
  AIndex := FFileNames.IndexOf(AFileName);
  Result := (AIndex >= 0) and (AIndex < FFileContents.Count);
end;

function TMemoryFileLoader.ExpandFileName(const ACurrentDirectory, AFileName: string): string;
begin
  Result := AFileName;
end;

function TMemoryFileLoader.GetFile(const AFileName: string): string;
var
  AIndex: Integer;
begin
  AIndex := FFileNames.IndexOf(AFileName);
  if (AIndex >= 0) and (AIndex < FFileContents.Count) then
    Result := FFileContents.Strings[AIndex]
  else
    raise EInOutError.Create('File not found: ' + AFileName);
end;

function TMemoryFileLoader.Load(const AFileName: string): string;
begin
  Result := Files[AFileName];
end;

procedure TMemoryFileLoader.SetFile(const AFileName: string; const Value: string);
var
  AIndex: Integer;
begin
  AIndex := FFileNames.IndexOf(AFileName);
  if (AIndex >= 0) and (AIndex < FFileContents.Count) then
    FFileContents.Strings[AIndex] := Value
  else
  begin
    FFileNames.Add(AFileName);
    FFileContents.Add(Value);
  end;
end;

end.
