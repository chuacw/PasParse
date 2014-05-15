unit UTest;

interface

uses TestFramework, UCompilerDefines;

type
  TTest = class(TTestCase)
  protected
    FCompilerDefines: TCompilerDefines;
  public
    procedure ParseFile(const AFilename: string);
  end;

implementation

uses UFileLoader, UParser, UASTNode, URuleType,
  UParseException, System.SysUtils;

{ TTest }

procedure TTest.ParseFile(const AFilename: string);
var
  AFileLoader: TFileLoader;
  AContent: string;
  AParser: UParser.TParser;
  ANode: TASTNode;
  I, AOffset, ErrorStartOffset, ErrorEndOffset, HighlightIndex: Integer;
  AFileSource, ErrorSource, LErrorMsg, LMsg, LFinalMsg: string;
begin
  // Create FileLoader to load the specified file
  AFileLoader := TFileLoader.Create;
  try
    // Load the file content
    AContent := AFileLoader.Load(AFileName);
    // Create empty compiler defines
    FCompilerDefines := TCompilerDefines.Create;
    try
      // Create the parser
      AParser := UParser.TParser.CreateFromText(AContent, AFileName, FCompilerDefines, AFileLoader);
      try
        try
          // Try to parse a unit from the file content
          ANode := AParser.ParseRule(RTGoal);
          ANode.Free;
        except
          on E: EParseException do
            begin
              AOffset := E.Location.Offset;
              AFileSource := E.Location.FileSource;
              I := AOffset;
              while not CharInSet(AFileSource[I], [#13, #10]) do Dec(I);
              ErrorStartOffset := I;
              I := AOffset;
              while (AFileSource[I] <> #13) do Inc(I);
              ErrorEndOffset := I-1;
              I := 1+ErrorEndOffset - ErrorStartOffset;
              ErrorSource := Trim(Copy(AFileSource, ErrorStartOffset+1, I));
              LErrorMsg := Format('Error at position %d of %s, line %d, column %d',
                [AOffset, E.Location.FileName, E.Location.LineNo, AOffset-ErrorStartOffset]);
              HighlightIndex := AOffset-1 - ErrorStartOffset;
              LMsg := Format('%s%s', [StringOfChar(' ', HighlightIndex), '^ Error above']);
              LFinalMsg := E.Message + #13#10 + LErrorMsg + #13#10 + ErrorSource + #13#10 + LMsg;
              E.Message := LFinalMsg;
              raise;
            end;
        end;
      finally
        AParser.Free;
      end;
    finally
      FCompilerDefines.Free;
    end;
  finally
    AFileLoader.Free;
  end;
end;

end.
