unit UTestQualifiedIdent;

interface

uses
  UTest;

type
  TTestQualifiedIdent = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestQualifiedIdent;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType, UParseException{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestQualifiedIdent }

{$IF NOT DEFINED(DUNIT)}
class function TTestQualifiedIdent.GetName: string;
begin
  Result := 'QualifiedIdent';
end;

class procedure TTestQualifiedIdent.TestAll;
begin
  OK('Foo', TTestParser.ParsesAs('Foo', 'Identifier |Foo|', RTQualifiedIdent));
  OK('Absolute', TTestParser.ParsesAs('Absolute',
    'Identifier |Absolute|', RTQualifiedIdent));
  OK('&Class', TTestParser.ParsesAs('&Class',
    'Identifier |&Class|', RTQualifiedIdent));

  OK('Should.Not', TTestParser.ParsesAs('Should.Not',
    'BinaryOperationNode' + #13#10 +
    '  LeftNode: Identifier |Should|' + #13#10 +
    '  OperatorNode: Dot |.|' + #13#10 +
    '  RightNode: Identifier |Not|', RTQualifiedIdent));

  OK('Foo.Bar.Baz', TTestParser.ParsesAs('Foo.Bar.Baz',
    'BinaryOperationNode' + #13#10 +
    '  LeftNode: BinaryOperationNode' + #13#10 +
    '    LeftNode: Identifier |Foo|' + #13#10 +
    '    OperatorNode: Dot |.|' + #13#10 +
    '    RightNode: Identifier |Bar|' + #13#10 +
    '  OperatorNode: Dot |.|' + #13#10 +
    '  RightNode: Identifier |Baz|', RTQualifiedIdent));

  try
    TTestParser.ParsesAs('Class', 'ClassKeyword |Class|', RTQualifiedIdent);
    OK(False, 'Class exception');
  except
    on ETestException do;
    on EParseException do
      OK(True, 'Class exception');
  else
    OK(False, 'Class exception');
  end;
end;
{$ELSE}

procedure TTestQualifiedIdent.TestQualifiedIdent;
begin
  OK('Foo', TTestParser.ParsesAs('Foo', 'Identifier |Foo|', RTQualifiedIdent));
  OK('Absolute', TTestParser.ParsesAs('Absolute',
    'Identifier |Absolute|', RTQualifiedIdent));
  OK('&Class', TTestParser.ParsesAs('&Class',
    'Identifier |&Class|', RTQualifiedIdent));

  OK('Should.Not', TTestParser.ParsesAs('Should.Not',
    'BinaryOperationNode' + #13#10 +
    '  LeftNode: Identifier |Should|' + #13#10 +
    '  OperatorNode: Dot |.|' + #13#10 +
    '  RightNode: Identifier |Not|', RTQualifiedIdent));

  OK('Foo.Bar.Baz', TTestParser.ParsesAs('Foo.Bar.Baz',
    'BinaryOperationNode' + #13#10 +
    '  LeftNode: BinaryOperationNode' + #13#10 +
    '    LeftNode: Identifier |Foo|' + #13#10 +
    '    OperatorNode: Dot |.|' + #13#10 +
    '    RightNode: Identifier |Bar|' + #13#10 +
    '  OperatorNode: Dot |.|' + #13#10 +
    '  RightNode: Identifier |Baz|', RTQualifiedIdent));

  try
    TTestParser.ParsesAs('Class', 'ClassKeyword |Class|', RTQualifiedIdent);
    OK(False, 'Class exception');
  except
    on ETestException do;
    on EParseException do
      OK(True, 'Class exception');
  else
    OK(False, 'Class exception');
  end;
end;

initialization
  RegisterTest(TTestQualifiedIdent.Suite);
{$ENDIF}
end.
