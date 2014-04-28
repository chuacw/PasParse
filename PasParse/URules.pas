unit URules;
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}
{$WEAKLINKRTTI ON}
interface

uses
  URule, UASTNode, UIParser, URuleType, UAlternator;

type
  TAnonymousTypeRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;

  TArrayTypeRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TAssemblerStatementRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TAssemblyAttributeRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TAtomRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TBareInheritedRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TBlockRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TCaseSelectorRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TCaseStatementRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TClassHelperTypeRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TClassOfTypeRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TClassTypeRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TConstantDeclRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;

  TConstraintRule = class(TRule)
  private
    FAlternator: TAlternator;

  public
    constructor Create(AParser: IParser; ARuleType: TRuleType); override;
    destructor Destroy; override;

    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;

  TConstSectionRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TDirectiveRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TEnumeratedTypeRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TEnumeratedTypeElementRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TExceptionItemRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TExportsItemRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TExportsSpecifierRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TExportsStatementRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TExpressionRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TExpressionListRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TExpressionOrAssignmentRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TExpressionOrRangeRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TExpressionOrRangeListRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TExtendedIdentRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TFactorRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TFancyBlockRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TFieldDeclRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TFieldSectionRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TFileTypeRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TForStatementRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TGoalRule = class(TRule)
    FAlternator: TAlternator;

  public
    constructor Create(AParser: IParser; ARuleType: TRuleType); override;
    destructor Destroy; override;

    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TGotoStatementRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TIdentRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TIdentListRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TIfStatementRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TImplementationDeclRule = class(TRule)
    FAlternator: TAlternator;

  public
    constructor Create(AParser: IParser; ARuleType: TRuleType); override;
    destructor Destroy; override;

    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;

  TImplementationSectionRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;

  TInitSectionRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TInterfaceDeclRule = class(TRule)
  private
    FAlternator: TAlternator;

  public
    constructor Create(AParser: IParser; ARuleType: TRuleType); override;
    destructor Destroy; override;

    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TInterfaceSectionRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TInterfaceTypeRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TLabelDeclSectionRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TLabelIdRule = class(TRule)
  private
    FAlternator: TAlternator;

  public
    constructor Create(AParser: IParser; ARuleType: TRuleType); override;
    destructor Destroy; override;

    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TMethodHeadingRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TMethodImplementationRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TMethodOrPropertyRule = class(TRule)
  private
    FAlternator: TAlternator;

  public
    constructor Create(AParser: IParser; ARuleType: TRuleType); override;
    destructor Destroy; override;

    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TMethodReturnTypeRule = class(TRule)
  private
    FAlternator: TAlternator;

  public
    constructor Create(AParser: IParser; ARuleType: TRuleType); override;
    destructor Destroy; override;

    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TOpenArrayRule = class(TRule)
  private
    FAlternator: TAlternator;

  public
    constructor Create(AParser: IParser; ARuleType: TRuleType); override;
    destructor Destroy; override;

    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;

  TOpenArrayConstructorRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;

  TPackageRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TPackedTypeRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TParameterRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TParameterExpressionRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TParameterTypeRule = class(TRule)
  private
    FAlternator: TAlternator;

  public
    constructor Create(AParser: IParser; ARuleType: TRuleType); override;
    destructor Destroy; override;

    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TParenthesizedExpressionRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TParticleRule = class(TRule)
  private
    FAlternator: TAlternator;

  public
    constructor Create(AParser: IParser; ARuleType: TRuleType); override;
    destructor Destroy; override;

    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TPointerTypeRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TPortabilityDirectiveRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;

  TProcedureTypeRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TProgramRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TPropertyRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TPropertyDirectiveRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TQualifiedIdentRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;

  TRaiseStatementRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TRecordFieldConstantRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TRecordHelperTypeRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TRecordTypeRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TRepeatStatementRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TRequiresClauseRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TSetLiteralRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TSetTypeRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TSimpleExpressionRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TSimpleStatementRule = class(TRule)
  private
    FAlternator: TAlternator;

  public
    constructor Create(AParser: IParser; ARuleType: TRuleType); override;
    destructor Destroy; override;

    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TStatementRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TStatementListRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TStringTypeRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TTermRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TTryStatementRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TTypeRule = class(TRule)
  private
    FAlternator: TAlternator;

  public
    constructor Create(AParser: IParser; ARuleType: TRuleType); override;
    destructor Destroy; override;

    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;

  TTypedConstantRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TTypeDeclRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TTypeParamRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;

  TTypeParamDeclRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;

  TTypeParamsRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;

  TTypeRecordDirectivesRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;

  TTypeSectionRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TUnitRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TUsedUnitRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TUsesClauseRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TVarDeclRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TVariantGroupRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TVariantSectionRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TVarSectionRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TVisibilityRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TVisibilitySectionRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;

  TVisibilitySectionContentRule = class(TRule)
  private
    FAlternator: TAlternator;

  public
    constructor Create(AParser: IParser; ARuleType: TRuleType); override;
    destructor Destroy; override;

    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TWhileStatementRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;

  TWithStatementRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;


implementation

uses
  UTokenType, UToken, UListNode, UGeneratedNodes, UTokenSets, UParseException,
  UDelimitedItemNode, UTokenSet, System.Generics.Collections, UIFrame, System.SysUtils;


function TAnonymousTypeRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTReferenceSemikeyword);
end;

function TAnonymousTypeRule.Evaluate: TASTNode;
var
  AReference, ATo: TToken;
  AAnonymousMethod: TASTNode;
begin
  AReference := nil; ATo := nil; AAnonymousMethod := nil;
  try
    AReference := FParser.ParseToken(TTReferenceSemikeyword);
    ATo        := FParser.ParseToken(TTToKeyword);
    AAnonymousMethod := FParser.ParseRuleInternal(RTProcedureType);
    Result := TAnonymousMethodTypeNode.Create(AReference, ATo, AAnonymousMethod);
  except
    FreeAndNil(AAnonymousMethod);
    FreeAndNil(ATo);
    FreeAndNil(AReference);
    raise;
  end;
end;

{ TArrayTypeRule }

function TArrayTypeRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTArrayKeyword);
end;

function TArrayTypeRule.Evaluate: TASTNode;
var
  AArray: TToken;
  AOpenBracket, ACloseBracket: TToken;
  AIndexList: TListNode;
  AOf: TToken;
  AType: TASTNode;
begin
  // array[1..7, 1..24] of Real

  AArray := FParser.ParseToken(TTArrayKeyword);
  AOpenBracket := nil; AIndexList := nil;
  ACloseBracket := nil; AOf := nil; AType := nil;

  try

    if FParser.CanParseToken(TTOpenBracket) then
    begin
      AOpenBracket := FParser.ParseToken(TTOpenBracket);
      AIndexList := FParser.ParseDelimitedList(RTType, TTComma);
      ACloseBracket := FParser.ParseToken(TTCloseBracket);
    end
    else
      AIndexList := FParser.CreateEmptyListNode;

    AOf := FParser.ParseToken(TTOfKeyword);
    AType := FParser.ParseRuleInternal(RTType);

    Result := TArrayTypeNode.Create(AArray, AOpenBracket, AIndexList,
      ACloseBracket, AOf, AType);
  except
    FreeAndNil(AType);
    FreeAndNil(AOf);
    FreeAndNil(ACloseBracket);
    FreeAndNil(AIndexList);
    FreeAndNil(AOpenBracket);
    raise;
  end;
end;

{ TAssemblerStatementRule }

function TAssemblerStatementRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTAsmKeyword);
end;

function TAssemblerStatementRule.Evaluate: TASTNode;
var
  AASM, AEnd: TToken;
begin
  // asm ... end
  AEnd := nil;
  AASM := FParser.ParseToken(TTAsmKeyword);
  try
    while not FParser.CanParseToken(TTEndKeyword) do
      try
        FParser.MoveNext;
      except
        FreeAndNil(AASM);
        raise;
      end;

    AEnd := FParser.ParseToken(TTEndKeyword);
    Result := TAssemblerStatementNode.Create(AASM, AEnd);
  except
    FreeAndNil(AEnd);
    FreeAndNil(AASM);
    raise;
  end;
end;

{ TAssemblyAttributeRule }

function TAssemblyAttributeRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTOpenBracket);
end;

function TAssemblyAttributeRule.Evaluate: TASTNode;
var
  AOpen, AScope, AColon, AClose: TToken;
  AValue: TASTNode;
begin
  AOpen := FParser.ParseToken(TTOpenBracket);
  AScope := nil; AColon := nil; AClose := nil; AValue := nil;
  try
    AScope := FParser.ParseToken(TTAssemblySemikeyword);
    AColon := FParser.ParseToken(TTColon);
    AValue := FParser.ParseRuleInternal(RTExpression);
    AClose := FParser.ParseToken(TTCloseBracket);
    Result := TAttributeNode.Create(AOpen, AScope, AColon, AValue, AClose);
  except
    FreeAndNil(AClose);
    FreeAndNil(AValue);
    FreeAndNil(AColon);
    FreeAndNil(AScope);
    FreeAndNil(AOpen);
    raise;
  end;
end;

{ TAtomRule }

function TAtomRule.CanParse: Boolean;
begin
  Result := FParser.CanParseRule(RTParticle);
end;

function TAtomRule.Evaluate: TASTNode;
var
  ADot: TToken;
  ARight: TASTNode;
  ACaret: TToken;
  AOpenDelimiter, ACloseDelimiter: TToken;
  AParameterList: TListNode;
begin
  ADot := nil; ARight := nil; ACaret := nil;
  AOpenDelimiter := nil; ACloseDelimiter := nil;
  AParameterList := nil; Result := nil;
  try
    Result := FParser.ParseRuleInternal(RTParticle);
    while True do
    begin
      if FParser.CanParseToken(TTDot) then
      begin
        ADot := FParser.ParseToken(TTDot);
        ARight := FParser.ParseRuleInternal(RTExtendedIdent);
        Result := TBinaryOperationNode.Create(Result, ADot, ARight);
      end
      else if FParser.CanParseToken(TTCaret) then
      begin
        ACaret := FParser.ParseToken(TTCaret);
        Result := TPointerDereferenceNode.Create(Result, ACaret);
      end
      else if FParser.CanParseToken(TTOpenBracket) then
      begin
        AOpenDelimiter := FParser.ParseToken(TTOpenBracket);
        try
          AParameterList := FParser.ParseRuleInternal(RTExpressionList) as TListNode;
        except
          FreeAndNil(AOpenDelimiter);
          FreeAndNil(Result);
          raise;
        end;
        ACloseDelimiter := FParser.ParseToken(TTCloseBracket);
        Result := TParameterizedNode.Create(Result, AOpenDelimiter,
          AParameterList, ACloseDelimiter);
      end
      else if FParser.CanParseToken(TTOpenParenthesis) then
      begin
        AOpenDelimiter := FParser.ParseToken(TTOpenParenthesis);
        if FParser.CanParseRule(RTExpressionList) then
          AParameterList :=
            FParser.ParseDelimitedList(RTParameterExpression, TTComma)
        else
          AParameterList := FParser.CreateEmptyListNode;

        ACloseDelimiter := FParser.ParseToken(TTCloseParenthesis);
        Result := TParameterizedNode.Create(Result, AOpenDelimiter,
          AParameterList, ACloseDelimiter);
      end
      else
        Break;
    end;
  except
    FreeAndNil(ADot);
    FreeAndNil(ARight);
    FreeAndNil(ACaret);
    FreeAndNil(AOpenDelimiter);
    FreeAndNil(AParameterList);
    FreeAndNil(ACloseDelimiter);
    raise;
  end;
end;

{ TBareInheritedRule }

function TBareInheritedRule.CanParse: Boolean;
begin
  Result := (FParser.Peek(0) = TTInheritedKeyword) and
    (not TTokenSets.TSExpression.Contains(FParser.Peek(1)));
end;

function TBareInheritedRule.Evaluate: TASTNode;
begin
  // inherited

  Result := FParser.ParseToken(TTInheritedKeyword);
end;

{ TBlockRule }

function TBlockRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTokenSets.TSBlock);
end;

function TBlockRule.Evaluate: TASTNode;
var
  ABegin, AEnd: TToken;
  AList: TListNode;
begin
  // asm ... end
  // begin ... end
  ABegin := nil; AEnd := nil; AList := nil;
  try
    if FParser.CanParseRule(RTAssemblerStatement) then
      Result := FParser.ParseRuleInternal(RTAssemblerStatement)
    else
    begin
      ABegin := FParser.ParseToken(TTBeginKeyword);
      AList := FParser.ParseOptionalStatementList;
      AEnd := FParser.ParseToken(TTEndKeyword);
      Result := TBlockNode.Create(ABegin, AList, AEnd);
    end;
  except
    FreeAndNil(AEnd);
    FreeAndNil(AList);
    FreeAndNil(ABegin);
    raise;
  end;
end;

{ TCaseSelectorRule }

function TCaseSelectorRule.CanParse: Boolean;
begin
  Result := FParser.CanParseRule(RTExpressionOrRangeList);
end;

function TCaseSelectorRule.Evaluate: TASTNode;
var
  AValues: TListNode;
  AColon, ASemicolon: TToken;
  AStatement: TASTNode;
begin
  AValues := nil; AColon := nil; ASemicolon := nil;
  AStatement := nil;
  try
    AValues := FParser.ParseDelimitedList(RTExpressionOrRange, TTComma);
    AColon := FParser.ParseToken(TTColon);

    if FParser.CanParseRule(RTStatement) then
      AStatement := FParser.ParseRuleInternal(RTStatement);

    if FParser.CanParseToken(TTSemicolon) then
      ASemicolon := FParser.ParseToken(TTSemicolon);

    Result := TCaseSelectorNode.Create(AValues, AColon, AStatement, ASemicolon);
  except
    FreeAndNil(ASemicolon);
    FreeAndNil(AStatement);
    FreeAndNil(AColon);
    FreeAndNil(AValues);
    raise;
  end;
end;

{ TCaseStatementRule }

function TCaseStatementRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTCaseKeyword);
end;

function TCaseStatementRule.Evaluate: TASTNode;
var
  ACase, AOf, AElse, AEnd: TToken;
  AExpression: TASTNode;
  ASelectorList, AElseStatements: TListNode;
begin
  ACase := FParser.ParseToken(TTCaseKeyword);
  AExpression := nil; AOf := nil; ASelectorList := nil;
  AElse := nil; AElseStatements := nil;
  try
    AExpression := FParser.ParseRuleInternal(RTExpression);
    AOf := FParser.ParseToken(TTOfKeyword);
    ASelectorList := FParser.ParseRequiredRuleList(RTCaseSelector);
    if FParser.CanParseToken(TTElseKeyword) then
    begin
      AElse := FParser.ParseToken(TTElseKeyword);
      AElseStatements := FParser.ParseOptionalStatementList;
    end
    else
      AElseStatements := FParser.CreateEmptyListNode;
    AEnd := FParser.ParseToken(TTEndKeyword);
    Result := TCaseStatementNode.Create(ACase, AExpression, AOf, ASelectorList,
      AElse, AElseStatements, AEnd);
  except
    FreeAndNil(AEnd);
    FreeAndNil(AElseStatements);
    FreeAndNil(AElse);
    FreeAndNil(ASelectorList);
    FreeAndNil(AOf);
    FreeAndNil(AExpression);
    FreeAndNil(ACase);
    raise;
  end;
end;

{ TClassHelperTypeRule }

function TClassHelperTypeRule.CanParse: Boolean;
begin
  Result := (FParser.Peek(0) = TTClassKeyword) and
    (FParser.Peek(1) = TTHelperSemikeyword);
end;

function TClassHelperTypeRule.Evaluate: TASTNode;
var
  ATypeKeyword, AHelper, AOpen, AClose, AFor, AEnd: TToken;
  ABaseHelper, AType: TASTNode;
  AContents: TListNode;
begin
  ATypeKeyword := FParser.ParseToken(TTClassKeyword);
  AHelper := FParser.ParseToken(TTHelperSemikeyword);

  AOpen := nil; ABaseHelper := nil; AClose := nil; AFor := nil;
  AType := nil; AContents := nil; AEnd := nil;
  try
    if FParser.CanParseToken(TTOpenParenthesis) then
    begin
      AOpen := FParser.ParseToken(TTOpenParenthesis);
      ABaseHelper := FParser.ParseRuleInternal(RTQualifiedIdent);
      AClose := FParser.ParseToken(TTCloseParenthesis);
    end;

    AFor := FParser.ParseToken(TTForKeyword);
    AType := FParser.ParseRuleInternal(RTQualifiedIdent);
    AContents := FParser.ParseOptionalRuleList(RTVisibilitySection);
    AEnd := FParser.ParseToken(TTEndKeyword);

    Result := TTypeHelperNode.Create(ATypeKeyword, AHelper, AOpen, ABaseHelper,
      AClose, AFor, AType, AContents, AEnd);
  except
    FreeAndNil(AEnd);
    FreeAndNil(AContents);
    FreeAndNil(AType);
    FreeAndNil(AFor);
    FreeAndNil(AClose);
    FreeAndNil(ABaseHelper);
    FreeAndNil(AOpen);
    FreeAndNil(AHelper);
    FreeAndNil(ATypeKeyword);
    raise;
  end;
end;

{ TClassOfTypeRule }

function TClassOfTypeRule.CanParse: Boolean;
begin
  Result := (FParser.Peek(0) = TTClassKeyword) and
    (FParser.Peek(1) = TTOfKeyword);
end;

function TClassOfTypeRule.Evaluate: TASTNode;
var
  AClass, AOf: TToken;
  AType: TASTNode;
begin
  // class of TSomething

  AClass := FParser.ParseToken(TTClassKeyword);
  AOf := FParser.ParseToken(TTOfKeyword);
  AType := nil;
  try
    AType := FParser.ParseRuleInternal(RTQualifiedIdent);
    Result := TClassOfNode.Create(AClass, AOf, AType);
  except
    FreeAndNil(AType);
    FreeAndNil(AOf);
    FreeAndNil(AClass);
    raise;
  end;
end;

{ TClassTypeRule }

function TClassTypeRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTClassKeyword);
end;

function TClassTypeRule.Evaluate: TASTNode;
var
  AClass, ADisposition, AOpen, AClose, AEnd: TToken;
  AInheritanceList, AContents: TListNode;
  ADirectivesNode: TListNode;
begin
  AClass := FParser.ParseToken(TTClassKeyword);
  ADisposition := nil; AOpen := nil; AClose := nil; AEnd := nil;
  AInheritanceList := nil; AContents := nil; ADirectivesNode := nil;
  try
    if FParser.CanParseToken(TTokenSets.TSClassDisposition) then
      ADisposition := FParser.ParseToken(TTokenSets.TSClassDisposition);

    AInheritanceList := FParser.CreateEmptyListNode;

    if FParser.CanParseToken(TTOpenParenthesis) then
      begin
        AOpen := FParser.ParseToken(TTOpenParenthesis);
        FreeAndNil(AInheritanceList);
        AInheritanceList := FParser.ParseDelimitedList(RTQualifiedIdent, TTComma);
        AClose := FParser.ParseToken(TTCloseParenthesis);
      end;

    AContents := FParser.CreateEmptyListNode;
    if not FParser.CanParseToken(TTSemicolon) then
      begin
        FreeAndNil(AContents);
        AContents := FParser.ParseOptionalRuleList(RTVisibilitySection);
        AEnd := FParser.ParseToken(TTEndKeyword);
      end;

    if FParser.CanParseRule(RTPortabilityDirective) then
      ; // TODO -ochuacw: Portability/hint directives

    Result := TClassTypeNode.Create(AClass, ADisposition, AOpen, AInheritanceList,
      AClose, AContents, AEnd);
  except
    FreeAndNil(AEnd);
    FreeAndNil(AContents);
    FreeAndNil(AClose);
    FreeAndNil(AInheritanceList);
    FreeAndNil(AOpen);
    FreeAndNil(ADisposition);
    FreeAndNil(AClass);
    raise;
  end;
end;

{ TConstantDeclRule }

function TConstantDeclRule.CanParse: Boolean;
begin
  Result := FParser.CanParseRule(RTIdent) and
    not FParser.CanParseRule(RTVisibility);
end;

function TConstantDeclRule.Evaluate: TASTNode;
var
  AName, AColon, AEqual, ASemicolon: TToken;
  AType, AValue: TASTNode;
  ADirectives: TListNode;
begin
  AName := FParser.ParseRuleInternal(RTIdent) as TToken;

  AColon := nil; AType := nil; AEqual := nil; AValue := nil; ADirectives := nil;
  ASemicolon := nil;
  try
    if FParser.CanParseToken(TTColon) then
    begin
      AColon := FParser.ParseToken(TTColon);
      AType := FParser.ParseRuleInternal(RTType);
    end;

    AEqual := FParser.ParseToken(TTEqualSign);
    AValue := FParser.ParseRuleInternal(RTTypedConstant);
    ADirectives := FParser.ParseOptionalRuleList(RTPortabilityDirective);
    ASemicolon := FParser.ParseToken(TTSemicolon);

    Result := TConstantDeclNode.Create(AName, AColon, AType, AEqual, AValue,
      ADirectives, ASemicolon);
  except
    FreeAndNil(ASemicolon);
    FreeAndNil(ADirectives);
    FreeAndNil(AValue);
    FreeAndNil(AEqual);
    FreeAndNil(AType);
    FreeAndNil(AColon);
    FreeAndNil(AName);
    raise;
  end;
end;

{ TConstraintRule }

function TConstraintRule.CanParse: Boolean;
begin
  Result := FAlternator.LookAhead(FParser);
end;

constructor TConstraintRule.Create(AParser: IParser; ARuleType: TRuleType);
begin
  inherited Create(AParser, ARuleType);
  FAlternator := TAlternator.Create;
  FAlternator.AddToken(TTConstructorKeyword);
  FAlternator.AddToken(TTRecordKeyword);
  FAlternator.AddToken(TTClassKeyword);
  FAlternator.AddRule(RTQualifiedIdent);
end;

destructor TConstraintRule.Destroy;
begin
  FAlternator.Free;
  inherited;
end;

function TConstraintRule.Evaluate: TASTNode;
begin
  Result := FAlternator.Execute(FParser);
end;

{ TConstSectionRule }

function TConstSectionRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTokenSets.TSConstHeader);
end;

function TConstSectionRule.Evaluate: TASTNode;
var
  AConst: TToken;
  AConstList: TListNode;
begin
  AConst := FParser.ParseToken(TTokenSets.TSConstHeader);
  
  try
    AConstList := FParser.ParseRequiredRuleList(RTConstantDecl);
  except
    FreeAndNil(AConst);
    raise
  end;

  Result := TConstSectionNode.Create(AConst, AConstList);
end;

{ TDirectiveRule }

function TDirectiveRule.CanParse: Boolean;
begin
  Result := TTokenSets.TSDirective.Contains(FParser.Peek(0)) or
    ((FParser.Peek(0) = TTSemicolon) and
    TTokenSets.TSDirective.Contains(FParser.Peek(1)));
end;

function TDirectiveRule.Evaluate: TASTNode;
var
  AParameterizedDirectives: TTokenSet;
  ASemicolon, ADirective: TToken;
  AValue, AData: TASTNode;
begin
  Result := nil;
  AParameterizedDirectives := TTokenSet.Create('''dispid'' or ''message''');
  try
    AParameterizedDirectives.Add(TTDispIdSemikeyword);
    AParameterizedDirectives.Add(TTMessageSemikeyword);

    ASemicolon := nil;
    if FParser.CanParseToken(TTSemicolon) then
      ASemicolon := FParser.ParseToken(TTSemicolon);

    AValue := nil;
    AData := FParser.CreateEmptyListNode;
    if FParser.CanParseToken(AParameterizedDirectives) then
    begin
      ADirective := FParser.ParseToken(AParameterizedDirectives);
      try
        AValue := FParser.ParseRuleInternal(RTExpression);
      except
        FreeAndNil(ASemicolon);
        FreeAndNil(AData);
        FreeAndNil(ADirective);
        raise;
      end;
    end
    else if FParser.CanParseToken(TTExternalSemikeyword) then
    begin
      ADirective := FParser.ParseToken(TTExternalSemikeyword);
      if FParser.CanParseRule(RTExpression) then
        begin
          AValue := FParser.ParseRuleInternal(RTExpression);
          FreeAndNil(AData);
          AData := FParser.ParseOptionalRuleList(RTExportsSpecifier);
        end;
    end
    else
      ADirective := FParser.ParseToken(TTokenSets.TSDirective);

    Result := TDirectiveNode.Create(ASemicolon, ADirective, AValue, AData);
  finally
    AParameterizedDirectives.Free;
  end;
end;

{ TEnumeratedTypeRule }

function TEnumeratedTypeRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTOpenParenthesis);
end;

function TEnumeratedTypeRule.Evaluate: TASTNode;
var
  AOpen, AClose: TToken;
  AItemList: TListNode;
begin
  AOpen := FParser.ParseToken(TTOpenParenthesis); AClose := nil; AItemList := nil;
  try
    AItemList := FParser.ParseDelimitedList(RTEnumeratedTypeElement, TTComma);
    AClose := FParser.ParseToken(TTCloseParenthesis);
    Result := TEnumeratedTypeNode.Create(AOpen, AItemList, AClose);
  except
    FreeAndNil(AClose);
    FreeAndNil(AItemList);
    FreeAndNil(AOpen);
    raise;
  end;
end;

{ TEnumeratedTypeElementRule }

function TEnumeratedTypeElementRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTokenSets.TSIdent);
end;

function TEnumeratedTypeElementRule.Evaluate: TASTNode;
var
  AName, AEquals: TToken;
  AValue: TASTNode;
begin
  AName := FParser.ParseRuleInternal(RTIdent) as TToken;

  AEquals := nil;
  AValue := nil;
  if FParser.CanParseToken(TTEqualSign) then
  begin
    AEquals := FParser.ParseToken(TTEqualSign);
    AValue := FParser.ParseRuleInternal(RTExpression);
  end;

  Result := TEnumeratedTypeElementNode.Create(AName, AEquals, AValue);
end;

{ TExceptionItemRule }

function TExceptionItemRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTOnSemikeyword);
end;

function TExceptionItemRule.Evaluate: TASTNode;
var
  AOn, AName, AColon, ADo, ASemicolon: TToken;
  AType, AStatement: TASTNode;
begin
  AOn := FParser.ParseToken(TTOnSemikeyword);

  AName := nil; AColon := nil; AType := nil; ADo := nil; AStatement := nil;
  ASemicolon := nil;
  try
    if FParser.Peek(1) = TTColon then
    begin
      AName := FParser.ParseRuleInternal(RTIdent) as TToken;
      AColon := FParser.ParseToken(TTColon);
    end;

    AType := FParser.ParseRuleInternal(RTQualifiedIdent);
    ADo := FParser.ParseToken(TTDoKeyword);

    if FParser.CanParseRule(RTStatement) then
      AStatement := FParser.ParseRuleInternal(RTStatement);

    if FParser.CanParseToken(TTSemicolon) then
      ASemicolon := FParser.ParseToken(TTSemicolon);

    Result := TExceptionItemNode.Create(AOn, AName, AColon, AType, ADo,
      AStatement, ASemicolon);
  except
    FreeAndNil(ASemicolon);
    FreeANdNil(AStatement);
    FreeAndNil(ADo);
    FreeAndNil(AType);
    FreeAndNil(AColon);
    FreeAndNil(AName);
    raise;
  end;
end;

{ TExportsItemRule }

function TExportsItemRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTokenSets.TSIdent);
end;

function TExportsItemRule.Evaluate: TASTNode;
var
  AName: TASTNode;
  ASpecifierList: TListNode;
begin
  AName := FParser.ParseRuleInternal(RTQualifiedIdent);
  ASpecifierList := FParser.ParseOptionalRuleList(RTExportsSpecifier);
  Result := TExportsItemNode.Create(AName, ASpecifierList);
end;

{ TExportsSpecifierRule }

function TExportsSpecifierRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTokenSets.TSExportsSpecifier);
end;

function TExportsSpecifierRule.Evaluate: TASTNode;
var
  AKeyword: TToken;
  AValue: TASTNode;
begin
  AKeyword := FParser.ParseToken(TTokenSets.TSExportsSpecifier);
  if FParser.CanParseRule(RTExpression) then
    AValue := FParser.ParseRuleInternal(RTExpression) else
    AValue := nil;
  Result := TExportsSpecifierNode.Create(AKeyword, AValue);
end;

{ TExportsStatementRule }

function TExportsStatementRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTExportsKeyword);
end;

function TExportsStatementRule.Evaluate: TASTNode;
var
  AExports, ASemicolon: TToken;
  AItemList: TListNode;
begin
  AExports := FParser.ParseToken(TTExportsKeyword);
  AItemList := FParser.ParseDelimitedList(RTExportsItem, TTComma);
  ASemicolon := FParser.ParseToken(TTSemicolon);

  Result := TExportsStatementNode.Create(AExports, AItemList, ASemicolon);
end;

{ TExpressionRule }

function TExpressionRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTokenSets.TSExpression);
end;

function TExpressionRule.Evaluate: TASTNode;
var
  AOperator: TToken;
  ARight: TASTNode;
begin
  // a < b
  AOperator := nil; ARight := nil; Result := nil;
  try
    Result := FParser.ParseRuleInternal(RTSimpleExpression);
    while FParser.CanParseRule(RTRelOp) do
    begin
      AOperator := FParser.ParseRuleInternal(RTRelOp) as TToken;
      ARight := FParser.ParseRuleInternal(RTSimpleExpression);
      Result := TBinaryOperationNode.Create(Result, AOperator, ARight);
      ARight := nil; AOperator := nil;
    end;
  except
    FreeAndNil(Result);
    FreeAndNil(ARight);
    FreeAndNil(AOperator);
    raise;
  end;
end;

{ TExpressionListRule }

function TExpressionListRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTokenSets.TSExpression);
end;

function TExpressionListRule.Evaluate: TASTNode;
begin
  // a < b, b < c, c < d
  Result := FParser.ParseDelimitedList(RTExpression, TTComma);
end;

{ TExpressionOrAssignmentRule }

function TExpressionOrAssignmentRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTokenSets.TSExpression);
end;

function TExpressionOrAssignmentRule.Evaluate: TASTNode;
var
  AOperator: TToken;
  ARight: TASTNode;
begin
  // a := b
  // c := a < b
  Result := FParser.ParseRuleInternal(RTExpression);
  if FParser.CanParseToken(TTColonEquals) then
  begin
    AOperator := FParser.ParseToken(TTColonEquals);
    ARight := FParser.ParseRuleInternal(RTExpression);
    Result := TBinaryOperationNode.Create(Result, AOperator, ARight);
  end;
end;

{ TExpressionOrRangeRule }

function TExpressionOrRangeRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTokenSets.TSExpression);
end;

function TExpressionOrRangeRule.Evaluate: TASTNode;
var
  ADotDot: TToken;
  ARight: TASTNode;
begin
  Result := FParser.ParseRuleInternal(RTSimpleExpression);
  if FParser.CanParseToken(TTDotDot) then
  begin
    ADotDot := FParser.ParseToken(TTDotDot);
    ARight := FParser.ParseRuleInternal(RTSimpleExpression);
    Result := TBinaryOperationNode.Create(Result, ADotDot, ARight);
  end;
end;

{ TExpressionOrRangeListRule }

function TExpressionOrRangeListRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTokenSets.TSExpression);
end;

function TExpressionOrRangeListRule.Evaluate: TASTNode;
begin
  Result := FParser.ParseDelimitedList(RTExpressionOrRange, TTComma);
end;

{ TExtendedIdentRule }

function TExtendedIdentRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTokenSets.TSExtendedIdent);
end;

function TExtendedIdentRule.Evaluate: TASTNode;
var
  AToken: TToken;
begin
  AToken := FParser.ParseToken(TTokenSets.TSExtendedIdent);
  Result := AToken.WithTokenType(TTIdentifier);
  AToken.Free;
end;

{ TFactorRule }

function TFactorRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTokenSets.TSExpression);
end;

function TFactorRule.Evaluate: TASTNode;
var
  AOperator: TToken;
  AOperand: TASTNode;
begin
  AOperator := nil; AOperand := nil;

  if FParser.CanParseRule(RTUnaryOperator) then
  begin
    AOperator := FParser.ParseRuleInternal(RTUnaryOperator) as TToken;
    try
      AOperand := FParser.ParseRuleInternal(RTFactor);
    except
      on EParseException do
      begin
        AOperator.Free;
        raise;
      end;
    end;
    Result := TUnaryOperationNode.Create(AOperator, AOperand);
  end
  else
    Result := FParser.ParseRuleInternal(RTAtom);
end;

{ TFancyBlockRule }

function TFancyBlockRule.CanParse: Boolean;
begin
  Result := FParser.CanParseRule(RTBlock) or
    FParser.CanParseRule(RTImplementationDecl);
end;

function TFancyBlockRule.Evaluate: TASTNode;
var
  ADeclList: TListNode;
  ABlock: TASTNode;
begin
  // var AVar: Integer begin ... end
  ADeclList := nil; ABlock := nil;
  try
    ADeclList := FParser.ParseOptionalRuleList(RTImplementationDecl);
    ABlock := FParser.ParseRuleInternal(RTBlock);
    Result := TFancyBlockNode.Create(ADeclList, ABlock);
  except
    FreeAndNil(ABlock);
    FreeAndNil(ADeclList);
    raise;
  end;
end;

{ TFieldDeclRule }

function TFieldDeclRule.CanParse: Boolean;
begin
  Result := FParser.CanParseRule(RTIdentList) and
    not FParser.CanParseRule(RTVisibility);
end;

function TFieldDeclRule.Evaluate: TASTNode;
var
  ANames, ADirectives: TListNode;
  AColon, ASemicolon: TToken;
  AType: TASTNode;
begin
  ANames := nil; ADirectives := nil; AColon := nil; ASemicolon := nil; AType := nil;
  try
    ANames := FParser.ParseRuleInternal(RTIdentList) as TListNode;
    AColon := FParser.ParseToken(TTColon);
    AType := FParser.ParseRuleInternal(RTType);
    ADirectives := FParser.ParseTokenList(TTokenSets.TSPortabilityDirective);
    if FParser.CanParseToken(TTSemicolon) then
      ASemicolon := FParser.ParseToken(TTSemicolon);

    Result := TFieldDeclNode.Create(ANames, AColon, AType, ADirectives, ASemicolon);
  except
    FreeAndNil(ASemicolon);
    FreeAndNil(ADirectives);
    FreeAndNil(AType);
    FreeAndNil(AColon);
    FreeAndNil(ANames);
    raise;
  end;
end;

{ TFieldSectionRule }

function TFieldSectionRule.CanParse: Boolean;
begin
  Result := (FParser.Peek(0) = TTVarKeyword) or
            FParser.CanParseRule(RTFieldDecl) or
            ((FParser.Peek(0) = TTClassKeyword) and
             (FParser.Peek(1) = TTVarKeyword));
end;

function TFieldSectionRule.Evaluate: TASTNode;
var
  AClass, AVar: TToken;
  AFields: TListNode;
begin
  AClass := nil; AVar := nil; AFields := nil;
  try
    if FParser.CanParseToken(TTClassKeyword) then
    begin
      AClass := FParser.ParseToken(TTClassKeyword);
      AVar := FParser.ParseToken(TTVarKeyword);
    end
    else if FParser.CanParseToken(TTVarKeyword) then
      AVar := FParser.ParseToken(TTVarKeyword);

    AFields := FParser.ParseOptionalRuleList(RTFieldDecl);
    Result := TFieldSectionNode.Create(AClass, AVar, AFields);
  except
    FreeAndNil(AFields);
    FreeAndNil(AVar);
    FreeAndNil(AClass);
    raise;
  end;
end;

{ TFileTypeRule }

function TFileTypeRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTFileKeyword);
end;

function TFileTypeRule.Evaluate: TASTNode;
var
  AFile: TToken;
  AOf: TToken;
  AType: TASTNode;
begin
  AFile := FParser.ParseToken(TTFileKeyword);
  AOf := nil;
  AType := nil;
  if FParser.CanParseToken(TTOfKeyword) then
  begin
    AOf := FParser.ParseToken(TTOfKeyword);
    AType := FParser.ParseRuleInternal(RTQualifiedIdent);
  end;
  Result := TFileTypeNode.Create(AFile, AOf, AType);
end;

{ TForStatementRule }

function TForStatementRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTForKeyword);
end;

function TForStatementRule.Evaluate: TASTNode;
var
  AFor, ALoopVariable, AIn, ADo, AColonEquals, ADirection: TToken;
  AExpression, AStatement, AStartingValue, AEndingValue: TASTNode;
begin
  // for AVariable in AArray do ...
  // for AVariable := 0 to 5 do ...

  AFor := FParser.ParseToken(TTForKeyword);
  ALoopVariable := FParser.ParseRuleInternal(RTIdent) as TToken;

  if FParser.CanParseToken(TTInKeyword) then
  begin
    AIn := FParser.ParseToken(TTInKeyword);
    AExpression := FParser.ParseRuleInternal(RTExpression);
    ADo := FParser.ParseToken(TTDoKeyword);
    AStatement := nil;
    if FParser.CanParseRule(RTStatement) then
      AStatement := FParser.ParseRuleInternal(RTStatement);

    Result := TForInStatementNode.Create(AFor, ALoopVariable, AIn, AExpression,
      ADo, AStatement);
  end
  else
  begin
    AColonEquals := FParser.ParseToken(TTColonEquals);
    AStartingValue := FParser.ParseRuleInternal(RTExpression);
    ADirection := FParser.ParseToken(TTokenSets.TSForDirection);
    AEndingValue := FParser.ParseRuleInternal(RTExpression);
    ADo := FParser.ParseToken(TTDoKeyword);
    AStatement := nil;
    if FParser.CanParseRule(RTStatement) then
      AStatement := FParser.ParseRuleInternal(RTStatement);

    Result := TForStatementNode.Create(AFor, ALoopVariable, AColonEquals,
      AStartingValue, ADirection, AEndingValue, ADo, AStatement);
  end;
end;

{ TGoalRule }

function TGoalRule.CanParse: Boolean;
begin
  Result := FAlternator.LookAhead(FParser);
end;

constructor TGoalRule.Create(AParser: IParser; ARuleType: TRuleType);
begin
  inherited Create(AParser, ARuleType);
  FAlternator := TAlternator.Create;
  FAlternator.AddRule(RTPackage);
  FAlternator.AddRule(RTProgram);
  FAlternator.AddRule(RTUnit);
end;

destructor TGoalRule.Destroy;
begin
  FAlternator.Free;
  inherited;
end;

function TGoalRule.Evaluate: TASTNode;
begin
  Result := FAlternator.Execute(FParser);
end;

{ TGotoStatementRule }

function TGotoStatementRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTGotoKeyword);
end;

function TGotoStatementRule.Evaluate: TASTNode;
var
  AGoTo: TToken;
  ALabelId: TToken;
begin
  // goto LABEL

  AGoTo := FParser.ParseToken(TTGotoKeyword);
  ALabelId := FParser.ParseRuleInternal(RTLabelId) as TToken;
  Result := TGotoStatementNode.Create(AGoTo, ALabelId);
end;

{ TIdentRule }

function TIdentRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTokenSets.TSIdent);
end;

function TIdentRule.Evaluate: TASTNode;
var
  AToken: TToken;
begin
  AToken := FParser.ParseToken(TTokenSets.TSIdent);
  Result := AToken.WithTokenType(TTIdentifier);
  AToken.Free;
end;

{ TIdentListRule }

function TIdentListRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTokenSets.TSIdent);
end;

function TIdentListRule.Evaluate: TASTNode;
begin
  Result := FParser.ParseDelimitedList(RTIdent, TTComma);
end;

{ TIfStatementRule }

function TIfStatementRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTIfKeyword);
end;

function TIfStatementRule.Evaluate: TASTNode;
var
  AIf, AThen, AElse: TToken;
  ACondition, AThenStatement, AElseStatement: TASTNode;
begin
  // if a < b then ...
  // if a < b then ... else ...

  AIf := FParser.ParseToken(TTIfKeyword);
  AThen := nil; AElse := nil; ACondition := nil; AThenStatement := nil;
  AElseStatement := nil;
  try
    ACondition := FParser.ParseRuleInternal(RTExpression);
    AThen := FParser.ParseToken(TTThenKeyword);
    if FParser.CanParseRule(RTStatement) then
      AThenStatement := FParser.ParseRuleInternal(RTStatement);

    if FParser.CanParseToken(TTElseKeyword) then
    begin
      AElse := FParser.ParseToken(TTElseKeyword);
      if FParser.CanParseRule(RTStatement) then
        AElseStatement := FParser.ParseRuleInternal(RTStatement);
    end;

    Result := TIfStatementNode.Create(AIf, ACondition, AThen, AThenStatement,
      AElse, AElseStatement);
  except
    FreeAndNil(AElseStatement);
    FreeAndNil(AElse);
    FreeAndNil(AThenStatement);
    FreeAndNil(AThen);
    FreeAndNil(ACondition);
    FreeAndNil(AIf);
    raise;
  end;
end;

{ TImplementationDeclRule }

function TImplementationDeclRule.CanParse: Boolean;
begin
  Result := FAlternator.LookAhead(FParser);
end;

constructor TImplementationDeclRule.Create(AParser: IParser;
  ARuleType: TRuleType);
begin
  inherited Create(AParser, ARuleType);
  FAlternator := TAlternator.Create;
  FAlternator.AddRule(RTAssemblyAttribute);
  FAlternator.AddRule(RTConstSection);
  FAlternator.AddRule(RTExportsStatement);
  FAlternator.AddRule(RTLabelDeclSection);
  FAlternator.AddRule(RTMethodImplementation);
  FAlternator.AddRule(RTTypeSection);
  FAlternator.AddRule(RTVarSection);
end;

destructor TImplementationDeclRule.Destroy;
begin
  FAlternator.Free;
  inherited;
end;

function TImplementationDeclRule.Evaluate: TASTNode;
begin
  Result := FAlternator.Execute(FParser);
end;

{ TImplementationSectionRule }

function TImplementationSectionRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTImplementationKeyword);
end;

function TImplementationSectionRule.Evaluate: TASTNode;
var
  AImplementation: TToken;
  AUsesClause: TUsesClauseNode;
  AContents: TListNode;
begin
  AImplementation := FParser.ParseToken(TTImplementationKeyword);
  AUsesClause := nil; AContents := nil;
  try
    if FParser.CanParseRule(RTUsesClause) then
      AUsesClause := FParser.ParseRuleInternal(RTUsesClause) as TUsesClauseNode;
    AContents := FParser.ParseOptionalRuleList(RTImplementationDecl);
    Result := TUnitSectionNode.Create(AImplementation, AUsesClause, AContents);
  except
    FreeAndNil(AContents);
    FreeANdNil(AUsesClause);
    FreeAndNil(AImplementation);
    raise;
  end;
end;

{ TInitSectionRule }

function TInitSectionRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTokenSets.TSInitSection);
end;

function TInitSectionRule.Evaluate: TASTNode;
var
  AInitHeader, AFinalHeader, AEnd: TToken;
  AInitStatements, AFinalStatements: TListNode;
  ABlock: TBlockNode;
  AASM: TAssemblerStatementNode;
  AItem: TDelimitedItemNode;
  AItemList: TObjectList<TASTNode>;
begin
  AInitHeader := nil; AFinalHeader := nil; AEnd := nil;
  AInitStatements := FParser.CreateEmptyListNode;
  AFinalStatements := FParser.CreateEmptyListNode;
  ABlock := nil; AASM := nil; AItem := nil; AItemList := nil;
  try
    if FParser.CanParseToken(TTBeginKeyword) then
    begin
      ABlock := FParser.ParseRuleInternal(RTBlock) as TBlockNode;
      AInitHeader := ABlock.BeginKeywordNode.Clone as TToken;
      FreeAndNil(AInitStatements);
      AInitStatements := ABlock.StatementListNode.Clone as TListNode;
      AEnd := ABlock.EndKeywordNode.Clone as TToken;
      FreeAndNil(ABlock);
    end
    else if FParser.CanParseToken(TTAsmKeyword) then
    begin
      AASM := FParser.ParseRuleInternal(RTAssemblerStatement)
        as TAssemblerStatementNode;
      AItem := TDelimitedItemNode.Create(AASM, nil);
      AItemList := TObjectList<TASTNode>.Create(False);
      AItemList.Add(AItem);
      FreeAndNil(AInitStatements);
      AInitStatements := TListNode.Create(AItemList);
      FreeAndNil(AItemList);
    end
    else
    begin
      if FParser.CanParseToken(TTInitializationKeyword) then
      begin
        AInitHeader := FParser.ParseToken(TTInitializationKeyword);
        FreeAndNil(AInitStatements);
        AInitStatements := FParser.ParseOptionalStatementList;

        if FParser.CanParseToken(TTFinalizationKeyword) then
        begin
          AFinalHeader := FParser.ParseToken(TTFinalizationKeyword);
          FreeAndNil(AFinalStatements);
          AFinalStatements := FParser.ParseOptionalStatementList;
        end;
      end;

      AEnd := FParser.ParseToken(TTEndKeyword);
    end;

    Result := TInitSectionNode.Create(AInitHeader, AInitStatements, AFinalHeader,
      AFinalStatements, AEnd);
  except
    FreeAndNil(AEnd);
    FreeANdNil(AFinalStatements);
    FreeAndNil(AFinalHeader);
    FreeAndNil(AInitStatements);
    FreeAndNil(AInitHeader);
    FreeAndNil(AItemList);
    FreeAndNil(ABlock);
    raise;
  end;
end;

{ TInterfaceDeclRule }

function TInterfaceDeclRule.CanParse: Boolean;
begin
  Result := FAlternator.LookAhead(FParser);
end;

constructor TInterfaceDeclRule.Create(AParser: IParser; ARuleType: TRuleType);
begin
  inherited Create(AParser, ARuleType);
  FAlternator := TAlternator.Create;
  FAlternator.AddRule(RTConstSection);
  FAlternator.AddRule(RTTypeSection);
  FAlternator.AddRule(RTVarSection);
  FAlternator.AddRule(RTMethodHeading);
end;

destructor TInterfaceDeclRule.Destroy;
begin
  FAlternator.Free;
  inherited;
end;

function TInterfaceDeclRule.Evaluate: TASTNode;
begin
  Result := FAlternator.Execute(FParser);
end;

{ TInterfaceSectionRule }

function TInterfaceSectionRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTInterfaceKeyword);
end;

function TInterfaceSectionRule.Evaluate: TASTNode;
var
  AInterface: TToken;
  AUsesClause: TUsesClauseNode;
  AContents: TListNode;
begin
  AInterface := FParser.ParseToken(TTInterfaceKeyword);
  AUsesClause := nil; AContents := nil;
  try
    if FParser.CanParseRule(RTUsesClause) then
      AUsesClause := FParser.ParseRuleInternal(RTUsesClause) as TUsesClauseNode;
    AContents := FParser.ParseOptionalRuleList(RTInterfaceDecl);
    Result := TUnitSectionNode.Create(AInterface, AUsesClause, AContents);
  except
    FreeAndNil(AContents);
    FreeAndNil(AUsesClause);
    FreeAndNil(AInterface);
    raise;
  end;
end;

{ TInterfaceTypeRule }

function TInterfaceTypeRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTokenSets.TSInterfaceType);
end;

function TInterfaceTypeRule.Evaluate: TASTNode;
var
  AInterface, AOpenP, ACloseP, AOpenB, ACloseB, AEnd: TToken;
  ABaseInterface, AGUID: TASTNode;
  AMethodAndPropertyList: TListNode;
begin
  AInterface := FParser.ParseToken(TTokenSets.TSInterfaceType);

  AOpenP := nil; ABaseInterface := nil; ACloseP := nil; AOpenB := nil;
  AGUID := nil; ACloseB := nil; AEnd := nil; AMethodAndPropertyList := nil;

  try

    if FParser.CanParseToken(TTOpenParenthesis) then
    begin
      AOpenP := FParser.ParseToken(TTOpenParenthesis);
      ABaseInterface := FParser.ParseRuleInternal(RTQualifiedIdent);
      ACloseP := FParser.ParseToken(TTCloseParenthesis);
    end;

    if FParser.CanParseToken(TTOpenBracket) then
    begin
      AOpenB := FParser.ParseToken(TTOpenBracket);
      AGUID := FParser.ParseRuleInternal(RTExpression);
      ACloseB := FParser.ParseToken(TTCloseBracket);
    end;

    AMethodAndPropertyList := FParser.ParseOptionalRuleList(RTMethodOrProperty);
    AEnd := FParser.ParseToken(TTEndKeyword);

    Result := TInterfaceTypeNode.Create(AInterface, AOpenP, ABaseInterface,
      ACloseP, AOpenB, AGUID, ACloseB, AMethodAndPropertyList, AEnd);

  except
    FreeAndNil(AEnd);
    FreeAndNil(AMethodAndPropertyList);
    FreeAndNil(ACloseB);
    FreeAndNil(AGUID);
    FreeANdNil(AOpenB);
    FreeAndNil(ACloseP);
    FreeAndNil(ABaseInterface);
    FreeAndNil(AOpenP);
    FreeAndNil(AInterface);
    raise;
  end;
end;

{ TLabelDeclSectionRule }

function TLabelDeclSectionRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTLabelKeyword);
end;

function TLabelDeclSectionRule.Evaluate: TASTNode;
var
  ALabel, ASemicolon: TToken;
  ALabelList: TListNode;
begin
  ALabel := FParser.ParseToken(TTLabelKeyword);
  ALabelList := FParser.ParseDelimitedList(RTLabelId, TTComma);
  ASemicolon := FParser.ParseToken(TTSemicolon);

  Result := TLabelDeclSectionNode.Create(ALabel, ALabelList, ASemicolon);
end;

{ TLabelIdRule }

function TLabelIdRule.CanParse: Boolean;
begin
  Result := FAlternator.LookAhead(FParser);
end;

constructor TLabelIdRule.Create(AParser: IParser; ARuleType: TRuleType);
begin
  inherited Create(AParser, ARuleType);
  FAlternator := TAlternator.Create;
  FAlternator.AddToken(TTNumber);
  FAlternator.AddRule(RTIdent);
end;

destructor TLabelIdRule.Destroy;
begin
  FAlternator.Free;
  inherited;
end;

function TLabelIdRule.Evaluate: TASTNode;
begin
  Result := FAlternator.Execute(FParser);
end;

{ TMethodHeadingRule }

function TMethodHeadingRule.CanParse: Boolean;
begin
  Result := ((FParser.Peek(0) = TTClassKeyword) and
    (TTokenSets.TSMethodType.Contains(FParser.Peek(1))) or
    (FParser.CanParseToken(TTokenSets.TSMethodType)));
end;

function TMethodHeadingRule.Evaluate: TASTNode;
var
  AClass, AMethodType, AEquals, AImplementationMethod, ASemicolon,
  AOpen, AClose, AColon: TToken;
  AName, AInterfaceMethod, AReturnType: TASTNode;
  AParameterList, ADirectiveList: TListNode;
begin
  AClass := nil; AMethodType := nil; AEquals := nil; AImplementationMethod := nil;
  ASemicolon := nil; AOpen := nil; AClose := nil; AColon := nil; AName := nil;
  AInterfaceMethod := nil; AReturnType := nil; AParameterList := nil;
  ADirectiveList := nil;
  try
    if FParser.CanParseToken(TTClassKeyword) then
      AClass := FParser.ParseToken(TTClassKeyword);

    AMethodType := FParser.ParseToken(TTokenSets.TSMethodType);
    AName := FParser.ParseRuleInternal(RTQualifiedIdent);

    if FParser.CanParseToken(TTEqualSign) then
    begin
      AInterfaceMethod := AName;
      AEquals := FParser.ParseToken(TTEqualSign);
      AImplementationMethod := FParser.ParseRuleInternal(RTIdent) as TToken;
      ASemicolon := FParser.ParseToken(TTSemicolon);
      Result := TMethodResolutionNode.Create(AMethodType, AInterfaceMethod,
        AEquals, AImplementationMethod, ASemicolon);
    end
    else
    begin
      AParameterList := FParser.CreateEmptyListNode;
      if FParser.CanParseToken(TTOpenParenthesis) then
      begin
        AOpen := FParser.ParseToken(TTOpenParenthesis);
        if FParser.CanParseRule(RTParameter) then
        begin
          FreeAndNil(AParameterList);
          AParameterList := FParser.ParseDelimitedList(RTParameter, TTSemicolon);
        end;
        AClose := FParser.ParseToken(TTCloseParenthesis);
      end;

      if FParser.CanParseToken(TTColon) then
      begin
        AColon := FParser.ParseToken(TTColon);
        AReturnType := FParser.ParseRuleInternal(RTMethodReturnType);
      end;

      ADirectiveList := FParser.ParseOptionalRuleList(RTDirective);

      if FParser.CanParseToken(TTSemicolon) then
        ASemicolon := FParser.ParseToken(TTSemicolon);

      Result := TMethodHeadingNode.Create(AClass, AMethodType, AName, AOpen,
        AParameterList, AClose, AColon, AReturnType, ADirectiveList, ASemicolon);
    end;
  except
    FreeAndNil(ASemicolon);
    FreeAndNil(ADirectiveList);
    FreeAndNil(AReturnType);
    FreeAndNil(AColon);
    FreeAndNil(AClose);
    FreeAndNil(AParameterList);
    FreeAndNil(AOpen);
    FreeAndNil(AImplementationMethod);
    FreeAndNil(AEquals);
    FreeAndNil(AInterfaceMethod);
    FreeAndNil(AName);
    FreeAndNil(AMethodType);
    FreeAndNil(AClass);
    raise;
  end;
end;

{ TMethodImplementationRule }

function TMethodImplementationRule.CanParse: Boolean;
begin
  Result := FParser.CanParseRule(RTMethodHeading);
end;

function TMethodImplementationRule.Evaluate: TASTNode;
var
  AMethodHeading: TMethodHeadingNode;
  AFancyBlock: TFancyBlockNode;
  ASemicolon: TToken;
begin
  AMethodHeading := nil; AFancyBlock := nil; ASemicolon := nil;
  try
    AMethodHeading := FParser.ParseRuleInternal(RTMethodHeading)
      as TMethodHeadingNode;
    if not AMethodHeading.RequiresBody then
      Result := AMethodHeading
    else
    begin
      AFancyBlock := FParser.ParseRuleInternal(RTFancyBlock) as TFancyBlockNode;
      ASemicolon := FParser.ParseToken(TTSemicolon);
      Result := TMethodImplementationNode.Create(AMethodHeading, AFancyBlock,
        ASemicolon);
    end;
  except
    FreeAndNil(ASemicolon);
    FreeAndNil(AFancyBlock);
    FreeAndNil(AMethodHeading);
    raise;
  end;
end;

{ TMethodOrPropertyRule }

function TMethodOrPropertyRule.CanParse: Boolean;
begin
  Result := FAlternator.LookAhead(FParser);
end;

constructor TMethodOrPropertyRule.Create(AParser: IParser;
  ARuleType: TRuleType);
begin
  inherited Create(AParser, ARuleType);
  FAlternator := TAlternator.Create;
  FAlternator.AddRule(RTMethodHeading);
  FAlternator.AddRule(RTProperty);
end;

destructor TMethodOrPropertyRule.Destroy;
begin
  FAlternator.Free;
  inherited;
end;

function TMethodOrPropertyRule.Evaluate: TASTNode;
begin
  Result := FAlternator.Execute(FParser);
end;

{ TMethodReturnTypeRule }

function TMethodReturnTypeRule.CanParse: Boolean;
begin
  Result := FAlternator.LookAhead(FParser);
end;

constructor TMethodReturnTypeRule.Create(AParser: IParser;
  ARuleType: TRuleType);
begin
  inherited Create(AParser, ARuleType);
  FAlternator := TAlternator.Create;
  FAlternator.AddToken(TTStringKeyword);
  FAlternator.AddRule(RTQualifiedIdent);
end;

destructor TMethodReturnTypeRule.Destroy;
begin
  FAlternator.Free;
  inherited;
end;

function TMethodReturnTypeRule.Evaluate: TASTNode;
begin
  Result := FAlternator.Execute(FParser);
end;

{ TOpenArrayRule }

function TOpenArrayRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTArrayKeyword);
end;

constructor TOpenArrayRule.Create(AParser: IParser; ARuleType: TRuleType);
begin
  inherited Create(AParser, ARuleType);
  FAlternator := TAlternator.Create;
  FAlternator.AddRule(RTQualifiedIdent);
  FAlternator.AddToken(TTConstKeyword);
  FAlternator.AddToken(TTFileKeyword);
  FAlternator.AddToken(TTStringKeyword);
end;

destructor TOpenArrayRule.Destroy;
begin
  FAlternator.Free;
  inherited;
end;

function TOpenArrayRule.Evaluate: TASTNode;
var
  AArray, AOf: TToken;
  AType: TASTNode;
begin
  AArray := FParser.ParseToken(TTArrayKeyword);
  AOf := FParser.ParseToken(TTOfKeyword);
  AType := FAlternator.Execute(FParser);
  Result := TOpenArrayNode.Create(AArray, AOf, AType);
end;


{ TOpenArrayConstructorRule }

function TOpenArrayConstructorRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTOpenBracket);
end;

function TOpenArrayConstructorRule.Evaluate: TASTNode;
var
  AOpen, AClose: TToken;
  AList: TListNode;
begin
  AOpen := FParser.ParseToken(TTOpenBracket);

  if FParser.CanParseRule(RTExpressionList) then
    AList := FParser.ParseRuleInternal(RTExpressionList) as TListNode
  else
    AList := FParser.CreateEmptyListNode;

  AClose := FParser.ParseToken(TTCloseBracket);
  Result := TOpenArrayConstructorNode.Create(AOpen, AList, AClose);
end;

{ TPackageRule }

function TPackageRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTPackageSemikeyword);
end;

function TPackageRule.Evaluate: TASTNode;
var
  APackage, ASemicolon, AEnd, ADot: TToken;
  AName: TASTNode;
  ARequiresClause: TRequiresClauseNode;
  AContainsClause: TUsesClauseNode;
  AAttributeList: TListNode;
begin
  APackage := nil; AName := nil; ASemicolon := nil; ARequiresClause := nil;
  AContainsClause := nil; AAttributeList := nil; AEnd := nil; ADot := nil;
  try
    APackage := FParser.ParseToken(TTPackageSemikeyword);
    AName := FParser.ParseRuleInternal(RTQualifiedIdent);
    ASemicolon := FParser.ParseToken(TTSemicolon);

    if FParser.CanParseRule(RTRequiresClause) then
      ARequiresClause := FParser.ParseRuleInternal(RTRequiresClause)
        as TRequiresClauseNode;

    if FParser.CanParseRule(RTUsesClause) then
      AContainsClause := FParser.ParseRuleInternal(RTUsesClause)
        as TUsesClauseNode;

    AAttributeList := FParser.ParseOptionalRuleList(RTAssemblyAttribute);
    AEnd := FParser.ParseToken(TTEndKeyword);
    ADot := FParser.ParseToken(TTDot);
    Result := TPackageNode.Create(APackage, AName, ASemicolon, ARequiresClause,
      AContainsClause, AAttributeList, AEnd, ADot);

  except
    FreeAndNil(ADot);
    FreeAndNil(AEnd);
    FreeAndNil(AAttributeList);
    FreeAndNil(AContainsClause);
    FreeAndNil(ASemicolon);
    FreeAndNil(AName);
    FreeAndNil(APackage);
    raise;
  end;
end;

{ TPackedTypeRule }

function TPackedTypeRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTPackedKeyword);
end;

function TPackedTypeRule.Evaluate: TASTNode;
var
  APacked: TToken;
  AType: TASTNode;
begin
  APacked := FParser.ParseToken(TTPackedKeyword);
  AType := FParser.ParseRuleInternal(RTType);
  Result := TPackedTypeNode.Create(APacked, AType);
end;

{ TParameterRule }

function TParameterRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTokenSets.TSParameter);
end;

function TParameterRule.Evaluate: TASTNode;
var
  AModifier, AColon, AEqualSign: TToken;
  ANames: TListNode;
  AType, ADefault: TASTNode;
begin
  AModifier := nil;
  if FParser.CanParseToken(TTokenSets.TSParameterModifier) then
    AModifier := FParser.ParseToken(TTokenSets.TSParameterModifier);

  ANames := FParser.ParseRuleInternal(RTIdentList) as TListNode;

  AColon := nil;
  AType := nil;
  if FParser.CanParseToken(TTColon) then
  begin
    AColon := FParser.ParseToken(TTColon);
    AType := FParser.ParseRuleInternal(RTParameterType);
  end;

  AEqualSign := nil;
  ADefault := nil;
  if FParser.CanParseToken(TTEqualSign) then
  begin
    AEqualSign := FParser.ParseToken(TTEqualSign);
    ADefault := FParser.ParseRuleInternal(RTExpression);
  end;

  Result := TParameterNode.Create(AModifier, ANames, AColon, AType,
    AEqualSign, ADefault);
end;

{ TParameterExpressionRule }

function TParameterExpressionRule.CanParse: Boolean;
begin
  Result := FParser.CanParseRule(RTExpression);
end;

function TParameterExpressionRule.Evaluate: TASTNode;
var
  ASizeColon, APrecisionColon: TToken;
  ASize, APrecision: TASTNode;
begin
  Result := FParser.ParseRuleInternal(RTExpression);
  if FParser.CanParseToken(TTColon) then
  begin
    ASizeColon := FParser.ParseToken(TTColon);
    ASize := FParser.ParseRuleInternal(RTExpression);

    APrecisionColon := nil;
    APrecision := nil;

    if FParser.CanParseToken(TTColon) then
    begin
      APrecisionColon := FParser.ParseToken(TTColon);
      APrecision := FParser.ParseRuleInternal(RTExpression);
    end;

    Result := TNumberFormatNode.Create(Result, ASizeColon, ASize,
      APrecisionColon, APrecision);
  end;
end;

{ TParameterTypeRule }

function TParameterTypeRule.CanParse: Boolean;
begin
  Result := FAlternator.LookAhead(FParser);
end;

constructor TParameterTypeRule.Create(AParser: IParser; ARuleType: TRuleType);
begin
  inherited Create(AParser, ARuleType);
  FAlternator := TAlternator.Create;
  FAlternator.AddRule(RTQualifiedIdent);
  FAlternator.AddRule(RTOpenArray);
  FAlternator.AddToken(TTFileKeyword);
  FAlternator.AddToken(TTStringKeyword);
end;

destructor TParameterTypeRule.Destroy;
begin
  FAlternator.Free;
  inherited;
end;

function TParameterTypeRule.Evaluate: TASTNode;
begin
  Result := FAlternator.Execute(FParser);
end;

{ TParenthesizedExpressionRule }

function TParenthesizedExpressionRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTOpenParenthesis);
end;

function TParenthesizedExpressionRule.Evaluate: TASTNode;
var
  AOpen, AClose: TToken;
  AExpression: TASTNode;
begin
  AOpen := FParser.ParseToken(TTOpenParenthesis);
  AClose := nil; AExpression := nil;
  try
    AExpression := FParser.ParseRuleInternal(RTExpression);
    AClose := FParser.ParseToken(TTCloseParenthesis);
    Result := TParenthesizedExpressionNode.Create(AOpen, AExpression, AClose);
  except
    FreeAndNil(AClose);
    FreeAndNil(AExpression);
    FreeAndNil(AOpen);
    raise;
  end;

end;

{ TParticleRule }

function TParticleRule.CanParse: Boolean;
begin
  Result := FAlternator.LookAhead(FParser);
end;

constructor TParticleRule.Create(AParser: IParser; ARuleType: TRuleType);
begin
  inherited Create(AParser, ARuleType);
  FAlternator := TAlternator.Create(True);
  FAlternator.AddToken(TTFileKeyword);
  FAlternator.AddToken(TTNilKeyword);
  FAlternator.AddToken(TTNumber);
  FAlternator.AddToken(TTStringKeyword);
  FAlternator.AddToken(TTStringLiteral);
  FAlternator.AddRule(RTIdent);
  FAlternator.AddRule(RTParenthesizedExpression);
  FAlternator.AddRule(RTSetLiteral);
  FAlternator.AddRule(RTOpenArrayConstructor);
end;

destructor TParticleRule.Destroy;
begin
  FAlternator.Free;
  inherited;
end;

function TParticleRule.Evaluate: TASTNode;
begin
  Result := FAlternator.Execute(FParser);
end;

{ TPointerTypeRule }

function TPointerTypeRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTCaret);
end;

function TPointerTypeRule.Evaluate: TASTNode;
var
  ACaret: TToken;
  AType: TASTNode;
begin
  // ^Integer

  ACaret := FParser.ParseToken(TTCaret);
  AType := FParser.ParseRuleInternal(RTType);
  Result := TPointerTypeNode.Create(ACaret, AType);
end;

function TPortabilityDirectiveRule.CanParse: Boolean;
begin
  Result := TTokenSets.TSPortabilityDirective.Contains(FParser.Peek(0));
end;

function TPortabilityDirectiveRule.Evaluate: TASTNode;
var
  ASemicolon: TToken;
  ADirective: TToken;
  AValue, AData: TASTNode;
begin
// procedure X; external 'HelloWorld.dll'; OK!
// procedure Y; external 'HelloWorld.dll' delayed; deprecated 'Y'#13#10'X'; OK!

// procedure Z; external 'HelloWorld.dll' delayed; deprecated 'X'+'Y';
// [dcc32 Error] ParseRTL.dpr(179): E2029 Declaration expected but '+' found

// procedure Z2; external 'HelloWorld.dll' delayed; deprecated ('X'+'Y');
// [dcc32 Error] ParseRTL.dpr(180): E2029 Declaration expected but '(' found

  ASemicolon := nil; AValue := nil; AData := nil;
  try
    if FParser.CanParseToken(TTSemicolon) then
      ASemicolon := FParser.ParseToken(TTSemicolon);
    ADirective := FParser.ParseToken(TTokenSets.TSPortabilityDirective);
    if (ADirective.TokenType = TTDeprecatedSemikeyword) and
      FParser.CanParseToken(TTStringLiteral) then
        AValue := FParser.ParseToken(TTStringLiteral);
    Result := TDirectiveNode.Create(ASemicolon, ADirective, AValue, AData);
  except
    FreeAndNil(AValue);
    FreeAndNil(ADirective);
    FreeAndNil(ASemicolon);
    raise;
  end;
end;


{ TProcedureTypeRule }

function TProcedureTypeRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTokenSets.TSMethodType);
end;

function TProcedureTypeRule.Evaluate: TASTNode;
var
  AMethodType, AOpen, AClose, AColon, AOf, AObject: TToken;
  AParameters, AFirstDirectives, ASecondDirectives: TListNode;
  AReturnType: TASTNode;
begin
  AMethodType := FParser.ParseToken(TTokenSets.TSMethodType);
  AOpen := nil;
  AParameters := FParser.CreateEmptyListNode;
  AClose := nil;
  if FParser.CanParseToken(TTOpenParenthesis) then
  begin
    AOpen := FParser.ParseToken(TTOpenParenthesis);
    if FParser.CanParseRule(RTParameter) then
    begin
      FreeAndNil(AParameters);
      AParameters := FParser.ParseDelimitedList(RTParameter, TTSemicolon);
    end;
    AClose := FParser.ParseToken(TTCloseParenthesis);
  end;

  AColon := nil;
  AReturnType := nil;
  if FParser.CanParseToken(TTColon) then
    begin
      AColon := FParser.ParseToken(TTColon);
      AReturnType := FParser.ParseRuleInternal(RTMethodReturnType);
    end;

  AFirstDirectives := FParser.ParseOptionalRuleList(RTDirective);

  AOf := nil;
  AObject := nil;
  if FParser.CanParseToken(TTOfKeyword) then
    begin
      AOf := FParser.ParseToken(TTOfKeyword);
      AObject := FParser.ParseToken(TTObjectKeyword);
    end;

  ASecondDirectives := FParser.ParseOptionalRuleList(RTDirective);

  Result := TProcedureTypeNode.Create(AMethodType, AOpen, AParameters, AClose,
    AColon, AReturnType, AFirstDirectives, AOf, AObject, ASecondDirectives);
end;

{ TProgramRule }

function TProgramRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTokenSets.TSProgram);
end;

function TProgramRule.Evaluate: TASTNode;
var
  AProgram, AName, AOpen, AClose, ASemicolon, ADot: TToken;
  ANoise, ADeclarationList: TListNode;
  AUsesClause: TUsesClauseNode;
  AInit: TInitSectionNode;
begin
  AProgram := FParser.ParseToken(TTokenSets.TSProgram);
  AName := FParser.ParseRuleInternal(RTIdent) as TToken;

  AOpen := nil;
  ANoise := FParser.CreateEmptyListNode;
  AClose := nil;
  if FParser.CanParseToken(TTOpenParenthesis) then
    begin
      AOpen := FParser.ParseToken(TTOpenParenthesis);
      FreeAndNil(ANoise);
      ANoise := FParser.ParseDelimitedList(RTIdent, TTComma);
      AClose := FParser.ParseToken(TTCloseParenthesis);
    end;

  ASemicolon := FParser.ParseToken(TTSemicolon);

  AUsesClause := nil;
  if FParser.CanParseRule(RTUsesClause) then
    AUsesClause := FParser.ParseRuleInternal(RTUsesClause) as TUsesClauseNode;

  ADeclarationList := FParser.ParseOptionalRuleList(RTImplementationDecl);
  AInit := FParser.ParseRuleInternal(RTInitSection) as TInitSectionNode;
  ADot := FParser.ParseToken(TTDot);

  Result := TProgramNode.Create(AProgram, AName, AOpen, ANoise, AClose,
    ASemicolon, AUsesClause, ADeclarationList, AInit, ADot);
end;

{ TPropertyRule }

function TPropertyRule.CanParse: Boolean;
begin
  Result := (FParser.Peek(0) = TTPropertyKeyword) or
            ((FParser.Peek(0) = TTClassKeyword) and
             (FParser.Peek(1) = TTPropertyKeyword));
end;

function TPropertyRule.Evaluate: TASTNode;
var
  AClass, AProperty, AName, AOpen, AClose, AColon, ASemicolon: TToken;
  AParameterList, ADirectiveList: TListNode;
  AType: TASTNode;
begin
  AClass := nil;
  if FParser.CanParseToken(TTClassKeyword) then
    AClass := FParser.ParseToken(TTClassKeyword);

  AProperty := FParser.ParseToken(TTPropertyKeyword);
  AName := FParser.ParseRuleInternal(RTIdent) as TToken;

  AOpen := nil;
  AParameterList := FParser.CreateEmptyListNode;
  AClose := nil;
  if FParser.CanParseToken(TTOpenBracket) then
    begin
      AOpen := FParser.ParseToken(TTOpenBracket);
      FreeAndNil(AParameterList);
      AParameterList := FParser.ParseDelimitedList(RTParameter, TTSemicolon);
      AClose := FParser.ParseToken(TTCloseBracket);
    end;

  AColon := nil;
  AType := nil;
  if FParser.CanParseToken(TTColon) then
    begin
      AColon := FParser.ParseToken(TTColon);
      AType := FParser.ParseRuleInternal(RTMethodReturnType);
    end;

  ADirectiveList := FParser.ParseOptionalRuleList(RTPropertyDirective);
  ASemicolon := FParser.ParseToken(TTSemicolon);
  Result := TPropertyNode.Create(AClass, AProperty, AName, AOpen, AParameterList,
    AClose, AColon, AType, ADirectiveList, ASemicolon);
end;

{ TPropertyDirectiveRule }

function TPropertyDirectiveRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTokenSets.TSParameterizedPropertyDirective) or
    FParser.CanParseToken(TTokenSets.TSParameterlessPropertyDirective) or
    ((FParser.Peek(0) = TTSemicolon) and (FParser.Peek(1) = TTDefaultSemikeyword));
end;

function TPropertyDirectiveRule.Evaluate: TASTNode;
var
  ASemicolon, ADirective: TToken;
  AValue: TASTNode;
  AData: TListNode;
begin
  ASemicolon := nil;
  AValue := nil;
  AData := FParser.CreateEmptyListNode;

  if FParser.CanParseToken(TTSemicolon) then
  begin
    ASemicolon := FParser.ParseToken(TTSemicolon);
    ADirective := FParser.ParseToken(TTDefaultSemikeyword);
  end
  else if FParser.CanParseToken(TTImplementsSemikeyword) then
  begin
    ADirective := FParser.ParseToken(TTImplementsSemikeyword);
    AValue := FParser.ParseDelimitedList(RTQualifiedIdent, TTComma);
  end
  else if FParser.CanParseToken(TTokenSets.TSParameterizedPropertyDirective) then
  begin
    ADirective := FParser.ParseToken(TTokenSets.TSParameterizedPropertyDirective);
    AValue := FParser.ParseRuleInternal(RTExpression);
  end
  else
    ADirective := FParser.ParseToken(TTokenSets.TSParameterlessPropertyDirective);

  Result := TDirectiveNode.Create(ASemicolon, ADirective, AValue, AData);
end;

{ TQualifiedIdentRule }

function TQualifiedIdentRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTokenSets.TSIdent);
end;

function TQualifiedIdentRule.Evaluate: TASTNode;
var
  ADot: TToken;
  ARight: TASTNode;
begin
  Result := FParser.ParseRuleInternal(RTIdent);
  while FParser.CanParseToken(TTDot) do
  begin
    ADot := FParser.ParseToken(TTDot);
    ARight := FParser.ParseRuleInternal(RTExtendedIdent);
    Result := TBinaryOperationNode.Create(Result, ADot, ARight);
  end;
end;

{ TRaiseStatementRule }

function TRaiseStatementRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTRaiseKeyword);
end;

function TRaiseStatementRule.Evaluate: TASTNode;
var
  ARaise, AAt: TToken;
  AException, AAddress: TASTNode;
begin
  ARaise := FParser.ParseToken(TTRaiseKeyword);
  AException := nil;
  AAt := nil;
  AAddress := nil;
  if FParser.CanParseRule(RTExpression) then
  begin
    AException := FParser.ParseRuleInternal(RTExpression);
    if FParser.CanParseToken(TTAtSemikeyword) then
    begin
      AAt := FParser.ParseToken(TTAtSemikeyword);
      AAddress := FParser.ParseRuleInternal(RTExpression);
    end;
  end;

  Result := TRaiseStatementNode.Create(ARaise, AException, AAt, AAddress);
end;

{ TRecordFieldConstantRule }

function TRecordFieldConstantRule.CanParse: Boolean;
begin
  Result := FParser.CanParseRule(RTQualifiedIdent);
end;

function TRecordFieldConstantRule.Evaluate: TASTNode;
var
  AName, AValue: TASTNode;
  AColon: TToken;
begin
  AName := FParser.ParseRuleInternal(RTQualifiedIdent);
  AColon := FParser.ParseToken(TTColon);
  AValue := FParser.ParseRuleInternal(RTTypedConstant);
  Result := TRecordFieldConstantNode.Create(AName, AColon, AValue);
end;

{ TRecordHelperTypeRule }

function TRecordHelperTypeRule.CanParse: Boolean;
begin
  Result := (FParser.Peek(0) = TTRecordKeyword) and
    (FParser.Peek(1) = TTHelperSemikeyword);
end;

function TRecordHelperTypeRule.Evaluate: TASTNode;
var
  ATypeKeyword, AHelper, AFor, AEnd: TToken;
  AType: TASTNode;
  AContents: TListNode;
begin
  ATypeKeyword := FParser.ParseToken(TTRecordKeyword);
  AHelper := FParser.ParseToken(TTHelperSemikeyword);
  AFor := nil; AEnd := nil; AType := nil; AContents := nil;
  try
    AFor := FParser.ParseToken(TTForKeyword);
    AType := FParser.ParseRuleInternal(RTQualifiedIdent);
    AContents := FParser.ParseOptionalRuleList(RTVisibilitySection);
    AEnd := FParser.ParseToken(TTEndKeyword);

    Result := TTypeHelperNode.Create(ATypeKeyword, AHelper, nil, nil, nil, AFor,
      AType, AContents, AEnd);
  except
    FreeAndNil(AEnd);
    FreeAndNil(AContents);
    FreeAndNil(AType);
    FreeAndNil(AFor);
    FreeAndNil(AHelper);
    FreeAndNil(ATypeKeyword);
    raise;
  end;
end;

{ TRecordTypeRule }

function TRecordTypeRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTRecordKeyword);
end;

function TRecordTypeRule.Evaluate: TASTNode;
var
  ARecord, AEnd: TToken;
  AContents: TListNode;
  AVariantSection: TVariantSectionNode;
  ARecordDirectives: TASTNode;
begin
  ARecord := FParser.ParseToken(TTRecordKeyword);
  AEnd := nil; AContents := nil; AVariantSection := nil; ARecordDirectives := nil;
  try
    AContents := FParser.ParseOptionalRuleList(RTVisibilitySection);

    if FParser.CanParseRule(RTVariantSection) then
      AVariantSection := FParser.ParseRuleInternal(RTVariantSection)
        as TVariantSectionNode;

    AEnd := FParser.ParseToken(TTEndKeyword);
    if FParser.CanParseRule(RTTypeRecordDirectives) then
      ARecordDirectives := FParser.ParseRuleInternal(RTTypeRecordDirectives);
    Result := TRecordTypeNode.Create(ARecord, AContents, AVariantSection, AEnd);
  except
    FreeAndNil(ARecordDirectives);
    FreeAndNil(AEnd);
    FreeAndNil(AVariantSection);
    FreeAndNil(AContents);
    FreeAndNil(ARecord);
    raise;
  end;
end;

{ TRepeatStatementRule }

function TRepeatStatementRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTRepeatKeyword);
end;

function TRepeatStatementRule.Evaluate: TASTNode;
var
  ARepeat, AUntil: TToken;
  AList: TListNode;
  ACondition: TASTNode;
begin
  // repeat ... until a < b

  ARepeat := FParser.ParseToken(TTRepeatKeyword);
  AList := FParser.ParseOptionalStatementList;
  AUntil := FParser.ParseToken(TTUntilKeyword);
  ACondition := FParser.ParseRuleInternal(RTExpression);
  Result := TRepeatStatementNode.Create(ARepeat, AList, AUntil, ACondition);
end;

{ TRequiresClauseRule }

function TRequiresClauseRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTRequiresSemikeyword);
end;

function TRequiresClauseRule.Evaluate: TASTNode;
var
  ARequires, ASemicolon: TToken;
  APackageList: TListNode;
begin
  ARequires := FParser.ParseToken(TTRequiresSemikeyword);
  APackageList := FParser.ParseDelimitedList(RTQualifiedIdent, TTComma);
  ASemicolon := FParser.ParseToken(TTSemicolon);
  Result := TRequiresClauseNode.Create(ARequires, APackageList, ASemicolon);
end;

{ TSetLiteralRule }

function TSetLiteralRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTOpenBracket);
end;

function TSetLiteralRule.Evaluate: TASTNode;
var
  AOpen, AClose: TToken;
  AList: TListNode;
begin
  AOpen := FParser.ParseToken(TTOpenBracket);

  if FParser.CanParseRule(RTExpressionOrRangeList) then
    AList := FParser.ParseRuleInternal(RTExpressionOrRangeList) as TListNode
  else
    AList := FParser.CreateEmptyListNode;

  AClose := FParser.ParseToken(TTCloseBracket);
  Result := TSetLiteralNode.Create(AOpen, AList, AClose);
end;

{ TSetTypeRule }

function TSetTypeRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTSetKeyword);
end;

function TSetTypeRule.Evaluate: TASTNode;
var
  ASet, AOf: TToken;
  AType: TASTNode;
begin
  // Set of TSomething

  ASet := FParser.ParseToken(TTSetKeyword);
  AOf := FParser.ParseToken(TTOfKeyword);
  AType := FParser.ParseRuleInternal(RTType);
  Result := TSetOfNode.Create(ASet, AOf, AType);
end;

{ TSimpleExpressionRule }

function TSimpleExpressionRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTokenSets.TSExpression);
end;

function TSimpleExpressionRule.Evaluate: TASTNode;
var
  AOperator: TToken;
  ARight: TASTNode;
begin
  AOperator := nil; ARight := nil; Result := nil;
  try
    Result := FParser.ParseRuleInternal(RTTerm);
    while FParser.CanParseRule(RTAddOp) do
    begin
      AOperator := FParser.ParseRuleInternal(RTAddOp) as TToken;
      ARight := FParser.ParseRuleInternal(RTTerm);
      Result := TBinaryOperationNode.Create(Result, AOperator, ARight);
      ARight := nil; AOperator := nil;
    end;
  except
    FreeAndNil(Result);
    FreeAndNil(ARight);
    FreeAndNil(AOperator);
    raise;
  end;
end;

{ TSimpleStatementRule }

function TSimpleStatementRule.CanParse: Boolean;
begin
  Result := FAlternator.LookAhead(FParser);
end;

constructor TSimpleStatementRule.Create(AParser: IParser; ARuleType: TRuleType);
begin
  inherited Create(AParser, ARuleType);
  FAlternator := TAlternator.Create;
  FAlternator.AddRule(RTBareInherited);
  FAlternator.AddRule(RTBlock);
  FAlternator.AddRule(RTCaseStatement);
  FAlternator.AddRule(RTExpressionOrAssignment);
  FAlternator.AddRule(RTForStatement);
  FAlternator.AddRule(RTGotoStatement);
  FAlternator.AddRule(RTIfStatement);
  FAlternator.AddRule(RTRaiseStatement);
  FAlternator.AddRule(RTRepeatStatement);
  FAlternator.AddRule(RTTryStatement);
  FAlternator.AddRule(RTWhileStatement);
  FAlternator.AddRule(RTWithStatement);
end;

destructor TSimpleStatementRule.Destroy;
begin
  FAlternator.Free;
  inherited;
end;

function TSimpleStatementRule.Evaluate: TASTNode;
begin
  Result := FAlternator.Execute(FParser);
end;

{ TStatementRule }

function TStatementRule.CanParse: Boolean;
begin
  Result := FParser.CanParseRule(RTSimpleStatement);
end;

function TStatementRule.Evaluate: TASTNode;
var
  ALabel, AColon: TToken;
  AStatement: TASTNode;
begin
  if (TTokenSets.TSLabelId.Contains(FParser.Peek(0))) and
    (FParser.Peek(1) = TTColon) then
  begin
    ALabel := FParser.ParseRuleInternal(RTLabelId) as TToken;
    AColon := FParser.ParseToken(TTColon);
    AStatement := nil;
    if FParser.CanParseRule(RTSimpleStatement) then
      AStatement := FParser.ParseRuleInternal(RTSimpleStatement);

    Result := TLabeledStatementNode.Create(ALabel, AColon, AStatement);
  end
  else
    Result := FParser.ParseRuleInternal(RTSimpleStatement);
end;

{ TStatementListRule }

function TStatementListRule.CanParse: Boolean;
begin
  Result := (FParser.CanParseRule(RTStatement)) or
    (FParser.CanParseToken(TTSemicolon));
end;

function TStatementListRule.Evaluate: TASTNode;
var
  AItems: TObjectList<TASTNode>;
  AItem: TASTNode;
  ADelimiter: TToken;
begin
  Result := nil;
  AItems := TObjectList<TASTNode>.Create(False);
  try
    try
      while (FParser.CanParseRule(RTStatement)) or
        (FParser.CanParseToken(TTSemicolon)) do
      begin
        AItem := nil;
        if FParser.CanParseRule(RTStatement) then
          AItem := FParser.ParseRuleInternal(RTStatement);

        ADelimiter := nil;
        if FParser.CanParseToken(TTSemicolon) then
          ADelimiter := FParser.ParseToken(TTSemicolon);

        AItems.Add(TDelimitedItemNode.Create(AItem, ADelimiter));
      end;
      Result := TListNode.Create(AItems);
    except
      AItems.OwnsObjects := True;
      raise;
    end;
  finally
    AItems.Free;
  end;
end;

{ TStringTypeRule }

function TStringTypeRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTStringKeyword);
end;

function TStringTypeRule.Evaluate: TASTNode;
var
  AOpenBracket, ACloseBracket: TToken;
  ALength: TASTNode;
begin
  Result := FParser.ParseToken(TTStringKeyword);
  if FParser.CanParseToken(TTOpenBracket) then
  begin
    AOpenBracket := FParser.ParseToken(TTOpenBracket);
    ALength := FParser.ParseRuleInternal(RTExpression);
    ACloseBracket := FParser.ParseToken(TTCloseBracket);
    Result := TStringOfLengthNode.Create(Result as TToken,
      AOpenBracket, ALength, ACloseBracket);
  end;
end;

{ TTermRule }

function TTermRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTokenSets.TSExpression);
end;

function TTermRule.Evaluate: TASTNode;
var
  AOperator: TToken;
  ARight: TASTNode;
begin
  AOperator := nil; ARight := nil; Result := nil;
  try
    Result := FParser.ParseRuleInternal(RTFactor);
    while FParser.CanParseRule(RTMulOp) do
    begin
      AOperator := FParser.ParseRuleInternal(RTMulOp) as TToken;
      ARight := FParser.ParseRuleInternal(RTFactor);
      Result := TBinaryOperationNode.Create(Result, AOperator, ARight);
      ARight := nil; AOperator := nil;
    end;
  except
    FreeAndNil(Result);
    FreeAndNil(ARight);
    FreeAndNil(AOperator);
    raise;
  end;
end;

{ TTryStatementRule }

function TTryStatementRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTTryKeyword);
end;

function TTryStatementRule.Evaluate: TASTNode;
var
  ATry, AExcept, AElse, AEnd, AFinally: TToken;
  ATryStatements, AExceptionItemList: TListNode;
  AElseStatements, AFinallyStatements: TListNode;
begin
  // try ... finally ... end
  // try ... except ... end

  ATry := FParser.ParseToken(TTTryKeyword);
  ATryStatements := FParser.ParseOptionalStatementList;

  if FParser.CanParseToken(TTExceptKeyword) then
  begin
    AExcept := FParser.ParseToken(TTExceptKeyword);

    AExceptionItemList := FParser.CreateEmptyListNode;
    AElse := nil;
    AElseStatements := FParser.CreateEmptyListNode;

    if (FParser.CanParseRule(RTExceptionItem)) or
      (FParser.CanParseToken(TTElseKeyword)) then
    begin
      if FParser.CanParseRule(RTExceptionItem) then
      begin
        FreeAndNil(AExceptionItemList);
        AExceptionItemList := FParser.ParseRequiredRuleList(RTExceptionItem);
      end;

      if FParser.CanParseToken(TTElseKeyword) then
      begin
        AElse := FParser.ParseToken(TTElseKeyword);
        FreeAndNil(AElseStatements);
        AElseStatements := FParser.ParseOptionalStatementList;
      end;
    end
    else
    begin
      FreeAndNil(AElseStatements);
      AElseStatements := FParser.ParseOptionalStatementList;
    end;

    AEnd := FParser.ParseToken(TTEndKeyword);
    Result := TTryExceptNode.Create(ATry, ATryStatements, AExcept,
      AExceptionItemList, AElse, AElseStatements, AEnd);
  end
  else
  begin
    AFinally := FParser.ParseToken(TTFinallyKeyword);
    AFinallyStatements := FParser.ParseOptionalStatementList;
    AEnd := FParser.ParseToken(TTEndKeyword);
    Result := TTryFinallyNode.Create(ATry, ATryStatements, AFinally,
      AFinallyStatements, AEnd);
  end;
end;

{ TTypeRule }

function TTypeRule.CanParse: Boolean;
begin
  Result := FAlternator.LookAhead(FParser);
end;

constructor TTypeRule.Create(AParser: IParser; ARuleType: TRuleType);
begin
  inherited Create(AParser, ARuleType);
  FAlternator := TAlternator.Create;
// extend each type to handle generics as well
  FAlternator.AddRule(RTFileType);
  FAlternator.AddRule(RTStringType);
  FAlternator.AddRule(RTAnonymousMethodType);
  FAlternator.AddRule(RTArrayType);
  FAlternator.AddRule(RTClassHelperType);
  FAlternator.AddRule(RTClassOfType);
  FAlternator.AddRule(RTClassType);
  FAlternator.AddRule(RTEnumeratedType);
  FAlternator.AddRule(RTExpressionOrRange);
  FAlternator.AddRule(RTInterfaceType);
  FAlternator.AddRule(RTPackedType);
  FAlternator.AddRule(RTPointerType);
  FAlternator.AddRule(RTProcedureType);
  FAlternator.AddRule(RTRecordHelperType);
  FAlternator.AddRule(RTRecordType);
  FAlternator.AddRule(RTSetType);
end;

destructor TTypeRule.Destroy;
begin
  FAlternator.Free;
  inherited;
end;

function TTypeRule.Evaluate: TASTNode;
begin
  Result := FAlternator.Execute(FParser);
end;

{ TTypedConstantRule }

function TTypedConstantRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTokenSets.TSExpression);
end;

function TTypedConstantRule.Evaluate: TASTNode;
var
  AOpen, AClose: TToken;
  AItems: TListNode;
  AOriginalFrame: IFrame;
begin
  Result := nil; AOpen := nil; AClose := nil; AItems := nil;
  AOriginalFrame := FParser.NextFrame;

  try
    Result := FParser.ParseRuleInternal(RTExpression)
  except
    on EParseException do
      FParser.NextFrame := AOriginalFrame;
  end;

  if Result = nil then
  begin
    AOpen := FParser.ParseToken(TTOpenParenthesis);
    AOriginalFrame := FParser.NextFrame;
    AItems := nil;
    try
      AItems := FParser.ParseDelimitedList(RTTypedConstant, TTComma);
      AClose := FParser.ParseToken(TTCloseParenthesis);
    except
      on EParseException do
      begin
        AItems.Free;
        FParser.NextFrame := AOriginalFrame;
        if not FParser.CanParseToken(TTCloseParenthesis) then
          AItems := FParser.ParseDelimitedList(RTRecordFieldConstant, TTSemicolon)
        else
          AItems := FParser.CreateEmptyListNode;
          
        AClose := FParser.ParseToken(TTCloseParenthesis);
      end;
    end;
    Result := TConstantListNode.Create(AOpen, AItems, AClose);
  end;
end;

{ TTypeDeclRule }

function TTypeDeclRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTokenSets.TSIdent);
end;

function TTypeDeclRule.Evaluate: TASTNode;
var
  AName, AEqual, AForwardableType, ASemicolon, ATypeKeyword: TToken;
  AType, ATypeParams: TASTNode;
  ADirectives: TListNode;
begin
  AName := FParser.ParseRuleInternal(RTIdent) as TToken;
  ATypeParams := nil; AEqual := nil; AForwardableType := nil; ASemicolon := nil;
  ATypeKeyword := nil; AType := nil; ADirectives := nil;
  try
// parse generic types here
    if FParser.CanParseRule(RTTypeParams) then
      ATypeParams := FParser.ParseRuleInternal(RTTypeParams);
    AEqual := FParser.ParseToken(TTEqualSign);
    if TTokenSets.TSForwardableType.Contains(FParser.Peek(0)) and
      (FParser.Peek(1) = TTSemicolon) then
      begin
        AForwardableType := FParser.ParseToken(TTokenSets.TSForwardableType);
        ASemicolon := FParser.ParseToken(TTSemicolon);
        Result := TTypeForwardDeclarationNode.Create(AName, AEqual,
          AForwardableType, ASemicolon);
      end else
      begin
        ATypeKeyword := FParser.TryParseToken(TTTypeKeyword);
  // can be a generic type, so RTType needs to accept generics
        AType := FParser.ParseRuleInternal(RTType);
        ADirectives := FParser.ParseOptionalRuleList(RTPortabilityDirective);
        ASemicolon := FParser.ParseToken(TTSemicolon);
        Result := TTypeDeclNode.Create(AName, ATypeParams, AEqual, ATypeKeyword, AType,
          ADirectives, ASemicolon);
      end;
  except
    FreeAndNil(ASemicolon);
    FreeAndNil(ADirectives);
    FreeAndNil(AType);
    FreeAndNil(ATypeKeyword);
    FreeAndNil(AForwardableType);
    FreeAndNil(ATypeParams);
    FreeAndNil(AEqual);
    FreeAndNil(AName);
    raise;
  end;
end;

{ TTypeParamRule }

function TTypeParamRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTPlusSign) or
    FParser.CanParseToken(TTMinusSign) or
    FParser.CanParseRule(RTQualifiedIdent);
end;

function TTypeParamRule.Evaluate: TASTNode;
var
  AModifier, AName: TToken;
begin
  if FParser.CanParseToken(TTPlusSign) then
    AModifier := FParser.ParseToken(TTPlusSign)
  else if FParser.CanParseToken(TTMinusSign) then
    AModifier := FParser.ParseToken(TTMinusSign)
  else
    AModifier := nil;

  AName := FParser.ParseRuleInternal(RTIdent) as TToken;
  Result := TTypeParamNode.Create(AModifier, AName);
end;

{ TTypeParamDeclRule }

function TTypeParamDeclRule.CanParse: Boolean;
begin
  Result := FParser.CanParseRule(RTTypeParam);
end;

function TTypeParamDeclRule.Evaluate: TASTNode;
var
  AParams, AConstraints: TListNode;
  AColon: TToken;
begin
  AParams := FParser.ParseDelimitedList(RTTypeParam, TTComma);
  AColon := nil;
  AConstraints := nil;

  if FParser.CanParseToken(TTColon) then
  begin
    AColon := FParser.ParseToken(TTColon);
    AConstraints := FParser.ParseDelimitedList(RTConstraint, TTComma)
  end;
  Result := TTypeParamDeclNode.Create(AParams, AColon, AConstraints);
end;

{ TTypeParamsRule }

function TTypeParamsRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTLessThan);
end;

function TTypeParamsRule.Evaluate: TASTNode;
var
  AOpen, AClose: TToken;
  AParamDecl: TTypeParamDeclNode;
begin
  AOpen := FParser.ParseToken(TTLessThan);
  AParamDecl := FParser.ParseRuleInternal(RTTypeParamDecl) as TTypeParamDeclNode;
  AClose := FParser.ParseToken(TTGreaterThan);
  Result := TTypeParamsNode.Create(AOpen, AParamDecl, AClose);
end;

{ TTypeRecordDirectivesRule }

function TTypeRecordDirectivesRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTDeprecatedSemikeyword) or
    FParser.CanParseToken(TTAlignSemikeyword);
end;

// deprecated 'msg' // no concatenations, no expressions, just string
// align X // where X is a constant, or an expression, eg 1 shl 2, or a const var
function TTypeRecordDirectivesRule.Evaluate: TASTNode;
var
  ADeprecatedDirective, AAlignDirective: TToken;
  ADeprecatedMsg, AAlignExpression: TASTNode;
begin
  ADeprecatedDirective := nil; AAlignDirective := nil;
  ADeprecatedMsg := nil; AAlignExpression := nil;
  // TODO -ochuacw: Add the usual directives accepted, such as library, platform, etc...
  try
    if FParser.CanParseToken(TTDeprecatedSemikeyword) then
      begin
        ADeprecatedDirective := FParser.ParseToken(TTDeprecatedSemikeyword);
        if FParser.CanParseRule(RTStringType) then
          ADeprecatedMsg := FParser.ParseRuleInternal(RTStringType);
      end; // only 1 deprecated accepted
    while FParser.CanParseToken(TTAlignSemikeyword) do // multiple align accepted
      begin
        ADeprecatedDirective := FParser.ParseToken(TTDeprecatedSemikeyword);
        if FParser.CanParseRule(RTExpression) then
          begin
            FreeAndNil(AAlignExpression);
            AAlignExpression := FParser.ParseRuleInternal(RTExpression);
          end;
      end;
    // TODO -ochuacw : do something to the result
    Result := nil;
  except
    FreeAndNil(AAlignExpression);
    FreeAndNil(AAlignDirective);
    FreeAndNil(ADeprecatedMsg);
    FreeAndNil(ADeprecatedDirective);
    raise;
  end;
end;

{ TTypeSectionRule }

function TTypeSectionRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTTypeKeyword);
end;

function TTypeSectionRule.Evaluate: TASTNode;
var
  AType: TToken;
  ATypeList: TListNode;
begin
  AType := FParser.ParseToken(TTTypeKeyword);
  ATypeList := nil; Result := nil;
  try
    ATypeList := FParser.ParseRequiredRuleList(RTTypeDecl);
  except
    AType.Free;
    raise
  end;

  Result := TTypeSectionNode.Create(AType, ATypeList);
end;

{ TUnitRule }

function TUnitRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTUnitKeyword);
end;

function TUnitRule.Evaluate: TASTNode;
var
  AUnit, ASemicolon, ADot: TToken;
  ADirectives: TListNode; AUnitName: TASTNode;
  AInterface, AImplementation: TUnitSectionNode;
  AInit: TInitSectionNode;
begin
  AUnit := FParser.ParseToken(TTUnitKeyword);
  AUnitName := nil; ADirectives := nil; ASemicolon := nil; AInterface := nil;
  AImplementation := nil; AInit := nil; ADot := nil;
  try
    AUnitName := FParser.ParseRuleInternal(RTQualifiedIdent);
    ADirectives := FParser.ParseTokenList(TTokenSets.TSPortabilityDirective);
    ASemicolon := FParser.ParseToken(TTSemicolon);
    AInterface := FParser.ParseRuleInternal(RTInterfaceSection)
      as TUnitSectionNode;
    AImplementation := FParser.ParseRuleInternal(RTImplementationSection)
      as TUnitSectionNode;
    AInit := FParser.ParseRuleInternal(RTInitSection) as TInitSectionNode;
    ADot := FParser.ParseToken(TTDot);
    Result := TUnitNode.Create(AUnit, AUnitName, ADirectives, ASemicolon,
      AInterface, AImplementation, AInit, ADot);
  except
    FreeAndNil(ADot);
    FreeAndNil(AInit);
    FreeAndNil(AImplementation);
    FreeAndNil(AInterface);
    FreeAndNil(ASemicolon);
    FreeAndNil(ADirectives);
    FreeAndNil(AUnitName);
    FreeAndNil(AUnit);
    raise;
  end;
end;

{ TUsedUnitRule }

function TUsedUnitRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTokenSets.TSIdent);
end;

function TUsedUnitRule.Evaluate: TASTNode;
var
  AName: TASTNode;
  AIn, AFileName: TToken;
begin
  AName := FParser.ParseRuleInternal(RTQualifiedIdent);
  AIn := nil;
  AFileName := nil;
  try
    if FParser.CanParseToken(TTInKeyword) then
    begin
      AIn := FParser.ParseToken(TTInKeyword);
      AFileName := FParser.ParseToken(TTStringLiteral);
    end;
    Result := TUsedUnitNode.Create(AName, AIn, AFileName);
  except
    FreeAndNil(AFileName);
    FreeANdNil(AIn);
    FreeAndNil(AName);
    raise;
  end;
end;

{ TUsesClauseRule }

function TUsesClauseRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTokenSets.TSUses);
end;

function TUsesClauseRule.Evaluate: TASTNode;
var
  AUses: TToken;
  AUnitList: TListNode;
  ASemicolon: TToken;
begin
  AUses := FParser.ParseToken(TTokenSets.TSUses);
  AUnitList := nil; ASemicolon := nil;
  try
    AUnitList := FParser.ParseDelimitedList(RTUsedUnit, TTComma);
    ASemicolon := FParser.ParseToken(TTSemicolon);
    Result := TUsesClauseNode.Create(AUses, AUnitList, ASemicolon);
  except
    FreeAndNil(ASemicolon);
    FreeAndNil(AUnitList);
    FreeAndNil(AUses);
    raise;
  end;
end;

{ TVarDeclRule }

function TVarDeclRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTokenSets.TSIdent);
end;

function TVarDeclRule.Evaluate: TASTNode;
var
  ANames, AFirstDirectives, ASecondDirectives: TListNode;
  AColon, AAbsolute, AEqual, ASemicolon: TToken;
  AType, AAbsoluteAddress, AValue: TASTNode;
begin
  ANames := nil; AFirstDirectives := nil; ASecondDirectives := nil;
  AColon := nil; AAbsolute := nil; AEqual := nil; ASemicolon := nil;
  AType := nil; AAbsoluteAddress := nil; AValue := nil;
  try

    ANames := FParser.ParseDelimitedList(RTIdent, TTComma);
    AColon := FParser.ParseToken(TTColon);
    AType := FParser.ParseRuleInternal(RTType);
    AFirstDirectives := FParser.ParseOptionalRuleList(RTPortabilityDirective);

    if FParser.CanParseToken(TTAbsoluteSemikeyword) then
    begin
      AAbsolute := FParser.ParseToken(TTAbsoluteSemikeyword);
      AAbsoluteAddress := FParser.ParseRuleInternal(RTExpression);
    end
    else if FParser.CanParseToken(TTEqualSign) then
    begin
      AEqual := FParser.ParseToken(TTEqualSign);
      AValue := FParser.ParseRuleInternal(RTTypedConstant);
    end;

    ASecondDirectives := FParser.ParseOptionalRuleList(RTPortabilityDirective);
    ASemicolon := FParser.ParseToken(TTSemicolon);

    Result := TVarDeclNode.Create(ANames, AColon, AType, AFirstDirectives,
      AAbsolute, AAbsoluteAddress, AEqual, AValue, ASecondDirectives, ASemicolon);
  except
    FreeAndNil(ASemicolon);
    FreeAndNil(ASecondDirectives);
    FreeAndNil(AValue);
    FreeAndNil(AEqual); FreeAndNil(AAbsoluteAddress); FreeAndNil(AAbsolute);
    FreeAndNil(AFirstDirectives); FreeAndNil(AType); FreeAndNil(AColon);
    FreeAndNil(ANames);
    raise;
  end;
end;

{ TVariantGroupRule }

function TVariantGroupRule.CanParse: Boolean;
begin
  Result := FParser.CanParseRule(RTExpressionList);
end;

function TVariantGroupRule.Evaluate: TASTNode;
var
  AValues, AFieldDeclList: TListNode;
  AColon, AOpen, AClose, ASemicolon: TToken;
  AVariantSection: TVariantSectionNode;
begin
  AValues := FParser.ParseRuleInternal(RTExpressionList) as TListNode;
  AColon := FParser.ParseToken(TTColon);
  AOpen := FParser.ParseToken(TTOpenParenthesis);
  AFieldDeclList := FParser.ParseOptionalRuleList(RTFieldDecl);

  AVariantSection := nil;
  if FParser.CanParseRule(RTVariantSection) then
    AVariantSection := FParser.ParseRuleInternal(RTVariantSection)
      as TVariantSectionNode;

  AClose := FParser.ParseToken(TTCloseParenthesis);

  ASemicolon := nil;
  if FParser.CanParseToken(TTSemicolon) then
    ASemicolon := FParser.ParseToken(TTSemicolon);

  Result := TVariantGroupNode.Create(AValues, AColon, AOpen, AFieldDeclList,
    AVariantSection, AClose, ASemicolon);
end;

{ TVariantSectionRule }

function TVariantSectionRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTCaseKeyword);
end;

function TVariantSectionRule.Evaluate: TASTNode;
var
  ACase, AName, AColon, AOf: TToken;
  AType: TASTNode;
  AVariantGroupList: TListNode;
begin
  ACase := FParser.ParseToken(TTCaseKeyword);

  AName := nil; AVariantGroupList := nil;
  AColon := nil; AType := nil; AOf := nil;
  try
    if (FParser.Peek(1) = TTColon) then
    begin
      AName := FParser.ParseRuleInternal(RTIdent) as TToken;
      AColon := FParser.ParseToken(TTColon);
    end;

    AType := FParser.ParseRuleInternal(RTQualifiedIdent);
    AOf := FParser.ParseToken(TTOfKeyword);

    AVariantGroupList := FParser.ParseRequiredRuleList(RTVariantGroup);
  except
    FreeAndNil(AVariantGroupList);
    FreeAndNil(AOf);
    FreeAndNil(AType);
    FreeAndNil(AColon);
    FreeAndNil(AName);
    FreeAndNil(ACase);
    raise;
  end;

  Result := TVariantSectionNode.Create(ACase, AName, AColon, AType, AOf,
    AVariantGroupList);
end;

{ TVarSectionRule }

function TVarSectionRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTokenSets.TSVarHeader);
end;

function TVarSectionRule.Evaluate: TASTNode;
var
  AVar: TToken;
  AVarList: TListNode;
begin
  AVar := FParser.ParseToken(TTokenSets.TSVarHeader);
  AVarList := nil;
  try
    AVarList := FParser.ParseRequiredRuleList(RTVarDecl);
    Result := TVarSectionNode.Create(AVar, AVarList);
  except
    FreeAndNil(AVar);
    raise;
  end;
end;

{ TVisibilityRule }

function TVisibilityRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTokenSets.TSVisibility);
end;

function TVisibilityRule.Evaluate: TASTNode;
var
  AStrict, AVisibility: TToken;
begin
  AStrict := nil; AVisibility := nil;
  try
    if FParser.CanParseToken(TTStrictSemikeyword) then
      AStrict := FParser.ParseToken(TTStrictSemikeyword);

    AVisibility := FParser.ParseToken(TTokenSets.TSVisibilitySingleWord);
    Result := TVisibilityNode.Create(AStrict, AVisibility);
  except
    FreeAndNil(AVisibility);
    FreeAndNil(AStrict);
    raise;
  end;
end;

{ TVisibilitySectionRule }

function TVisibilitySectionRule.CanParse: Boolean;
begin
  Result := FParser.CanParseRule(RTVisibility) or
    FParser.CanParseRule(RTVisibilitySectionContent);
end;

function TVisibilitySectionRule.Evaluate: TASTNode;
var
  AVisibility: TVisibilityNode;
  AContents: TListNode;
begin
  AVisibility := nil; AContents := nil;
  try
    if FParser.CanParseRule(RTVisibility) then
      AVisibility := FParser.ParseRuleInternal(RTVisibility) as TVisibilityNode;

    AContents := FParser.ParseOptionalRuleList(RTVisibilitySectionContent);
    Result := TVisibilitySectionNode.Create(AVisibility, AContents);
  except
    FreeAndNil(AContents);
    FreeAndNil(AVisibility);
    raise;
  end;
end;

{ TVisibilitySectionContentRule }

function TVisibilitySectionContentRule.CanParse: Boolean;
begin
  Result := FAlternator.LookAhead(FParser);
end;

constructor TVisibilitySectionContentRule.Create(AParser: IParser;
  ARuleType: TRuleType);
begin
  inherited Create(AParser, ARuleType);
  FAlternator := TAlternator.Create;
  FAlternator.AddRule(RTFieldSection);
  FAlternator.AddRule(RTMethodOrProperty);
  FAlternator.AddRule(RTConstSection);
  FAlternator.AddRule(RTTypeSection);
end;

destructor TVisibilitySectionContentRule.Destroy;
begin
  FAlternator.Free;
  inherited;
end;

function TVisibilitySectionContentRule.Evaluate: TASTNode;
begin
  Result := FAlternator.Execute(FParser);
end;

{ TWhileStatementRule }

function TWhileStatementRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTWhileKeyword);
end;

function TWhileStatementRule.Evaluate: TASTNode;
var
  AWhile, ADo: TToken;
  ACondition, AStatement: TASTNode;
begin
  // while a < b do ...

  AWhile := FParser.ParseToken(TTWhileKeyword);
  ACondition := nil; ADo := nil; AStatement := nil;
  try
    ACondition := FParser.ParseRuleInternal(RTExpression);
    ADo := FParser.ParseToken(TTDoKeyword);
    if FParser.CanParseRule(RTStatement) then
      AStatement := FParser.ParseRuleInternal(RTStatement);

    Result := TWhileStatementNode.Create(AWhile, ACondition, ADo, AStatement);
  except
    FreeAndNil(AStatement);
    FreeAndNil(ADo);
    FreeAndNil(ACondition);
    FreeAndNil(AWhile);
    raise;
  end;
end;

{ TWithStatementRule }

function TWithStatementRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTWithKeyword);
end;

function TWithStatementRule.Evaluate: TASTNode;
var
  AWith, ADo: TToken;
  AList: TListNode;
  AStatement: TASTNode;
begin
  AWith := FParser.ParseToken(TTWithKeyword);
  AList := nil; ADo := nil; AStatement := nil;
  try
    AList := FParser.ParseDelimitedList(RTExpression, TTComma);
    ADo := FParser.ParseToken(TTDoKeyword);
    if FParser.CanParseRule(RTStatement) then
      AStatement := FParser.ParseRuleInternal(RTStatement);

    Result := TWithStatementNode.Create(AWith, AList, ADo, AStatement);
  except
    FreeAndNil(AStatement);
    FreeAndNil(ADo);
    FreeAndNil(AList);
    FreeAndNil(AWith);
    raise;
  end;
end;

end.
