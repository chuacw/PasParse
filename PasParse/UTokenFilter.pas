unit UTokenFilter;
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}
{$WEAKLINKRTTI ON}
interface

uses
  System.Generics.Collections, UCompilerDefines, UIFileLoader, UToken, ULocation;

type
  TDirectiveType = (
    DTUnrecognized,
    DTIgnored,
    DTPossibleInclude,
    DTInclude,
    DTDefine,
    DTUndefine,
    DTIf,
    DTElse,
    DTElseIf,
    DTEndIf
  );

  TIfDefTruth = (
    IDTForeverFalse,
    IDTInitiallyFalse,
    IDTTrue
  );

  TIfDefStack = class(TStack<TIfDefTruth>);

  TTokenFilter = class
  private
    FTokens: TObjectList<TToken>;
    FCompilerDefines: TCompilerDefines;
    FFileLoader: IFileLoader;
    FDirectiveTypes: TDictionary<string, TDirectiveType>;

    function Filter(AIfDefStack: TIfDefStack; ATokens: TObjectList<TToken>): TObjectList<TToken>;
    function GetTokens: TObjectList<TToken>;

    function FirstWordOf(const AString: string): string;
    function GetDirectiveType(AFirstWord: string): TDirectiveType;
    procedure HandleCompilerDirective(AIfDefStack: TIfDefStack; AToken: TToken; ATokens: TObjectList<TToken>);
    procedure HandleIf(AIfDefStack: TIfDefStack; const ADirective: string; ALocation: TLocation);
    procedure HandleElseIf(AIfDefStack: TIfDefStack; const ADirective: string; ALocation: TLocation);
    procedure HandleElse(AIfDefStack: TIfDefStack);
    procedure HandleInclude(AIfDefStack: TIfDefStack;
      ATokens: TObjectList<TToken>; ABaseDirectory, AFileName: string);

  public
    constructor Create(ATokens: TObjectList<TToken>; ACompilerDefines: TCompilerDefines;
      AFileLoader: IFileLoader);
    destructor Destroy; override;

    property Tokens: TObjectList<TToken> read GetTokens;
  end;

implementation

uses
  UTokenType, ULexException, ULexScanner, System.SysUtils;

{ TTokenFilter }

constructor TTokenFilter.Create(ATokens: TObjectList<TToken>;
  ACompilerDefines: TCompilerDefines; AFileLoader: IFileLoader);
begin
  inherited Create;
  FTokens := ATokens;
  FCompilerDefines := ACompilerDefines;
  FFileLoader := AFileLoader;

  FDirectiveTypes := TDictionary<string, TDirectiveType>.Create;
  FDirectiveTypes.AddOrSetValue('IF', DTIf);
  FDirectiveTypes.AddOrSetValue('IFDEF', DTIf);
  FDirectiveTypes.AddOrSetValue('IFNDEF', DTIf);
  FDirectiveTypes.AddOrSetValue('IFOPT', DTIf);
  FDirectiveTypes.AddOrSetValue('IFNOPT', DTIf);
  FDirectiveTypes.AddOrSetValue('ELSE', DTElse);
  FDirectiveTypes.AddOrSetValue('ELSEIF', DTElseIf);
  FDirectiveTypes.AddOrSetValue('ENDIF', DTEndIf);
  FDirectiveTypes.AddOrSetValue('IFEND', DTEndIf);
  // Delphi compiler directives
  FDirectiveTypes.AddOrSetValue('ALIGN', DTIgnored);
  FDirectiveTypes.AddOrSetValue('APPTYPE', DTIgnored);
  FDirectiveTypes.AddOrSetValue('ASSERTIONS', DTIgnored);
  FDirectiveTypes.AddOrSetValue('AUTOBOX', DTIgnored);
  FDirectiveTypes.AddOrSetValue('BOOLEVAL', DTIgnored);
  FDirectiveTypes.AddOrSetValue('CODEALIGN', DTIgnored);
  FDirectiveTypes.AddOrSetValue('DEBUGINFO', DTIgnored);
  FDirectiveTypes.AddOrSetValue('DEFINE', DTDefine);
  FDirectiveTypes.AddOrSetValue('DEFINITIONINFO', DTIgnored);
  FDirectiveTypes.AddOrSetValue('DENYPACKAGEUNIT', DTIgnored);
  FDirectiveTypes.AddOrSetValue('DESCRIPTION', DTIgnored);
  FDirectiveTypes.AddOrSetValue('DESIGNONLY', DTIgnored);
  FDirectiveTypes.AddOrSetValue('DYNAMICBASE', DTIgnored);
  FDirectiveTypes.AddOrSetValue('ENDREGION', DTIgnored);
  FDirectiveTypes.AddOrSetValue('EXCESSPRECISION', DTIgnored);
  FDirectiveTypes.AddOrSetValue('EXTENDEDCOMPATIBILITY', DTIgnored);
  FDirectiveTypes.AddOrSetValue('EXTENDEDSYNTAX', DTIgnored);
  FDirectiveTypes.AddOrSetValue('EXTENSION', DTIgnored);
  FDirectiveTypes.AddOrSetValue('FINITEFLOAT', DTIgnored); // .Net only?
  FDirectiveTypes.AddOrSetValue('HIGHCHARUNICODE', DTIgnored);
  FDirectiveTypes.AddOrSetValue('HINTS', DTIgnored);
  FDirectiveTypes.AddOrSetValue('HPPEMIT', DTIgnored);
  FDirectiveTypes.AddOrSetValue('I', DTPossibleInclude);
  FDirectiveTypes.AddOrSetValue('IMAGEBASE', DTIgnored);
  FDirectiveTypes.AddOrSetValue('IMPLICITBUILD', DTIgnored);
  FDirectiveTypes.AddOrSetValue('IMPORTEDDATA', DTIgnored);
  FDirectiveTypes.AddOrSetValue('INCLUDE', DTInclude);
  FDirectiveTypes.AddOrSetValue('INLINE', DTIgnored); // undocumented
  FDirectiveTypes.AddOrSetValue('IOCHECKS', DTIgnored);
  FDirectiveTypes.AddOrSetValue('LEGACYIFEND', DTIgnored);
  FDirectiveTypes.AddOrSetValue('LIBPREFIX', DTIgnored);
  FDirectiveTypes.AddOrSetValue('LIBSUFFIX', DTIgnored);
  FDirectiveTypes.AddOrSetValue('LIBVERSION', DTIgnored);
  FDirectiveTypes.AddOrSetValue('LINK', DTIgnored);
  FDirectiveTypes.AddOrSetValue('LOCALSYMBOLS', DTIgnored);
  FDirectiveTypes.AddOrSetValue('LONGSTRINGS', DTIgnored);
  FDirectiveTypes.AddOrSetValue('MAXSTACKSIZE', DTIgnored);
  FDirectiveTypes.AddOrSetValue('MESSAGE', DTIgnored);
  FDirectiveTypes.AddOrSetValue('METHODINFO', DTIgnored);
  FDirectiveTypes.AddOrSetValue('MINENUMSIZE', DTIgnored);
  FDirectiveTypes.AddOrSetValue('MINSTACKSIZE', DTIgnored);
  FDirectiveTypes.AddOrSetValue('OBJEXPORTALL', DTIgnored);
  FDirectiveTypes.AddOrSetValue('OBJTYPENAME', DTIgnored);
  FDirectiveTypes.AddOrSetValue('OLDTYPELAYOUT', DTIgnored);
  FDirectiveTypes.AddOrSetValue('OPENSTRINGS', DTIgnored);
  FDirectiveTypes.AddOrSetValue('OPTIMIZATION', DTIgnored);
  FDirectiveTypes.AddOrSetValue('OVERFLOWCHECKS', DTIgnored);
  FDirectiveTypes.AddOrSetValue('POINTERMATH', DTIgnored);
  FDirectiveTypes.AddOrSetValue('RANGECHECKS', DTIgnored);
  FDirectiveTypes.AddOrSetValue('REALCOMPATIBILITY', DTIgnored);
  FDirectiveTypes.AddOrSetValue('REFERENCEINFO', DTIgnored);
  FDirectiveTypes.AddOrSetValue('REGION', DTIgnored);
  FDirectiveTypes.AddOrSetValue('RESOURCE', DTIgnored);
  FDirectiveTypes.AddOrSetValue('RESOURCERESERVE', DTIgnored);
  FDirectiveTypes.AddOrSetValue('RTTI', DTIgnored);
  FDirectiveTypes.AddOrSetValue('RUNONLY', DTIgnored);
  FDirectiveTypes.AddOrSetValue('SAFEDIVIDE', DTIgnored);
  FDirectiveTypes.AddOrSetValue('SCOPEDENUMS', DTIgnored);
  FDirectiveTypes.AddOrSetValue('SETPEFLAGS', DTIgnored);
  FDirectiveTypes.AddOrSetValue('SETPEOPTFlags', DTIgnored);
  FDirectiveTypes.AddOrSetValue('SOPREFIX', DTIgnored); // undocumented
  FDirectiveTypes.AddOrSetValue('SOSUFFIX', DTIgnored); // undocumented
  FDirectiveTypes.AddOrSetValue('SOVERSION', DTIgnored); // undocumented
  FDirectiveTypes.AddOrSetValue('STACKCHECKS', DTIgnored); // undocumented
  FDirectiveTypes.AddOrSetValue('STACKFRAMES', DTIgnored);
  FDirectiveTypes.AddOrSetValue('STRONGLINKTYPES', DTIgnored);
  FDirectiveTypes.AddOrSetValue('TYPEDADDRESS', DTIgnored);
  FDirectiveTypes.AddOrSetValue('TYPEINFO', DTIgnored);
  FDirectiveTypes.AddOrSetValue('UNDEF', DTUndefine);
  FDirectiveTypes.AddOrSetValue('UNSAFECODE', DTIgnored);
  FDirectiveTypes.AddOrSetValue('VARPROPSETTER', DTIgnored); // undocumented
  FDirectiveTypes.AddOrSetValue('VARSTRINGCHECKS', DTIgnored);
  FDirectiveTypes.AddOrSetValue('WARN', DTIgnored);
  FDirectiveTypes.AddOrSetValue('WARNINGS', DTIgnored);
  FDirectiveTypes.AddOrSetValue('WEAKLINKRTTI', DTIgnored);
  FDirectiveTypes.AddOrSetValue('WEAKPACKAGEUNIT', DTIgnored);
  FDirectiveTypes.AddOrSetValue('WRITEABLECONST', DTIgnored);
  FDirectiveTypes.AddOrSetValue('ZEROBASEDSTRINGS', DTIgnored);
  // Directives for generation of C++Builder .hpp files
  FDirectiveTypes.AddOrSetValue('EXTERNALSYM', DTIgnored);
  FDirectiveTypes.AddOrSetValue('HPPEMIT', DTIgnored);
  FDirectiveTypes.AddOrSetValue('NODEFINE', DTIgnored);
  FDirectiveTypes.AddOrSetValue('NOINCLUDE', DTIgnored);
end;

destructor TTokenFilter.Destroy;
begin
  FDirectiveTypes.Free;
  inherited;
end;

function TTokenFilter.Filter(AIfDefStack: TIfDefStack; ATokens: TObjectList<TToken>): TObjectList<TToken>;
var
  AToken: TToken;
  I: Integer;
begin
  Result := TObjectList<TToken>.Create;

  try
    I := 0;
    while I < ATokens.Count do
    begin
      AToken := ATokens[I];
      case AToken.TokenType of
        TTSingleLineComment,
        TTCurlyBraceComment,
        TTParenStarComment:
          ; // Do nothing

        TTCompilerDirective:
          HandleCompilerDirective(AIfDefStack, AToken, Result);

        else
          if AIfDefStack.Peek() = IDTTrue then
            Result.Add(AToken.Clone as TToken);
      end;
      Inc(I);
    end;
  except
    Result.Free;
    raise
  end;
end;

function TTokenFilter.FirstWordOf(const AString: string): string;
var
  AChar: Char;
begin
  Result := '';
  for AChar in AString do
  begin
    if ((AChar <= 'Z') and (AChar >= 'A')) or
       ((AChar <= 'z') and (AChar >= 'a')) then
      Result := Result + AChar
    else
      Break;
  end;   
end;

function TTokenFilter.GetDirectiveType(AFirstWord: string): TDirectiveType;
begin
  AFirstWord := UpperCase(AFirstWord);
  if FDirectiveTypes.ContainsKey(AFirstWord) then
    Result := FDirectiveTypes[AFirstWord]
  else if Length(AFirstWord) = 1 then
    Result := DTIgnored
  else
    Result := DTUnrecognized;
end;

function TTokenFilter.GetTokens: TObjectList<TToken>;
var
  AIfDefStack: TIfDefStack;
begin
  AIfDefStack := TIfDefStack.Create;
  AIfDefStack.Push(IDTTrue);
  try
    Result := Filter(AIfDefStack, FTokens);
  finally
    AIfDefStack.Free;
  end;
end;

procedure TTokenFilter.HandleCompilerDirective(AIfDefStack: TIfDefStack;
  AToken: TToken; ATokens: TObjectList<TToken>);
var
  ADirective, AFirstWord, AParameter: string;
begin
  ADirective := AToken.ParsedText;
  AFirstWord := FirstWordOf(ADirective);
  AParameter := Trim(Copy(ADirective, Length(AFirstWord) + 1,
    Length(ADirective) - Length(AFirstWord)));

  case GetDirectiveType(AFirstWord) of
    DTUnrecognized:
      if AIfDefStack.Peek() = IDTTrue then
        raise ELexException.Create('Unrecognized compiler directive ''' +
          AFirstWord + '''', AToken.Location.Clone);

    DTInclude, DTPossibleInclude:
    begin
      if (GetDirectiveType(AFirstWord) = DTInclude) or
        ((AParameter[1] <> '+') and (AParameter[1] <> '-')) then
      begin
        HandleInclude(AIfDefStack, ATokens, AToken.Location.Directory, AParameter);
      end;
    end;

    DTDefine:
      if AIfDefStack.Peek() = IDTTrue then
        FCompilerDefines.DefineSymbol(AParameter);

    DTUndefine:
      if AIfDefStack.Peek() = IDTTrue then
        FCompilerDefines.UndefineSymbol(AParameter);

    DTIf:
      HandleIf(AIfDefStack, ADirective, AToken.Location);

    DTElseIf:
      HandleElseIf(AIfDefStack, ADirective, AToken.Location);

    DTElse:
      HandleElse(AIfDefStack);

    DTEndIf:
      AIfDefStack.Pop();
  end;
end;

procedure TTokenFilter.HandleElse(AIfDefStack: TIfDefStack);
var
  ATruth: TIfDefTruth;
begin
  ATruth := AIfDefStack.Pop();
  if ATruth = IDTInitiallyFalse then
    AIfDefStack.Push(IDTTrue)
  else
    AIfDefStack.Push(IDTForeverFalse);
end;

procedure TTokenFilter.HandleElseIf(AIfDefStack: TIfDefStack; const ADirective: string;
  ALocation: TLocation);
var
  ATruth: TIfDefTruth;
  ATrimmedDirective: string;
begin
  ATruth := TIfDefTruth(AIfDefStack.Pop);
  if (ATruth = IDTTrue) or (ATruth = IDTForeverFalse) then
    AIfDefStack.Push(IDTForeverFalse)
  else
  begin
    ATrimmedDirective := Copy(ADirective, 5, Length(ADirective) - 4);
    if FCompilerDefines.IsTrue(ATrimmedDirective, ALocation) then
      AIfDefStack.Push(IDTTrue)
    else
      AIfDefStack.Push(IDTInitiallyFalse);
  end;
end;

procedure TTokenFilter.HandleIf(AIfDefStack: TIfDefStack; const ADirective: string;
  ALocation: TLocation);
begin
  if AIfDefStack.Peek() = IDTTrue then
  begin
    if FCompilerDefines.IsTrue(ADirective, ALocation) then
      AIfDefStack.Push(IDTTrue)
    else
      AIfDefStack.Push(IDTInitiallyFalse);
  end
  else
    AIfDefStack.Push(IDTForeverFalse);
end;

procedure TTokenFilter.HandleInclude(AIfDefStack: TIfDefStack;
  ATokens: TObjectList<TToken>; ABaseDirectory, AFileName: string);
var
  LDelim: Char; LFileName, ASource: string;
  ALexer: TLexScanner;
  ALexTokens, ANewTokens: TObjectList<TToken>;
  I, FindResult: Integer;
  F: TSearchRec;
label
  __LoadFile;
begin

  if PathDelim = '\' then
    LDelim := '/' else
    LDelim := '\';

  if AFileName.IndexOf(LDelim)>0 then
    AFileName := AFileName.Replace(LDelim, PathDelim);

  if FFileLoader <> nil then
    LFileName := FFileLoader.ExpandFileName(ABaseDirectory, AFileName) else
    LFileName := ABaseDirectory + PathDelim + AFileName;
// if AFileName is osx/xxx.inc and ADirectory is c:\Pro...\posix, then
// the final directory is C:\Pro...\posix\osx, which is different from the
// original directory which is c:\Pro...\posix, so we need to recalculate the
// base directory

// If ABaseDirectory is empty, we know that this is a load of a memory file,
// so skip all the FindFirst/Next/Close
  ABaseDirectory := ExtractFileDir(LFileName);
  FindResult := -1; // any value other than 0, as compared to the while loop
  if ABaseDirectory <> '' then
    FindResult := FindFirst(LFileName, faAnyFile and not faDirectory, F);

  try
    if ABaseDirectory = '' then goto __LoadFile;

    while FindResult = 0 do
      begin
        LFileName := FFileLoader.ExpandFileName(ABaseDirectory, F.Name);
__LoadFile:
        ASource := FFileLoader.LoadFromParentDirs(LFileName);

        ALexer := TLexScanner.Create(ASource, LFileName);
        try
          ALexTokens := ALexer.Tokens;
          try
            ANewTokens := Filter(AIfDefStack, ALexTokens);

            for I := 0 to ANewTokens.Count - 1 do
              ATokens.Add(ANewTokens[I]);

            ANewTokens.OwnsObjects := False;
            ANewTokens.Free;
          finally
            ALexTokens.Free;
          end;
        finally
          ALexer.Free;
        end;

        if ABaseDirectory <>'' then
          FindResult := FindNext(F) else
          Break;

      end;

  finally
    if ABaseDirectory <> '' then
      FindClose(F);
  end;
end;

end.
