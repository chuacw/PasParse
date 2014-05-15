unit UTestPointerType;

interface

uses
  UTest;

type
  TTestPointerType = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestPointerType;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestPointerType }
{$IF NOT DEFINED(DUNIT)}
class function TTestPointerType.GetName: string;
begin
  Result := 'PointerType';
end;

class procedure TTestPointerType.TestAll;
begin
  OK('^TFoo', TTestParser.ParsesAs('^TFoo',
    'PointerTypeNode' + #13#10 +
    '  CaretNode: Caret |^|' + #13#10 +
    '  TypeNode: Identifier |TFoo|', RTPointerType));

  OK('^Foo.TBar', TTestParser.ParsesAs('^Foo.TBar',
    'PointerTypeNode' + #13#10 +
    '  CaretNode: Caret |^|' + #13#10 +
    '  TypeNode: BinaryOperationNode' + #13#10 +
    '    LeftNode: Identifier |Foo|' + #13#10 +
    '    OperatorNode: Dot |.|' + #13#10 +
    '    RightNode: Identifier |TBar|', RTPointerType));

  OK('^string', TTestParser.ParsesAs('^string',
    'PointerTypeNode' + #13#10 +
    '  CaretNode: Caret |^|' + #13#10 +
    '  TypeNode: StringKeyword |string|', RTPointerType));
end;
{$ELSE}

procedure TTestPointerType.TestPointerType;
begin
  OK('^TFoo', TTestParser.ParsesAs('^TFoo',
    'PointerTypeNode' + #13#10 +
    '  CaretNode: Caret |^|' + #13#10 +
    '  TypeNode: Identifier |TFoo|', RTPointerType));

  OK('^Foo.TBar', TTestParser.ParsesAs('^Foo.TBar',
    'PointerTypeNode' + #13#10 +
    '  CaretNode: Caret |^|' + #13#10 +
    '  TypeNode: BinaryOperationNode' + #13#10 +
    '    LeftNode: Identifier |Foo|' + #13#10 +
    '    OperatorNode: Dot |.|' + #13#10 +
    '    RightNode: Identifier |TBar|', RTPointerType));

  OK('^string', TTestParser.ParsesAs('^string',
    'PointerTypeNode' + #13#10 +
    '  CaretNode: Caret |^|' + #13#10 +
    '  TypeNode: StringKeyword |string|', RTPointerType));
end;

initialization
  RegisterTest(TTestPointerType.Suite);
{$ENDIF}
end.
