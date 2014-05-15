unit UTestExceptionItem;

interface

uses
  UTest;

type
  TTestExceptionItem = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestExceptionItem;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestExceptionItem }
{$IF NOT DEFINED(DUNIT)}
class function TTestExceptionItem.GetName: string;
begin
  Result := 'ExceptionItem';
end;

class procedure TTestExceptionItem.TestAll;
begin
  OK('on Exception do', TTestParser.ParsesAs('on Exception do',
    'ExceptionItemNode' + #13#10 +
    '  OnSemikeywordNode: OnSemikeyword |on|' + #13#10 +
    '  NameNode: (none)' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  TypeNode: Identifier |Exception|' + #13#10 +
    '  DoKeywordNode: DoKeyword |do|' + #13#10 +
    '  StatementNode: (none)' + #13#10 +
    '  SemicolonNode: (none)', RTExceptionItem));

  OK('on E: Exception do', TTestParser.ParsesAs('on E: Exception do',
    'ExceptionItemNode' + #13#10 +
    '  OnSemikeywordNode: OnSemikeyword |on|' + #13#10 +
    '  NameNode: Identifier |E|' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  TypeNode: Identifier |Exception|' + #13#10 +
    '  DoKeywordNode: DoKeyword |do|' + #13#10 +
    '  StatementNode: (none)' + #13#10 +
    '  SemicolonNode: (none)', RTExceptionItem));

  OK('on Exception do Foo', TTestParser.ParsesAs('on Exception do Foo',
    'ExceptionItemNode' + #13#10 +
    '  OnSemikeywordNode: OnSemikeyword |on|' + #13#10 +
    '  NameNode: (none)' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  TypeNode: Identifier |Exception|' + #13#10 +
    '  DoKeywordNode: DoKeyword |do|' + #13#10 +
    '  StatementNode: Identifier |Foo|' + #13#10 +
    '  SemicolonNode: (none)', RTExceptionItem));

  OK('on Exception do;', TTestParser.ParsesAs('on Exception do;',
    'ExceptionItemNode' + #13#10 +
    '  OnSemikeywordNode: OnSemikeyword |on|' + #13#10 +
    '  NameNode: (none)' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  TypeNode: Identifier |Exception|' + #13#10 +
    '  DoKeywordNode: DoKeyword |do|' + #13#10 +
    '  StatementNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTExceptionItem));
end;
{$ELSE}

procedure TTestExceptionItem.TestExceptionItem;
begin
  OK('on Exception do', TTestParser.ParsesAs('on Exception do',
    'ExceptionItemNode' + #13#10 +
    '  OnSemikeywordNode: OnSemikeyword |on|' + #13#10 +
    '  NameNode: (none)' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  TypeNode: Identifier |Exception|' + #13#10 +
    '  DoKeywordNode: DoKeyword |do|' + #13#10 +
    '  StatementNode: (none)' + #13#10 +
    '  SemicolonNode: (none)', RTExceptionItem));

  OK('on E: Exception do', TTestParser.ParsesAs('on E: Exception do',
    'ExceptionItemNode' + #13#10 +
    '  OnSemikeywordNode: OnSemikeyword |on|' + #13#10 +
    '  NameNode: Identifier |E|' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  TypeNode: Identifier |Exception|' + #13#10 +
    '  DoKeywordNode: DoKeyword |do|' + #13#10 +
    '  StatementNode: (none)' + #13#10 +
    '  SemicolonNode: (none)', RTExceptionItem));

  OK('on Exception do Foo', TTestParser.ParsesAs('on Exception do Foo',
    'ExceptionItemNode' + #13#10 +
    '  OnSemikeywordNode: OnSemikeyword |on|' + #13#10 +
    '  NameNode: (none)' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  TypeNode: Identifier |Exception|' + #13#10 +
    '  DoKeywordNode: DoKeyword |do|' + #13#10 +
    '  StatementNode: Identifier |Foo|' + #13#10 +
    '  SemicolonNode: (none)', RTExceptionItem));

  OK('on Exception do;', TTestParser.ParsesAs('on Exception do;',
    'ExceptionItemNode' + #13#10 +
    '  OnSemikeywordNode: OnSemikeyword |on|' + #13#10 +
    '  NameNode: (none)' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  TypeNode: Identifier |Exception|' + #13#10 +
    '  DoKeywordNode: DoKeyword |do|' + #13#10 +
    '  StatementNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTExceptionItem));
end;

initialization
  RegisterTest(TTestExceptionItem.Suite);
{$ENDIF}
end.
