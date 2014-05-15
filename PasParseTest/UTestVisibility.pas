unit UTestVisibility;

interface

uses
  UTest;

type
  TTestVisibility = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestVisibility;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestVisibility }
{$IF NOT DEFINED(DUNIT)}
class function TTestVisibility.GetName: string;
begin
  Result := 'Visibility';
end;

class procedure TTestVisibility.TestAll;
begin
  OK('private', TTestParser.ParsesAs('private',
    'VisibilityNode' + #13#10 +
    '  StrictSemikeywordNode: (none)' + #13#10 +
    '  VisibilityKeywordNode: PrivateSemikeyword |private|', RTVisibility));

  OK('protected', TTestParser.ParsesAs('protected',
    'VisibilityNode' + #13#10 +
    '  StrictSemikeywordNode: (none)' + #13#10 +
    '  VisibilityKeywordNode: ProtectedSemikeyword |protected|', RTVisibility));

  OK('public', TTestParser.ParsesAs('public',
    'VisibilityNode' + #13#10 +
    '  StrictSemikeywordNode: (none)' + #13#10 +
    '  VisibilityKeywordNode: PublicSemikeyword |public|', RTVisibility));

  OK('published', TTestParser.ParsesAs('published',
    'VisibilityNode' + #13#10 +
    '  StrictSemikeywordNode: (none)' + #13#10 +
    '  VisibilityKeywordNode: PublishedSemikeyword |published|', RTVisibility));

  OK('private', TTestParser.ParsesAs('strict private',
    'VisibilityNode' + #13#10 +
    '  StrictSemikeywordNode: StrictSemikeyword |strict|' + #13#10 +
    '  VisibilityKeywordNode: PrivateSemikeyword |private|', RTVisibility));

  OK('protected', TTestParser.ParsesAs('strict protected',
    'VisibilityNode' + #13#10 +
    '  StrictSemikeywordNode: StrictSemikeyword |strict|' + #13#10 +
    '  VisibilityKeywordNode: ProtectedSemikeyword |protected|', RTVisibility));
end;
{$ELSE}

procedure TTestVisibility.TestVisibility;
begin
  OK('private', TTestParser.ParsesAs('private',
    'VisibilityNode' + #13#10 +
    '  StrictSemikeywordNode: (none)' + #13#10 +
    '  VisibilityKeywordNode: PrivateSemikeyword |private|', RTVisibility));

  OK('protected', TTestParser.ParsesAs('protected',
    'VisibilityNode' + #13#10 +
    '  StrictSemikeywordNode: (none)' + #13#10 +
    '  VisibilityKeywordNode: ProtectedSemikeyword |protected|', RTVisibility));

  OK('public', TTestParser.ParsesAs('public',
    'VisibilityNode' + #13#10 +
    '  StrictSemikeywordNode: (none)' + #13#10 +
    '  VisibilityKeywordNode: PublicSemikeyword |public|', RTVisibility));

  OK('published', TTestParser.ParsesAs('published',
    'VisibilityNode' + #13#10 +
    '  StrictSemikeywordNode: (none)' + #13#10 +
    '  VisibilityKeywordNode: PublishedSemikeyword |published|', RTVisibility));

  OK('private', TTestParser.ParsesAs('strict private',
    'VisibilityNode' + #13#10 +
    '  StrictSemikeywordNode: StrictSemikeyword |strict|' + #13#10 +
    '  VisibilityKeywordNode: PrivateSemikeyword |private|', RTVisibility));

  OK('protected', TTestParser.ParsesAs('strict protected',
    'VisibilityNode' + #13#10 +
    '  StrictSemikeywordNode: StrictSemikeyword |strict|' + #13#10 +
    '  VisibilityKeywordNode: ProtectedSemikeyword |protected|', RTVisibility));
end;

initialization
  RegisterTest(TTestVisibility.Suite);
{$ENDIF}
end.
