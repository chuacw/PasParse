unit UTestParameterType;

interface

uses
  UTest;

type
  TTestParameterType = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestParameterType;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestParameterType }
{$IF NOT DEFINED(DUNIT)}
class function TTestParameterType.GetName: string;
begin
  Result := 'ParameterType';
end;

class procedure TTestParameterType.TestAll;
begin
  OK('TFoo', TTestParser.ParsesAs('TFoo', 'Identifier |TFoo|', RTParameterType));

  OK('Foo.TBar', TTestParser.ParsesAs('Foo.TBar',
    'BinaryOperationNode' + #13#10 +
    '  LeftNode: Identifier |Foo|' + #13#10 +
    '  OperatorNode: Dot |.|' + #13#10 +
    '  RightNode: Identifier |TBar|', RTParameterType));

  OK('string', TTestParser.ParsesAs('string',
    'StringKeyword |string|', RTParameterType));
  OK('file', TTestParser.ParsesAs('file',
    'FileKeyword |file|', RTParameterType));

  OK('array of TFoo', TTestParser.ParsesAs('array of TFoo',
    'OpenArrayNode' + #13#10 +
    '  ArrayKeywordNode: ArrayKeyword |array|' + #13#10 +
    '  OfKeywordNode: OfKeyword |of|' + #13#10 +
    '  TypeNode: Identifier |TFoo|', RTParameterType));
end;
{$ELSE}

procedure TTestParameterType.TestParameterType;
begin
  OK('TFoo', TTestParser.ParsesAs('TFoo', 'Identifier |TFoo|', RTParameterType));

  OK('Foo.TBar', TTestParser.ParsesAs('Foo.TBar',
    'BinaryOperationNode' + #13#10 +
    '  LeftNode: Identifier |Foo|' + #13#10 +
    '  OperatorNode: Dot |.|' + #13#10 +
    '  RightNode: Identifier |TBar|', RTParameterType));

  OK('string', TTestParser.ParsesAs('string',
    'StringKeyword |string|', RTParameterType));
  OK('file', TTestParser.ParsesAs('file',
    'FileKeyword |file|', RTParameterType));

  OK('array of TFoo', TTestParser.ParsesAs('array of TFoo',
    'OpenArrayNode' + #13#10 +
    '  ArrayKeywordNode: ArrayKeyword |array|' + #13#10 +
    '  OfKeywordNode: OfKeyword |of|' + #13#10 +
    '  TypeNode: Identifier |TFoo|', RTParameterType));
end;

initialization
  RegisterTest(TTestParameterType.Suite);
{$ENDIF}
end.
