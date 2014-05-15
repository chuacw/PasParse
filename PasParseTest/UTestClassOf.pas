unit UTestClassOf;

interface

uses
  UTest;

type
  TTestClassOf = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestClassOf;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestClassOf }
{$IF NOT DEFINED(DUNIT)}
class function TTestClassOf.GetName: string;
begin
  Result := 'ClassOf';
end;

class procedure TTestClassOf.TestAll;
begin
  OK('class of TObject', TTestParser.ParsesAs('class of TObject',
    'ClassOfNode' + #13#10 +
    '  ClassKeywordNode: ClassKeyword |class|' + #13#10 +
    '  OfKeywordNode: OfKeyword |of|' + #13#10 +
    '  TypeNode: Identifier |TObject|', RTClassOfType));
end;
{$ELSE}

procedure TTestClassOf.TestClassOf;
begin
  OK('class of TObject', TTestParser.ParsesAs('class of TObject',
    'ClassOfNode' + #13#10 +
    '  ClassKeywordNode: ClassKeyword |class|' + #13#10 +
    '  OfKeywordNode: OfKeyword |of|' + #13#10 +
    '  TypeNode: Identifier |TObject|', RTClassOfType));
end;

initialization
  RegisterTest(TTestClassOf.Suite);
{$ENDIF}
end.
