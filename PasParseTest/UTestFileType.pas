unit UTestFileType;

interface

uses
  UTest;

type
  TTestFileType = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestFileType;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestFileType }
{$IF NOT DEFINED(DUNIT)}
class function TTestFileType.GetName: string;
begin
  Result := 'FileType';
end;

class procedure TTestFileType.TestAll;
begin
  OK('file', TTestParser.ParsesAs('file',
    'FileTypeNode' + #13#10 +
    '  FileKeywordNode: FileKeyword |file|' + #13#10 +
    '  OfKeywordNode: (none)' + #13#10 +
    '  TypeNode: (none)', RTFileType));

  OK('file of Integer', TTestParser.ParsesAs('file of Integer',
    'FileTypeNode' + #13#10 +
    '  FileKeywordNode: FileKeyword |file|' + #13#10 +
    '  OfKeywordNode: OfKeyword |of|' + #13#10 +
    '  TypeNode: Identifier |Integer|', RTFileType));

  OK('file of Foo.Bar', TTestParser.ParsesAs('file of Foo.Bar',
    'FileTypeNode' + #13#10 +
    '  FileKeywordNode: FileKeyword |file|' + #13#10 +
    '  OfKeywordNode: OfKeyword |of|' + #13#10 +
    '  TypeNode: BinaryOperationNode' + #13#10 +
    '    LeftNode: Identifier |Foo|' + #13#10 +
    '    OperatorNode: Dot |.|' + #13#10 +
    '    RightNode: Identifier |Bar|', RTFileType));

end;
{$ELSE}

procedure TTestFileType.TestFileType;
begin
  OK('file', TTestParser.ParsesAs('file',
    'FileTypeNode' + #13#10 +
    '  FileKeywordNode: FileKeyword |file|' + #13#10 +
    '  OfKeywordNode: (none)' + #13#10 +
    '  TypeNode: (none)', RTFileType));

  OK('file of Integer', TTestParser.ParsesAs('file of Integer',
    'FileTypeNode' + #13#10 +
    '  FileKeywordNode: FileKeyword |file|' + #13#10 +
    '  OfKeywordNode: OfKeyword |of|' + #13#10 +
    '  TypeNode: Identifier |Integer|', RTFileType));

  OK('file of Foo.Bar', TTestParser.ParsesAs('file of Foo.Bar',
    'FileTypeNode' + #13#10 +
    '  FileKeywordNode: FileKeyword |file|' + #13#10 +
    '  OfKeywordNode: OfKeyword |of|' + #13#10 +
    '  TypeNode: BinaryOperationNode' + #13#10 +
    '    LeftNode: Identifier |Foo|' + #13#10 +
    '    OperatorNode: Dot |.|' + #13#10 +
    '    RightNode: Identifier |Bar|', RTFileType));

end;

initialization
  RegisterTest(TTestFileType.Suite);
{$ENDIF}
end.
