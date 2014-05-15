unit UFileLoader;
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}
{$WEAKLINKRTTI ON}
interface

uses
  UIFileLoader;

type
  TFileLoader = class(IFileLoader)
  public
    function ExpandFileName(const ACurrentDirectory, AFileName: string): string; override;
    function Load(const AFileName: string): string; override;
    function Exists(const AFileName: string): Boolean; override;
  end;

implementation

uses
  System.SysUtils, System.Classes;

{ TFileLoader }

function TFileLoader.Exists(const AFileName: string): Boolean;
begin
  Result := FileExists(AFileName);
end;

function TFileLoader.ExpandFileName(const ACurrentDirectory,
  AFileName: string): string;
begin
  Result := ACurrentDirectory + PathDelim + AFileName;
end;

function TFileLoader.Load(const AFileName: string): string;
var
  AReader: TStreamReader;
begin
  if not FileExists(AFileName) then
    raise EInOutError.Create('File not found: ' + AFileName)
  else
  begin
    AReader := TStreamReader.Create(AFileName, TEncoding.ANSI,
      True);
    try
      Result := AReader.ReadToEnd;
    finally
      AReader.Free;
    end;
  end;
end;

end.
