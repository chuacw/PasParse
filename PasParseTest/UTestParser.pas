unit UTestParser;

interface

uses
  UTest, URuleType;

type
  TTestParser = class
  public
    class function ParsesAs(const ASource, AGoal: string; ARuleType: TRuleType): Boolean;
  end;

implementation

uses
  UCompilerDefines, UASTNode, UParser, UInvalidOperationException{$IF DEFINED(DUNIT)},
  TestFramework{$ENDIF}
  {$IF DEFINED(DEBUG)},
  FMX.Platform, System.SysUtils
  {$ENDIF};

{ TTestParser }

{$IF DEFINED(DEBUG)}
function ConvertToPascalString(const AString: string): string;
begin
  Result := StringReplace(AString, '''', '''''', [rfReplaceAll]);
  Result := '''' + StringReplace(Result, sLineBreak,
    '''+ #13#10 +'+sLineBreak+'''', [rfReplaceAll]) + '''';
end;
{$ENDIF}

class function TTestParser.ParsesAs(const ASource, AGoal: string;
  ARuleType: TRuleType): Boolean;
var
  ACompilerDefines: TCompilerDefines;
  AParser: TParser;
  ANode: TASTNode;
  AActualString: string;
{$IF DEFINED(DEBUG)}
  ClipboardString: string;
  Clipboard: IFMXClipboardService;
{$ENDIF}
begin
  Result := False;
  ACompilerDefines := TCompilerDefines.Create;
  AParser := TParser.CreateFromText(ASource, '', ACompilerDefines, nil);
  try
    ANode := AParser.ParseRule(ARuleType);
    AActualString := ANode.Inspect;
{$IF DEFINED(DEBUG)}
    if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService,
      IInterface(Clipboard)) then
      begin
        ClipboardString := ConvertToPascalString(AActualString);
        Clipboard.SetClipboard(ClipboardString);
      end;
{$ENDIF}
    ANode.Free;

    try
      if not AParser.IsEOF then
        raise EInvalidOperationException.Create('Rule did not consume all input');

    finally
      Result := (AActualString = AGoal) and (AParser.IsEOF);
    end;
  finally
    AParser.Free;
    ACompilerDefines.Free;
  end;
end;

end.
