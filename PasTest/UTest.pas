unit UTest;

interface

uses
  System.SysUtils
{$IF DEFINED(DUNIT)}, TestFramework, UCompilerDefines, UFileLoader
{$ENDIF};

type
  ETestException = class(Exception);

  TTest = class{$IF DEFINED(DUNIT)}(TTestCase){$ENDIF}
  private
    class var FPlanned: Integer;
{$IF NOT DEFINED(DUNIT)}
    class var FFailed: Integer;
    class var FExecuted: Integer;

    class procedure Reset;
    class function ReturnCode: Integer;
{$ENDIF}

  protected
{$IF NOT DEFINED(DUNIT)}
    class function OK(AResult: Boolean): Boolean; overload;
    class function OK(AResult: Boolean; const ADescription: string): Boolean; overload;
    class function OK(const ADescription: string; AResult: Boolean): Boolean; overload;
    class function GetName: string; virtual; abstract;
{$ELSE}
    FCompilerDefines: TCompilerDefines;
    procedure OK(AResult: Boolean); overload;
    procedure OK(AResult: Boolean; const ADescription: string); overload;
    procedure OK(const ADescription: string; AResult: Boolean); overload;
    procedure ParseString(const AContent: string; const AFileName: string='';
      AFileLoader: TFileLoader=nil);
    procedure ParseFile(const AFilename: string);
{$ENDIF}
    class procedure TestAll; virtual; abstract;
    class procedure Plan(ANumber: Integer);

  public
{$IF NOT DEFINED(DUNIT)}
    class function Test: Integer;
{$ENDIF}
  end;

implementation
{$IF DEFINED(DUNIT)}
uses UParser, UASTNode, URuleType,
  UParseException;
{$ENDIF}

{ TTest }

{$IF NOT DEFINED(DUNIT)}class function {$ELSE}procedure{$ENDIF}TTest.OK(AResult: Boolean; const ADescription: string){$IF NOT DEFINED(DUNIT)}: Boolean{$ENDIF};
{$IF NOT DEFINED(DUNIT)}
var
  AResultText: string;
{$ENDIF}
begin
{$IF DEFINED(DUNIT)}
  Check(AResult, ADescription);
{$ELSE}
  Result := AResult;

  Inc(FExecuted);
  if AResult then
    AResultText := 'ok'
  else
  begin
    AResultText := 'not ok';
    Inc(FFailed);

    raise ETestException.Create('Test #' + IntToStr(FExecuted) + ' failed: ' +
      ADescription);
  end;

  AResultText := AResultText + ' ' + IntToStr(FExecuted);
  if ADescription <> '' then
    AResultText := AResultText + ' - ' + ADescription;

  WriteLn(AResultText);
{$ENDIF}
end;

{$IF NOT DEFINED(DUNIT)}class function{$ELSE}procedure{$ENDIF}TTest.OK(AResult: Boolean){$IF NOT DEFINED(DUNIT)}: Boolean{$ENDIF};
begin
{$IF DEFINED(DUNIT)}
  Check(AResult);
{$ELSE}
  Result := OK(AResult, '');
{$ENDIF}
end;

{$IF NOT DEFINED(DUNIT)}class function{$ELSE}procedure{$ENDIF}TTest.OK(const ADescription: string; AResult: Boolean){$IF NOT DEFINED(DUNIT)}: Boolean{$ENDIF};
begin
{$IF DEFINED(DUNIT)}
  Check(AResult, ADescription);
{$ELSE}
  Result := OK(AResult, ADescription);
{$ENDIF}
end;

class procedure TTest.Plan(ANumber: Integer);
begin
  FPlanned := ANumber
end;

{$IF NOT DEFINED(DUNIT)}
class procedure TTest.Reset;
begin
  FExecuted := 0;
  FFailed := 0;
  Plan(0);
end;

class function TTest.ReturnCode: Integer;
begin
  if FPlanned <= 0 then
    Result := FFailed
  else
    Result := (FPlanned - FExecuted) + FFailed;
end;

class function TTest.Test: Integer;
begin
  Reset;
  WriteLn('--------------------------');
  WriteLn('# Test: ' + GetName);
  WriteLn('');
  TestAll;
  Result := ReturnCode;
  WriteLn('');
  if ReturnCode = 0 then
    WriteLn('All tests passed!')
  else
    WriteLn(IntToStr(ReturnCode) + ' tests failed!')
end;
{$ELSE}

procedure TTest.ParseString(const AContent: string; const AFileName: string='';
  AFileLoader: TFileLoader=nil);
var
  AParser: UParser.TParser;
  ANode: TASTNode;
  I, AOffset, ErrorStartOffset, ErrorEndOffset, HighlightIndex: Integer;
  AFileSource, ErrorSource, LErrorMsg, LMsg, LFinalMsg: string;
begin
  // Create empty compiler defines
  FCompilerDefines := TCompilerDefines.Create;
  try
    // Create the parser
    AParser := UParser.TParser.CreateFromText(AContent, AFileName,
      FCompilerDefines, AFileLoader);
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
end;

procedure TTest.ParseFile(const AFilename: string);
var
  AFileLoader: TFileLoader;
  AContent: string;
begin
  // Create FileLoader to load the specified file
  AFileLoader := TFileLoader.Create;
  try
    // Load the file content
    AContent := AFileLoader.Load(AFileName);
    ParseString(AContent, AFileName, AFileLoader);
  finally
    AFileLoader.Free;
  end;
end;

{$ENDIF}

end.

