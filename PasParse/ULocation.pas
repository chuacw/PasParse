unit ULocation;
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}
{$WEAKLINKRTTI ON}
interface

type
  /// <Description>A class holding information about a certain Location in a code file.</Description>
  TLocation = class
  private
    /// <Description>The name of the file where the Location can be found.</Description>
    FFileName: string;
    /// <Description>The content of the file where the Location can be found.</Description>
    FFileSource: string;
    /// <Description>The offset from the start of FileSource where the Location can be found.</Description>
    FOffset: Integer;
    FLineNo: NativeUInt;
    /// <Description>The directory that the file is in.</Description>
    function GetDirectory: string;

  public
    /// <Description>Default constructor.</Description>
    constructor Create(const AFileName, AFileSource: string; AOffset: Integer;
      const ALineNo: NativeUInt);

    /// <Description>The name of the file where the Location can be found.</Description>
    property FileName: string read FFileName;
    /// <Description>The content of the file where the Location can be found.</Description>
    property FileSource: string read FFileSource;
    /// <Description>The offset from the start of FileSource where the Location can be found.</Description>
    property Offset: Integer read FOffset;
    property LineNo: NativeUInt read FLineNo;
    /// <Description>Creates a clone of the current Location.</Description>
    function Clone: TLocation;

    /// <Description>The directory that the file is in.</Description>
    property Directory: string read GetDirectory;
  end;

implementation

uses
  System.SysUtils;

{ TLocation }

function TLocation.Clone: TLocation;
begin
  // Create a new Location instance with the same parameters and return it
  Result := TLocation.Create(FFileName, FFileSource, FOffset, FLineNo);
end;

constructor TLocation.Create(const AFileName, AFileSource: string;
  AOffset: Integer; const ALineNo: NativeUInt);
begin
  // Assign private fields
  FFileName := AFileName;
  FFileSource := AFileSource;
  FOffset := AOffset;
  FLineNo := ALineNo;
end;

function TLocation.GetDirectory: string;
begin
  if FFileName = '' then
    Result := ''
  else
    Result := ExtractFileDir(FFileName);
end;

end.
