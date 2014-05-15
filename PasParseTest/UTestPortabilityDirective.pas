unit UTestPortabilityDirective;

interface

uses
  UTest;

type
  TTestPortabilityDirective = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestPortabilityDirective;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestPortabilityDirective }
{$IF NOT DEFINED(DUNIT)}
class function TTestPortabilityDirective.GetName: string;
begin
  Result := 'PortabilityDirective';
end;

class procedure TTestPortabilityDirective.TestAll;
begin
  OK('platform', TTestParser.ParsesAs('platform',
    'DirectiveNode'+ #13#10 +
    '  SemicolonNode: (none)'+ #13#10 +
    '  KeywordNode: PlatformSemikeyword |platform|'+ #13#10 +
    '  ValueNode: (none)'+ #13#10 +
    '  DataNode: (none)', RTPortabilityDirective));
  OK('deprecated', TTestParser.ParsesAs('deprecated',
    'DirectiveNode'+ #13#10 +
    '  SemicolonNode: (none)'+ #13#10 +
    '  KeywordNode: DeprecatedSemikeyword |deprecated|'+ #13#10 +
    '  ValueNode: (none)'+ #13#10 +
    '  DataNode: (none)', RTPortabilityDirective));
  OK('library', TTestParser.ParsesAs('library',
    'DirectiveNode'+ #13#10 +
    '  SemicolonNode: (none)'+ #13#10 +
    '  KeywordNode: LibraryKeyword |library|'+ #13#10 +
    '  ValueNode: (none)'+ #13#10 +
    '  DataNode: (none)', RTPortabilityDirective));
  OK('experimental', TTestParser.ParsesAs('experimental',
    'DirectiveNode'+ #13#10 +
    '  SemicolonNode: (none)'+ #13#10 +
    '  KeywordNode: ExperimentalSemikeyword |experimental|'+ #13#10 +
    '  ValueNode: (none)'+ #13#10 +
    '  DataNode: (none)', RTPortabilityDirective));
end;
{$ELSE}

procedure TTestPortabilityDirective.TestPortabilityDirective;
begin
  OK('platform', TTestParser.ParsesAs('platform',
    'DirectiveNode'+ #13#10 +
    '  SemicolonNode: (none)'+ #13#10 +
    '  KeywordNode: PlatformSemikeyword |platform|'+ #13#10 +
    '  ValueNode: (none)'+ #13#10 +
    '  DataNode: (none)', RTPortabilityDirective));
  OK('deprecated', TTestParser.ParsesAs('deprecated',
    'DirectiveNode'+ #13#10 +
    '  SemicolonNode: (none)'+ #13#10 +
    '  KeywordNode: DeprecatedSemikeyword |deprecated|'+ #13#10 +
    '  ValueNode: (none)'+ #13#10 +
    '  DataNode: (none)', RTPortabilityDirective));
  OK('library', TTestParser.ParsesAs('library',
    'DirectiveNode'+ #13#10 +
    '  SemicolonNode: (none)'+ #13#10 +
    '  KeywordNode: LibraryKeyword |library|'+ #13#10 +
    '  ValueNode: (none)'+ #13#10 +
    '  DataNode: (none)', RTPortabilityDirective));
  OK('experimental', TTestParser.ParsesAs('experimental',
    'DirectiveNode'+ #13#10 +
    '  SemicolonNode: (none)'+ #13#10 +
    '  KeywordNode: ExperimentalSemikeyword |experimental|'+ #13#10 +
    '  ValueNode: (none)'+ #13#10 +
    '  DataNode: (none)', RTPortabilityDirective));
end;

initialization
  RegisterTest(TTestPortabilityDirective.Suite);
{$ENDIF}
end.
