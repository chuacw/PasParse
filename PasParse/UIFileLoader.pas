unit UIFileLoader;
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}
{$WEAKLINKRTTI ON}
interface

type
  IFileLoader = class
  public
    function ExpandFileName(const ACurrentDirectory, AFileName: string): string; virtual; abstract;
    function Load(const AFileName: string): string; virtual; abstract;
    function LoadFromParentDirs(AFilePath: string): string;
    function Exists(const AFileName: string): Boolean; virtual; abstract;
  end;

implementation

uses
  System.SysUtils;

{ IFileLoader }

function IFileLoader.LoadFromParentDirs(AFilePath: string): string;
var
  ADirectory, AFileName: string;
begin
  if Exists(AFilePath) then
    Result := Load(AFilePath)
  else
  begin
    // Extract current filename and directory
    AFileName := ExtractFileName(AFilePath);
    ADirectory := ExtractFileDir(AFilePath);

    repeat
      // Extract parent directory
      ADirectory := ExtractFileDir(ADirectory);
      AFilePath := ExpandFileName(ADirectory, AFileName);
      if Exists(AFilePath) then
        Break;
    until (ADirectory = '') or (ADirectory = '/') or
      (Copy(ADirectory, Length(ADirectory), 1) = '\');

    Result := Load(AFilePath);
  end;
end;


end.
