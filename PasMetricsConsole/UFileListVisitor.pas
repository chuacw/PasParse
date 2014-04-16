unit UFileListVisitor;

interface

uses
  System.Classes, UFileVisitor;

type
  TFileListVisitor = class(TFileVisitor)
  private
    FFileList: TStringList;

  protected
    procedure Visit(const AFilePath: string); override;

  public
    property Files: TStringList read FFileList;

    constructor Create;
    destructor Destroy; override;
  end;


implementation

{ TFileListVisiot }

constructor TFileListVisitor.Create;
begin
  inherited;
  FFileList := TStringList.Create;
end;

destructor TFileListVisitor.Destroy;
begin
  FFileList.Free;
  inherited;
end;

procedure TFileListVisitor.Visit(const AFilePath: string);
begin
  FFileList.Add(AFilePath);
end;

end.
