program ParseRTL;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.IOUtils,
  System.Types,
  UVisitor in '..\PasParse\UVisitor.pas',
  UTokenType in '..\PasParse\UTokenType.pas',
  UTokenSets in '..\PasParse\UTokenSets.pas',
  UTokenSet in '..\PasParse\UTokenSet.pas',
  UTokenRule in '..\PasParse\UTokenRule.pas',
  UTokenFilter in '..\PasParse\UTokenFilter.pas',
  UToken in '..\PasParse\UToken.pas',
  USingleTokenTokenSet in '..\PasParse\USingleTokenTokenSet.pas',
  URuleType in '..\PasParse\URuleType.pas',
  URules in '..\PasParse\URules.pas',
  URule in '..\PasParse\URule.pas',
  UPreprocessorException in '..\PasParse\UPreprocessorException.pas',
  UParser in '..\PasParse\UParser.pas',
  UParseException in '..\PasParse\UParseException.pas',
  UNonTerminalNode in '..\PasParse\UNonTerminalNode.pas',
  UMemoryFileLoader in '..\PasParse\UMemoryFileLoader.pas',
  ULocation in '..\PasParse\ULocation.pas',
  UListNode in '..\PasParse\UListNode.pas',
  ULexScanner in '..\PasParse\ULexScanner.pas',
  ULexException in '..\PasParse\ULexException.pas',
  UITokenSet in '..\PasParse\UITokenSet.pas',
  UIParser in '..\PasParse\UIParser.pas',
  UInvalidOperationException in '..\PasParse\UInvalidOperationException.pas',
  UIFrame in '..\PasParse\UIFrame.pas',
  UIFileLoader in '..\PasParse\UIFileLoader.pas',
  UGeneratedNodes in '..\PasParse\UGeneratedNodes.pas',
  UFrame in '..\PasParse\UFrame.pas',
  UFileLoader in '..\PasParse\UFileLoader.pas',
  UEOFFrame in '..\PasParse\UEOFFrame.pas',
  UDelimitedItemNode in '..\PasParse\UDelimitedItemNode.pas',
  UCompilerDefines in '..\PasParse\UCompilerDefines.pas',
  UBaseException in '..\PasParse\UBaseException.pas',
  UASTNode in '..\PasParse\UASTNode.pas',
  UAlternator in '..\PasParse\UAlternator.pas',
  System.Classes;

var
  GFileName: string;
  GFilenames: TStringList;

procedure ParseFile(const AFileName: string);
var
  AFileLoader: TFileLoader;
  AContent: string;
  ACompilerDefines: TCompilerDefines;
  AParser: UParser.TParser;
  ANode: TASTNode;
  I, AOffset: Integer;
  AFileSource, ErrorSource: string;
begin
  GFileName := AFileName;

  // Create FileLoader to load the specified file
  AFileLoader := TFileLoader.Create;
  try
    // Load the file content
    AContent := AFileLoader.Load(AFileName);
    // Create empty compiler defines
    ACompilerDefines := TCompilerDefines.Create;
    try
      // Create the parser
      AParser := UParser.TParser.CreateFromText(AContent, AFileName, ACompilerDefines, AFileLoader);
      try
        ANode := nil;
        try
          // Try to parse a unit from the file content
          ANode := AParser.ParseRule(RTGoal);
          ANode.Free;
        except
          AOffset := AParser.NextFrame.Location.Offset;
          AFileSource := AParser.NextFrame.Location.FileSource;
          I := AOffset;
          while AFileSource[I] <> #13 do Inc(I);
          ErrorSource := Copy(AFileSource, AOffset, I+1-AOffset);
          WriteLn('Error at ', AOffset);
          WriteLn(ErrorSource);
          GFilenames.Add(AFileName);
          raise;
        end;
      finally
        AParser.Free;
      end;
    finally
      ACompilerDefines.Free;
    end;
  finally
    AFileLoader.Free;
  end;
end;

procedure WrapWithException(const AProc: TProc);
begin
  try
    AProc;
  except
    on E: Exception do
      Writeln(Format('Error parsing %s ', [GFileName]), E.Classname, ': ', E.Message);
  end;
end;

procedure ParseRTLMain;
const
  LSourceDir = 'C:\Program Files (x86)\Embarcadero\RAD Studio\12.0\source\';
var
  LFiles: TStringDynArray;
  LFile: string;
  F: TextFile;
  Index: Integer;
begin
//  LFile := 'C:\Program Files (x86)\Embarcadero\RAD Studio\12.0\source\rtl\android\Androidapi.JNI.Analytics.pas';
//  WrapWithException(procedure begin ParseFile(LFile); end);
//  LFile := 'C:\Program Files (x86)\Embarcadero\RAD Studio\12.0\source\rtl\android\Androidapi.OpenSles.pas';
//  WrapWithException(procedure begin ParseFile(LFile); end);
  if GFilenames.Count = 0 then
    LFiles := TDirectory.GetFiles(LSourceDir+'rtl', '*.pas', TSearchOption.soAllDirectories) else
  begin
    LFiles := TStringDynArray(GFilenames.ToStringArray);
    Index := 0;
    AssignFile(F, 'c:\temp\parseindex.txt');
    if FileExists('c:\temp\parseindex.txt') then
      begin
        Reset(F);
        ReadLn(F, Index);
        try
          LFile := LFiles[Index];
          ParseFile(LFile);
          CloseFile(F);
          Erase(F);
          Inc(Index);
          Rewrite(F);
          WriteLn(F, Index);
        except
          on E: Exception do
            Writeln(Format('Error parsing %s ', [GFileName]), E.Classname, ': ', E.Message);
        end;
      end else
      begin
        Rewrite(F);
        Index := 0;
        WriteLn(F, Index);
        LFile := LFiles[Index];
        SetLength(LFiles, 1);
        LFiles[0] := LFile;
      end;
    CloseFile(F);
  end;
//  if Length(LFiles)>1 then
//    for LFile in LFiles do
//      WrapWithException(procedure begin
//        ParseFile(LFile);
//        WriteLn;
//        WriteLn('Parsed ', LFile, ' successfully.');
//      end);
end;

var
  LFilename: string;
begin
  ReportMemoryLeaksOnShutdown := True;
  GFilenames := TStringList.Create;
  if FileExists('c:\temp\parseerrors.txt') then
    GFilenames.LoadFromFile('c:\temp\parseerrors.txt');
  ParseRTLMain;
  if not FileExists('c:\temp\parseerrors.txt') then
    for LFilename in GFilenames do
      WriteLn('Error in ', LFilename);
  if not FileExists('c:\temp\parseerrors.txt') then
    GFilenames.SaveToFile('c:\temp\parseerrors.txt');
  GFilenames.Free;
end.

