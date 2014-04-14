unit UCompilerDefines;
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}
{$WEAKLINKRTTI ON}
interface

uses
  Generics.Collections, ULocation;

type
  TCompilerDefines = class
  private
    FDictionary: TDictionary<string, Boolean>;

  public
    constructor Create(ADefineStandards: Boolean = False);
    destructor Destroy; override;

    function Clone: TCompilerDefines;

    procedure DefineDirective(ACompilerDirective: string; AIsTrue: Boolean);
    procedure DefineDirectiveAsFalse(ACompilerDirective: string);
    procedure DefineDirectiveAsTrue(ACompilerDirective: string);
    procedure DefineSymbol(ASymbol: string);
    procedure UndefineSymbol(ASymbol: string);

    function IsTrue(ACompilerDirective: string; ALocation: TLocation): Boolean;
  end;

implementation

uses
  System.SysUtils, UPreprocessorException;

{ TCompilerDefines }

function TCompilerDefines.Clone: TCompilerDefines;
var
  APair: TPair<string, Boolean>;
begin
  Result := TCompilerDefines.Create;
  for APair in FDictionary do
  begin
    Result.DefineDirective(APair.Key, APair.Value);
  end;
end;

constructor TCompilerDefines.Create(ADefineStandards: Boolean);
begin
  FDictionary := TDictionary<string, Boolean>.Create;

  if ADefineStandards then
  begin
    DefineSymbol('CONDITIONALEXPRESSIONS');
    DefineSymbol('CPU386');
    DefineSymbol('MSWINDOWS');
    DefineSymbol('WIN32');
    DefineDirectiveAsTrue('IF not GenericSafeArrays');
    DefineDirectiveAsTrue('IF not GenericVariants');

    // Delphi 1 for Win16
    UndefineSymbol('WINDOWS');
    // C++Builder
    UndefineSymbol('BCB');
    // Kylix
    UndefineSymbol('DECLARE_GPL');
    UndefineSymbol('ELF');
    UndefineSymbol('LINUX');
    UndefineSymbol('LINUX32');
    UndefineSymbol('PC_MAPPED_EXCEPTIONS');
    UndefineSymbol(' PC_MAPPED_EXCEPTIONS');
    UndefineSymbol('PIC');
    UndefineSymbol('POSIX');
    UndefineSymbol('POSIX32');
    // Delphi for .NET
    UndefineSymbol('CIL');
    UndefineSymbol('CLR');
    UndefineSymbol('MANAGEDCODE');
    // Miscellaneous
    UndefineSymbol('DEBUG');
    UndefineSymbol('DEBUG_FUNCTIONS');
    UndefineSymbol('DEBUG_MREWS');
    UndefineSymbol('GLOBALALLOC');
    UndefineSymbol('MEMORY_DIAG');
    UndefineSymbol('PUREPASCAL');
    UndefineSymbol('TRIAL_EDITION');
    UndefineSymbol('USEPASCALCODE');
    DefineDirectiveAsFalse('IF Defined(PIC) Or Defined(PUREPASCAL)');
    DefineDirectiveAsFalse('IF GenericOperations');
    DefineDirectiveAsFalse('IF GenericVariants');
    DefineDirectiveAsFalse('IFOPT R-');

    // Version tags. Not surprisingly, you should DefineSymbol() only one.
    UndefineSymbol('VER80');  // Delphi 1
    UndefineSymbol('VER90');  // Delphi 2
    UndefineSymbol('VER93');  // C++Builder 1
    UndefineSymbol('VER100'); // Delphi 3
    UndefineSymbol('VER110'); // C++Builder 3
    UndefineSymbol('VER120'); // Delphi 4
    UndefineSymbol('VER125'); // C++Builder 4
    UndefineSymbol('VER130'); // Delphi/C++Builder 5
    UndefineSymbol('VER140'); // Delphi/C++Builder 6, Kylix 1, 2, & 3
    UndefineSymbol('VER150'); // Delphi 7
    UndefineSymbol('VER160'); // Delphi 8 for .NET
    UndefineSymbol('VER170'); // Delphi 2005
    UndefineSymbol('VER180'); // Delphi 2006
  end;
end;

procedure TCompilerDefines.DefineDirective(ACompilerDirective: string;
  AIsTrue: Boolean);
begin
  FDictionary.AddOrSetValue(AnsiLowerCase(ACompilerDirective), AIsTrue);
end;

procedure TCompilerDefines.DefineDirectiveAsFalse(ACompilerDirective: string);
begin
  DefineDirective(ACompilerDirective, False);
end;

procedure TCompilerDefines.DefineDirectiveAsTrue(ACompilerDirective: string);
begin
  DefineDirective(ACompilerDirective, True);
end;

procedure TCompilerDefines.DefineSymbol(ASymbol: string);
begin
  if ASymbol <> '' then
  begin
    DefineDirectiveAsTrue('IFDEF ' + ASymbol);
    DefineDirectiveAsTrue('IF Defined(' + ASymbol + ')');
    DefineDirectiveAsFalse('IFNDEF ' + ASymbol);
    DefineDirectiveAsFalse('IF not Defined(' + ASymbol + ')');
  end;
end;

destructor TCompilerDefines.Destroy;
begin
  FDictionary.Free;
  inherited;
end;

function TCompilerDefines.IsTrue(ACompilerDirective: string;
  ALocation: TLocation): Boolean;
var
  AValue: Boolean;
begin
  if FDictionary.TryGetValue(AnsiLowerCase(ACompilerDirective), AValue) then
    Result := AValue
  else if Copy(AnsiLowerCase(ACompilerDirective), 1, 6) = 'ifdef ' then
    Result := False
  else if Copy(AnsiLowerCase(ACompilerDirective), 1, 7) = 'ifndef ' then
    Result := True
  else
    raise EPreprocessorException.Create('Compiler directive ''' +
      ACompilerDirective + ''' has not been defined as either True or False',
      ALocation.Clone);
end;

procedure TCompilerDefines.UndefineSymbol(ASymbol: string);
begin
  if ASymbol <> '' then
  begin
    DefineDirectiveAsFalse('IFDEF ' + ASymbol);
    DefineDirectiveAsFalse('IF Defined(' + ASymbol + ')');
    DefineDirectiveAsTrue('IFNDEF ' + ASymbol);
    DefineDirectiveAsTrue('IF not Defined(' + ASymbol + ')');
  end;
end;

end.
