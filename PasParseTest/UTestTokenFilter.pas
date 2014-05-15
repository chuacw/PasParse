unit UTestTokenFilter;

interface

uses
  UTest, UCompilerDefines, UMemoryFileLoader;

type
  TTestTokenFilter = class(TTest)
  private
    class var FCompilerDefines: TCompilerDefines;
    class var FFileLoader: TMemoryFileLoader;

    class function LexesAndFiltersAs(ASource: string;
      AExpectedTokens: array of string): Boolean;

  protected
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestTokenFilter;
    procedure TestTokenFilterInclude;
{$ENDIF}
  end;

implementation

uses
  ULexScanner, UToken, UTokenFilter, ULexException, System.Generics.Collections{$IF DEFINED(DUNIT)},
  TestFramework{$ENDIF};

{ TTestTokenFilter }
class function TTestTokenFilter.LexesAndFiltersAs(ASource: string;
  AExpectedTokens: array of string): Boolean;
var
  ALexScanner: TLexScanner;
  ATokens, AFilteredTokens: TObjectList<TToken>;
  ATokenFilter: TTokenFilter;
  AToken: TToken;
  I: Integer;
begin
  ATokenFilter := nil;
  ALexScanner := TLexScanner.Create(ASource, '');
  try
    ATokens := ALexScanner.Tokens;

    ATokenFilter := TTokenFilter.Create(ATokens, FCompilerDefines, FFileLoader);
    try
      AFilteredTokens := ATokenFilter.Tokens;
    finally
      ATokens.Free;
    end;

    Result := (AFilteredTokens.Count = Length(AExpectedTokens));
    if Result then
    begin
      try
        for I := 0 to AFilteredTokens.Count - 1 do
        begin
          AToken := AFilteredTokens[I];
          Result := (AToken <> nil) and (AToken.Inspect = AExpectedTokens[I]);
        end;
      finally
        AFilteredTokens.Free;
      end;
    end;
  finally
    ATokenFilter.Free;
    ALexScanner.Free;
  end;
end;

{$IF NOT DEFINED(DUNIT)}
class function TTestTokenFilter.GetName: string;
begin
  Result := 'TokenFilter';
end;

class procedure TTestTokenFilter.TestAll;
begin
  FFileLoader := TMemoryFileLoader.Create;

  FCompilerDefines := TCompilerDefines.Create;
  FCompilerDefines.DefineSymbol('TRUE');
  FCompilerDefines.UndefineSymbol('FALSE');
  FCompilerDefines.DefineDirectiveAsTrue('IF True');
  FCompilerDefines.DefineDirectiveAsFalse('IF False');

  try
  OK('PassThrough', LexesAndFiltersAs('Foo', ['Identifier |Foo|']));
  OK('SingleLineCommentIsIgnored', LexesAndFiltersAs('// Foo', []));
  OK('CurlyBraceCommentIsIgnored', LexesAndFiltersAs('{ Foo }', []));
  OK('ParenStarCommentIsIgnored', LexesAndFiltersAs('(* Foo *)', []));

  OK('SingleLetterCompilerDirectivesAreIgnored',
    LexesAndFiltersAs('{$R+}', []));
  OK('SingleLetterCompilerDirectivesAreIgnored',
    LexesAndFiltersAs('{$A8}', []));

  OK('CPlusPlusBuilderCompilerDirectivesAreIgnored',
    LexesAndFiltersAs('{$EXTERNALSYM Foo}', []));
  OK('CPlusPlusBuilderCompilerDirectivesAreIgnored',
    LexesAndFiltersAs('{$HPPEMIT ''#pragma Foo''}', []));
  OK('CPlusPlusBuilderCompilerDirectivesAreIgnored',
    LexesAndFiltersAs('{$NODEFINE Foo}', []));
  OK('CPlusPlusBuilderCompilerDirectivesAreIgnored',
    LexesAndFiltersAs('{$NOINCLUDE Foo}', []));

  OK('IfDefTrue',
    LexesAndFiltersAs('0{$IFDEF TRUE}1{$ENDIF}2', [
      'Number |0|',
      'Number |1|',
      'Number |2|']));

  OK('IfDefFalse',
    LexesAndFiltersAs('0{$IFDEF FALSE}1{$ENDIF}2', [
      'Number |0|',
      'Number |2|']));

  OK('IfDefTrueTrue',
    LexesAndFiltersAs('0{$IFDEF TRUE}1{$IFDEF TRUE}2{$ENDIF}3{$ENDIF}4', [
      'Number |0|',
      'Number |1|',
      'Number |2|',
      'Number |3|',
      'Number |4|']));

  OK('IfDefTrueFalse',
    LexesAndFiltersAs('0{$IFDEF TRUE}1{$IFDEF FALSE}2{$ENDIF}3{$ENDIF}4', [
      'Number |0|',
      'Number |1|',
      'Number |3|',
      'Number |4|']));

  OK('IfDefFalseTrue',
    LexesAndFiltersAs('0{$IFDEF FALSE}1{$IFDEF TRUE}2{$ENDIF}3{$ENDIF}4', [
      'Number |0|',
      'Number |4|']));

  OK('IfDefFalseFalse',
    LexesAndFiltersAs('0{$IFDEF FALSE}1{$IFDEF FALSE}2{$ENDIF}3{$ENDIF}4', [
      'Number |0|',
      'Number |4|']));

  OK('IfDefFalseUnknown',
    LexesAndFiltersAs('0{$IFDEF FALSE}1{$IFDEF UNKNOWN}2{$ENDIF}3{$ENDIF}4', [
      'Number |0|',
      'Number |4|']));

  OK('IfEnd',
    LexesAndFiltersAs('0{$IF False}1{$IFEND}2', [
      'Number |0|',
      'Number |2|']));

  OK('IfDefTrueWithElse',
    LexesAndFiltersAs('0{$IFDEF TRUE}1{$ELSE}2{$ENDIF}3', [
      'Number |0|',
      'Number |1|',
      'Number |3|']));

  OK('IfDefFalseWithElse',
    LexesAndFiltersAs('0{$IFDEF FALSE}1{$ELSE}2{$ENDIF}3', [
      'Number |0|',
      'Number |2|',
      'Number |3|']));

  OK('IfDefTrueTrueWithElses',
    LexesAndFiltersAs('0{$IFDEF TRUE}1{$IFDEF TRUE}2{$ELSE}3{$ENDIF}4{$ELSE}5{$ENDIF}6', [
      'Number |0|',
      'Number |1|',
      'Number |2|',
      'Number |4|',
      'Number |6|']));

  OK('IfDefTrueFalseWithElses',
    LexesAndFiltersAs('0{$IFDEF TRUE}1{$IFDEF FALSE}2{$ELSE}3{$ENDIF}4{$ELSE}5{$ENDIF}6', [
      'Number |0|',
      'Number |1|',
      'Number |3|',
      'Number |4|',
      'Number |6|']));

  OK('IfDefFalseTrueWithElses',
    LexesAndFiltersAs('0{$IFDEF FALSE}1{$IFDEF TRUE}2{$ELSE}3{$ENDIF}4{$ELSE}5{$ENDIF}6', [
      'Number |0|',
      'Number |5|',
      'Number |6|']));

  OK('IfDefFalseFalseWithElses',
    LexesAndFiltersAs('0{$IFDEF FALSE}1{$IFDEF FALSE}2{$ELSE}3{$ENDIF}4{$ELSE}5{$ENDIF}6', [
      'Number |0|',
      'Number |5|',
      'Number |6|']));

  OK('IfTrueElseIfTrue',
    LexesAndFiltersAs('0{$IF True}1{$ELSEIF True}2{$ELSE}3{$IFEND}4', [
      'Number |0|',
      'Number |1|',
      'Number |4|']));

  OK('IfTrueElseIfFalse',
    LexesAndFiltersAs('0{$IF True}1{$ELSEIF False}2{$ELSE}3{$IFEND}4', [
      'Number |0|',
      'Number |1|',
      'Number |4|']));

  OK('IfFalseElseIfTrue',
    LexesAndFiltersAs('0{$IF False}1{$ELSEIF True}2{$ELSE}3{$IFEND}4', [
      'Number |0|',
      'Number |2|',
      'Number |4|']));

  OK('IfFalseElseIfFalse',
    LexesAndFiltersAs('0{$IF False}1{$ELSEIF False}2{$ELSE}3{$IFEND}4', [
      'Number |0|',
      'Number |3|',
      'Number |4|']));

  OK('IPlusIsNotTreatedAsInclude',
    LexesAndFiltersAs('{$I+}', []));
  OK('IMinusIsNotTreatedAsInclude',
    LexesAndFiltersAs('{$I-}', []));

  FFileLoader['bar.inc'] := 'Bar';
  OK('Include',
    LexesAndFiltersAs('Foo {$INCLUDE bar.inc} Baz', [
      'Identifier |Foo|',
      'Identifier |Bar|',
      'Identifier |Baz|']));

  OK('I',
    LexesAndFiltersAs('Foo {$I bar.inc} Baz', [
      'Identifier |Foo|',
      'Identifier |Bar|',
      'Identifier |Baz|']));

  FCompilerDefines.UndefineSymbol('FOO');
  OK('Define', LexesAndFiltersAs('{$DEFINE FOO} {$IFDEF FOO} Foo {$ENDIF}',
    ['Identifier |Foo|']));

  FCompilerDefines.DefineSymbol('FOO');
  OK('Undefine', LexesAndFiltersAs('{$UNDEF FOO} {$IFDEF FOO} Foo {$ENDIF}', []));

  FCompilerDefines.UndefineSymbol('FOO');
  FFileLoader['defines.inc'] := '{$DEFINE FOO}';
  OK('DefineScopeDoesBubbleUpFromIncludeFiles',
    LexesAndFiltersAs('{$I defines.inc} {$IFDEF FOO} Foo {$ENDIF}', [
      'Identifier |Foo|']));

  FCompilerDefines.UndefineSymbol('FOO');
  OK('DefineIgnoredInFalseIf',
    LexesAndFiltersAs('{$IF False}{$DEFINE FOO}{$IFEND} {$IFDEF FOO}Foo{$ENDIF}', []));

  FCompilerDefines.DefineSymbol('FOO');
  OK('UndefineIgnoredInFalseIf',
    LexesAndFiltersAs('{$IF False}{$UNDEF FOO}{$IFEND} {$IFDEF FOO}Foo{$ENDIF}',
    ['Identifier |Foo|']));

  try
    LexesAndFiltersAs('{$FOO}', []);
    OK(False, 'ThrowOnUnrecognizedDirective');
  except
    on ETestException do;
    on ELexException do
      OK(True, 'ThrowOnUnrecognizedDirective');
  else
    OK(False, 'ThrowOnUnrecognizedDirective');
  end;

  OK('UnrecognizedIsIgnoredInFalseIf',
    LexesAndFiltersAs('{$IF False}{$FOO}{$IFEND}', []));

  finally
    FCompilerDefines.Free;
    FFileLoader.Free;
  end;
end;
{$ELSE}

procedure TTestTokenFilter.TestTokenFilterInclude;
begin
  FFileLoader['bar.inc'] := 'Bar';
  OK('Include',
    LexesAndFiltersAs('Foo {$INCLUDE bar.inc} Baz', [
      'Identifier |Foo|',
      'Identifier |Bar|',
      'Identifier |Baz|']));

  OK('I',
    LexesAndFiltersAs('Foo {$I bar.inc} Baz', [
      'Identifier |Foo|',
      'Identifier |Bar|',
      'Identifier |Baz|']));

end;

procedure TTestTokenFilter.TestTokenFilter;
begin
  FCompilerDefines.DefineSymbol('TRUE');
  FCompilerDefines.UndefineSymbol('FALSE');
  FCompilerDefines.DefineDirectiveAsTrue('IF True');
  FCompilerDefines.DefineDirectiveAsFalse('IF False');

  OK('PassThrough', LexesAndFiltersAs('Foo', ['Identifier |Foo|']));
  OK('SingleLineCommentIsIgnored', LexesAndFiltersAs('// Foo', []));
  OK('CurlyBraceCommentIsIgnored', LexesAndFiltersAs('{ Foo }', []));
  OK('ParenStarCommentIsIgnored', LexesAndFiltersAs('(* Foo *)', []));

  OK('SingleLetterCompilerDirectivesAreIgnored',
    LexesAndFiltersAs('{$R+}', []));
  OK('SingleLetterCompilerDirectivesAreIgnored',
    LexesAndFiltersAs('{$A8}', []));

  OK('CPlusPlusBuilderCompilerDirectivesAreIgnored',
    LexesAndFiltersAs('{$EXTERNALSYM Foo}', []));
  OK('CPlusPlusBuilderCompilerDirectivesAreIgnored',
    LexesAndFiltersAs('{$HPPEMIT ''#pragma Foo''}', []));
  OK('CPlusPlusBuilderCompilerDirectivesAreIgnored',
    LexesAndFiltersAs('{$NODEFINE Foo}', []));
  OK('CPlusPlusBuilderCompilerDirectivesAreIgnored',
    LexesAndFiltersAs('{$NOINCLUDE Foo}', []));

  OK('IfDefTrue',
    LexesAndFiltersAs('0{$IFDEF TRUE}1{$ENDIF}2', [
      'Number |0|',
      'Number |1|',
      'Number |2|']));

  OK('IfDefFalse',
    LexesAndFiltersAs('0{$IFDEF FALSE}1{$ENDIF}2', [
      'Number |0|',
      'Number |2|']));

  OK('IfDefTrueTrue',
    LexesAndFiltersAs('0{$IFDEF TRUE}1{$IFDEF TRUE}2{$ENDIF}3{$ENDIF}4', [
      'Number |0|',
      'Number |1|',
      'Number |2|',
      'Number |3|',
      'Number |4|']));

  OK('IfDefTrueFalse',
    LexesAndFiltersAs('0{$IFDEF TRUE}1{$IFDEF FALSE}2{$ENDIF}3{$ENDIF}4', [
      'Number |0|',
      'Number |1|',
      'Number |3|',
      'Number |4|']));

  OK('IfDefFalseTrue',
    LexesAndFiltersAs('0{$IFDEF FALSE}1{$IFDEF TRUE}2{$ENDIF}3{$ENDIF}4', [
      'Number |0|',
      'Number |4|']));

  OK('IfDefFalseFalse',
    LexesAndFiltersAs('0{$IFDEF FALSE}1{$IFDEF FALSE}2{$ENDIF}3{$ENDIF}4', [
      'Number |0|',
      'Number |4|']));

  OK('IfDefFalseUnknown',
    LexesAndFiltersAs('0{$IFDEF FALSE}1{$IFDEF UNKNOWN}2{$ENDIF}3{$ENDIF}4', [
      'Number |0|',
      'Number |4|']));

  OK('IfEnd',
    LexesAndFiltersAs('0{$IF False}1{$IFEND}2', [
      'Number |0|',
      'Number |2|']));

  OK('IfDefTrueWithElse',
    LexesAndFiltersAs('0{$IFDEF TRUE}1{$ELSE}2{$ENDIF}3', [
      'Number |0|',
      'Number |1|',
      'Number |3|']));

  OK('IfDefFalseWithElse',
    LexesAndFiltersAs('0{$IFDEF FALSE}1{$ELSE}2{$ENDIF}3', [
      'Number |0|',
      'Number |2|',
      'Number |3|']));

  OK('IfDefTrueTrueWithElses',
    LexesAndFiltersAs('0{$IFDEF TRUE}1{$IFDEF TRUE}2{$ELSE}3{$ENDIF}4{$ELSE}5{$ENDIF}6', [
      'Number |0|',
      'Number |1|',
      'Number |2|',
      'Number |4|',
      'Number |6|']));

  OK('IfDefTrueFalseWithElses',
    LexesAndFiltersAs('0{$IFDEF TRUE}1{$IFDEF FALSE}2{$ELSE}3{$ENDIF}4{$ELSE}5{$ENDIF}6', [
      'Number |0|',
      'Number |1|',
      'Number |3|',
      'Number |4|',
      'Number |6|']));

  OK('IfDefFalseTrueWithElses',
    LexesAndFiltersAs('0{$IFDEF FALSE}1{$IFDEF TRUE}2{$ELSE}3{$ENDIF}4{$ELSE}5{$ENDIF}6', [
      'Number |0|',
      'Number |5|',
      'Number |6|']));

  OK('IfDefFalseFalseWithElses',
    LexesAndFiltersAs('0{$IFDEF FALSE}1{$IFDEF FALSE}2{$ELSE}3{$ENDIF}4{$ELSE}5{$ENDIF}6', [
      'Number |0|',
      'Number |5|',
      'Number |6|']));

  OK('IfTrueElseIfTrue',
    LexesAndFiltersAs('0{$IF True}1{$ELSEIF True}2{$ELSE}3{$IFEND}4', [
      'Number |0|',
      'Number |1|',
      'Number |4|']));

  OK('IfTrueElseIfFalse',
    LexesAndFiltersAs('0{$IF True}1{$ELSEIF False}2{$ELSE}3{$IFEND}4', [
      'Number |0|',
      'Number |1|',
      'Number |4|']));

  OK('IfFalseElseIfTrue',
    LexesAndFiltersAs('0{$IF False}1{$ELSEIF True}2{$ELSE}3{$IFEND}4', [
      'Number |0|',
      'Number |2|',
      'Number |4|']));

  OK('IfFalseElseIfFalse',
    LexesAndFiltersAs('0{$IF False}1{$ELSEIF False}2{$ELSE}3{$IFEND}4', [
      'Number |0|',
      'Number |3|',
      'Number |4|']));

  OK('IPlusIsNotTreatedAsInclude',
    LexesAndFiltersAs('{$I+}', []));
  OK('IMinusIsNotTreatedAsInclude',
    LexesAndFiltersAs('{$I-}', []));



  FCompilerDefines.UndefineSymbol('FOO');
  OK('Define', LexesAndFiltersAs('{$DEFINE FOO} {$IFDEF FOO} Foo {$ENDIF}',
    ['Identifier |Foo|']));

  FCompilerDefines.DefineSymbol('FOO');
  OK('Undefine', LexesAndFiltersAs('{$UNDEF FOO} {$IFDEF FOO} Foo {$ENDIF}', []));

  FCompilerDefines.UndefineSymbol('FOO');
  FFileLoader['defines.inc'] := '{$DEFINE FOO}';
  OK('DefineScopeDoesBubbleUpFromIncludeFiles',
    LexesAndFiltersAs('{$I defines.inc} {$IFDEF FOO} Foo {$ENDIF}', [
      'Identifier |Foo|']));

  FCompilerDefines.UndefineSymbol('FOO');
  OK('DefineIgnoredInFalseIf',
    LexesAndFiltersAs('{$IF False}{$DEFINE FOO}{$IFEND} {$IFDEF FOO}Foo{$ENDIF}', []));

  FCompilerDefines.DefineSymbol('FOO');
  OK('UndefineIgnoredInFalseIf',
    LexesAndFiltersAs('{$IF False}{$UNDEF FOO}{$IFEND} {$IFDEF FOO}Foo{$ENDIF}',
    ['Identifier |Foo|']));

  try
    LexesAndFiltersAs('{$FOO}', []);
    OK(False, 'ThrowOnUnrecognizedDirective');
  except
    on ETestException do;
    on ELexException do
      OK(True, 'ThrowOnUnrecognizedDirective');
  else
    OK(False, 'ThrowOnUnrecognizedDirective');
  end;

  OK('UnrecognizedIsIgnoredInFalseIf',
    LexesAndFiltersAs('{$IF False}{$FOO}{$IFEND}', []));
end;

procedure TTestTokenFilter.TearDown;
begin
  FCompilerDefines.Free;
  FFileLoader.Free;
end;

procedure TTestTokenFilter.SetUp;
begin
  FFileLoader := TMemoryFileLoader.Create;
  FCompilerDefines := TCompilerDefines.Create;
end;

initialization
  RegisterTest(TTestTokenFilter.Suite);
{$ENDIF}
end.

