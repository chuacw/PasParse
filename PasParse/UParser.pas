unit UParser;
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}
{$WEAKLINKRTTI ON}
interface

uses
  UCompilerDefines, UToken, UIFrame, UITokenSet, UTokenType, UListNode,
  UParseException, UIParser, URule, URuleType, UASTNode, UIFileLoader,
  System.Generics.Collections;

type
  TRuleClass = class of TRule;

  TParser = class(IParser)
  private
    FFirstFrame: IFrame;
    FNextFrame: IFrame;
    FRules: array[TRuleType] of TRule;

    class function FrameFromTokens(ATokens: TObjectList<TToken>): IFrame;
    function GetIsEOF: Boolean;

    procedure AddTokenRule(ARuleType: TRuleType; ATokenSet: ITokenSet);
    procedure AddRule(ARuleType: TRuleType; ARuleClass: TRuleClass);

  protected
    function GetNextFrame: IFrame; override;
    procedure SetNextFrame(const Value: IFrame); override;

  public
    constructor CreateFromText(const AText, AFileName: string;
      ACompilerDefines: TCompilerDefines; AFileLoader: IFileLoader);
    constructor CreateFromFrame(AFrame: IFrame);
    constructor CreateFromTokens(ATokens: TObjectList<TToken>);
    destructor Destroy; override;

    property IsEOF: Boolean read GetIsEOF;

    function ParseToken(ATokenSet: ITokenSet): TToken; overload; override;
    function ParseToken(ATokenType: TTokenType): TToken; overload; override;
    function ParseTokenList(ATokenSet: ITokenSet): TListNode; override;
    function CanParseToken(ATokenSet: ITokenSet; const APosition: Integer=0): Boolean; overload; override;
    function CanParseToken(ATokenType: TTokenType): Boolean; overload; override;
    function TryParseToken(ATokenType: TTokenType): TToken; override;

    function ParseDelimitedList(AItemRule: TRuleType; ADelimiterType: TTokenType): TListNode; override;
    function ParseRequiredRuleList(ARuleType: TRuleType): TListNode; override;
    function ParseOptionalRuleList(ARuleType: TRuleType): TListNode; override;
    function ParseOptionalStatementList: TListNode; override;
    function ParseRule(ARuleType: TRuleType): TASTNode;
    function CanParseRule(ARuleType: TRuleType): Boolean; override;
    function ParseRuleInternal(ARuleType: TRuleType): TASTNode; override;

    function CreateEmptyListNode: TListNode; override;

    function Peek(AOffset: Integer): TTokenType; override;
    procedure MoveNext; override;

    function Failure(const AExpected: string): EParseException; override;
  end;

implementation

uses
  ULexScanner, UEOFFrame, ULocation, UFrame, USingleTokenTokenSet, UTokenRule,
  UTokenSets, URules, UDelimitedItemNode, UTokenFilter, System.SysUtils;

{ TParser }

function TParser.CanParseRule(ARuleType: TRuleType): Boolean;
begin
  Result := FRules[ARuleType].CanParse;
end;

function TParser.CanParseToken(ATokenType: TTokenType): Boolean;
begin
  Result := (Peek(0) = ATokenType);
end;

procedure TParser.AddRule(ARuleType: TRuleType; ARuleClass: TRuleClass);
begin
  FRules[ARuleType] := ARuleClass.Create(Self, ARuleType);
end;

procedure TParser.AddTokenRule(ARuleType: TRuleType; ATokenSet: ITokenSet);
begin
  FRules[ARuleType] := TTokenRule.Create(Self, ARuleType, ATokenSet);
end;

function TParser.CanParseToken(ATokenSet: ITokenSet; const APosition: Integer=0): Boolean;
begin
  Result := ATokenSet.Contains(Peek(APosition));
end;

function TParser.CreateEmptyListNode: TListNode;
var
  AList: TObjectList<TASTNode>;
begin
  Exit(nil);

  AList := TObjectList<TASTNode>.Create;
  Result := TListNode.Create(AList);
  AList.Free;
end;

constructor TParser.CreateFromFrame(AFrame: IFrame);
begin
  inherited Create;
  FFirstFrame := AFrame;
  FNextFrame := AFrame;
//  SetLength(FRules, Integer(High(TRuleType)) + 1);

  AddRule(RTAnonymousMethodDecl, TAnonymousMethodDeclRule);
  AddRule(RTAnonymousMethodType, TAnonymousMethodTypeRule);
  AddRule(RTArrayType, TArrayTypeRule);
  AddRule(RTAssemblerStatement, TAssemblerStatementRule);
  AddRule(RTAssemblyAttribute, TAssemblyAttributeRule);
  AddRule(RTAttributes, TAttributeRule);
  AddRule(RTAttributesBlock, TAttributesBlockRule);
  AddRule(RTAtom, TAtomRule);
  AddRule(RTBareInherited, TBareInheritedRule);
  AddRule(RTBlock, TBlockRule);
  AddRule(RTCaseSelector, TCaseSelectorRule);
  AddRule(RTCaseStatement, TCaseStatementRule);
  AddRule(RTClassHelperType, TClassHelperTypeRule);
  AddRule(RTClassOfType, TClassOfTypeRule);
  AddRule(RTClassType, TClassTypeRule);
  AddRule(RTConstantDecl, TConstantDeclRule);
  AddRule(RTConstraint, TConstraintRule);
  AddRule(RTConstSection, TConstSectionRule);
//  AddRule(RTConstSectionInClass, TConstSectionInClassRule);
  AddRule(RTDirective, TDirectiveRule);
  AddRule(RTEnumeratedType, TEnumeratedTypeRule);
  AddRule(RTEnumeratedTypeElement, TEnumeratedTypeElementRule);
  AddRule(RTExceptionItem, TExceptionItemRule);
  AddRule(RTExportsItem, TExportsItemRule);
  AddRule(RTExportsSpecifier, TExportsSpecifierRule);
  AddRule(RTExportsStatement, TExportsStatementRule);
  AddRule(RTExpression, TExpressionRule);
  AddRule(RTExpressionList, TExpressionListRule);
  AddRule(RTExpressionOrAssignment, TExpressionOrAssignmentRule);
  AddRule(RTExpressionOrRange, TExpressionOrRangeRule);
  AddRule(RTExpressionOrRangeList, TExpressionOrRangeListRule);
  AddRule(RTExtendedIdent, TExtendedIdentRule);
  AddRule(RTExternalSpecifier, TExternalSpecifierRule);
  AddRule(RTFactor, TFactorRule);
  AddRule(RTFancyBlock, TFancyBlockRule);
  AddRule(RTFieldDecl, TFieldDeclRule);
  AddRule(RTFieldSection, TFieldSectionRule);
  AddRule(RTFileType, TFileTypeRule);
  AddRule(RTForStatement, TForStatementRule);
  AddRule(RTGoal, TGoalRule);
  AddRule(RTGotoStatement, TGotoStatementRule);
  AddRule(RTIdent, TIdentRule);
  AddRule(RTIdentAttr, TIdentAttrRule);
  AddRule(RTIdentList, TIdentListRule);
  AddRule(RTIdentAttrList, TIdentAttrListRule);
  AddRule(RTIfStatement, TIfStatementRule);
  AddRule(RTImplementationDecl, TImplementationDeclRule);
  AddRule(RTImplementationSection, TImplementationSectionRule);
  AddRule(RTInitSection, TInitSectionRule);
  AddRule(RTInterfaceDecl, TInterfaceDeclRule);
  AddRule(RTInterfaceSection, TInterfaceSectionRule);
  AddRule(RTInterfaceType, TInterfaceTypeRule);
  AddRule(RTLabelDeclSection, TLabelDeclSectionRule);
  AddRule(RTLabelId, TLabelIdRule);
  AddRule(RTMethodHeading, TMethodHeadingRule);
  AddRule(RTMethodImplementation, TMethodImplementationRule);
  AddRule(RTMethodOrProperty, TMethodOrPropertyRule);
  AddRule(RTMethodReturnType, TMethodReturnTypeRule);
  AddRule(RTOpenArray, TOpenArrayRule);
  AddRule(RTOpenArrayConstructor, TOpenArrayConstructorRule);
  AddRule(RTPackage, TPackageRule);
  AddRule(RTPackedType, TPackedTypeRule);
  AddRule(RTParameter, TParameterRule);
  AddRule(RTParameterExpression, TParameterExpressionRule);
  AddRule(RTParameterType, TParameterTypeRule);
  AddRule(RTParenthesizedExpression, TParenthesizedExpressionRule);
  AddRule(RTParticle, TParticleRule);
  AddRule(RTPointerType, TPointerTypeRule);
  AddRule(RTProcedureType, TProcedureTypeRule);
  AddRule(RTProgram, TProgramRule);
  AddRule(RTProperty, TPropertyRule);
  AddRule(RTPropertyDirective, TPropertyDirectiveRule);
  AddRule(RTQualifiedIdent, TQualifiedIdentRule);
  AddRule(RTQualifiedIdentTypeParams, TQualifiedIdentTypeParamsRule);
  AddRule(RTRaiseStatement, TRaiseStatementRule);
  AddRule(RTRecordFieldConstant, TRecordFieldConstantRule);
  AddRule(RTRecordHelperType, TRecordHelperTypeRule);
  AddRule(RTRecordType, TRecordTypeRule);
  AddRule(RTRepeatStatement, TRepeatStatementRule);
  AddRule(RTRequiresClause, TRequiresClauseRule);
  AddRule(RTSetLiteral, TSetLiteralRule);
  AddRule(RTSetType, TSetTypeRule);
  AddRule(RTSimpleExpression, TSimpleExpressionRule);
  AddRule(RTSimpleParameterType, TSimpleParameterRule);
  AddRule(RTSimpleStatement, TSimpleStatementRule);
  AddRule(RTStatement, TStatementRule);
  AddRule(RTStatementList, TStatementListRule);
  AddRule(RTStringType, TStringTypeRule);
  AddRule(RTTerm, TTermRule);
  AddRule(RTTryStatement, TTryStatementRule);
//  AddRule(RTType, TTypeRule);
  AddRule(RTType, TTypeRHSRule); // to test out generic params on RHS of type decl
  AddRule(RTTypedConstant, TTypedConstantRule);
  AddRule(RTTypeDecl, TTypeDeclRule);
  AddRule(RTTypeDeclInClass, TTypeDeclInClassRule);
  AddRule(RTTypeParam, TTypeParamRule);
  AddRule(RTTypeParamDecl, TTypeParamDeclRule);
  AddRule(RTTypeParams, TTypeParamsRule);
  AddRule(RTTypeParamsUsage, TTypeParamsUsageRule);
  AddRule(RTTypeRecordDirectives, TTypeRecordDirectivesRule);
  AddRule(RTTypeSection, TTypeSectionRule);
  AddRule(RTTypeSectionInClass, TTypeSectionInClassRule);
  AddRule(RTUnit, TUnitRule);
  AddRule(RTUsedUnit, TUsedUnitRule);
  AddRule(RTUsesClause, TUsesClauseRule);
  AddRule(RTVarDecl, TVarDeclRule);
  AddRule(RTVariantGroup, TVariantGroupRule);
  AddRule(RTVariantSection, TVariantSectionRule);
  AddRule(RTVarSection, TVarSectionRule);
  AddRule(RTVisibility, TVisibilityRule);
  AddRule(RTVisibilitySection, TVisibilitySectionRule);
  AddRule(RTVisibilitySectionContent, TVisibilitySectionContentRule);
  AddRule(RTWhileStatement, TWhileStatementRule);
  AddRule(RTWithStatement, TWithStatementRule);

  AddTokenRule(RTAddOp, TTokenSets.TSAddOp);
  AddTokenRule(RTMulOp, TTokenSets.TSMulOp);
//  AddTokenRule(RTPortabilityDirective, TTokenSets.TSPortabilityDirective);
  AddRule(RTPortabilityDirective, TPortabilityDirectiveRule);
  AddTokenRule(RTRelOp, TTokenSets.TSRelOp);
  AddTokenRule(RTUnaryOperator, TTokenSets.TSUnaryOperator);
end;

constructor TParser.CreateFromText(const AText, AFileName: string;
  ACompilerDefines: TCompilerDefines; AFileLoader: IFileLoader);
var
  ALexScanner: TLexScanner;
  ATokens, AFilteredTokens: TObjectList<TToken>;
  ATokenFilter: TTokenFilter;
begin
  ALexScanner := TLexScanner.Create(AText, AFileName);
  try
    ATokens := ALexScanner.Tokens;
    try
      ATokenFilter := TTokenFilter.Create(ATokens, ACompilerDefines, AFileLoader);
      try
        AFilteredTokens := ATokenFilter.Tokens;
        try
          CreateFromTokens(AFilteredTokens);
        finally
          AFilteredTokens.Free;
        end;
      finally
        ATokenFilter.Free;
      end;
    finally
      ATokens.Free;
    end;
  finally
    ALexScanner.Free;
  end;
end;

constructor TParser.CreateFromTokens(ATokens: TObjectList<TToken>);
begin
  CreateFromFrame(FrameFromTokens(ATokens));
end;

destructor TParser.Destroy;
var
  AFrame: IFrame;
  ARuleType: TRuleType;
begin
  for ARuleType := Low(FRules) to High(FRules) do
    FRules[ARuleType].Free;

//  SetLength(FRules, 0);

  if (FNextFrame <> nil) and FNextFrame.IsEOF and (FNextFrame <> FFirstFrame) then
    FNextFrame.Free;

  FNextFrame := FFirstFrame;
  while (FNextFrame <> nil) and (not FNextFrame.IsEOF) do
  begin
    AFrame := FNextFrame;
    FNextFrame := FNextFrame.Next;
    AFrame.Free;
  end;

  FNextFrame.Free;
  inherited;
end;

function TParser.Failure(const AExpected: string): EParseException;
begin
  Result := EParseException.Create('Expected ' + AExpected + ' but was ' +
    FNextFrame.DisplayName, FNextFrame.Location.Clone);
end;

class function TParser.FrameFromTokens(ATokens: TObjectList<TToken>): IFrame;
var
  AFirstFrame: IFrame;
  APrevFrame: IFrame;
  AFrame: IFrame;
  I: Integer;
begin
  AFirstFrame := TEOFFrame.Create(TLocation.Create('', '', 0, 0));
  APrevFrame := nil;
  for I := 0 to ATokens.Count - 1 do
  begin
    AFrame := TFrame.Create(ATokens[I] as TToken);
    if APrevFrame <> nil then
      APrevFrame.Next := AFrame
    else
    begin
      AFirstFrame.Free;
      AFirstFrame := AFrame;
    end;

    APrevFrame := AFrame;
  end;

  Result := AFirstFrame;
end;

function TParser.GetIsEOF: Boolean;
begin
  Result := FNextFrame.IsEOF;
end;

function TParser.GetNextFrame: IFrame;
begin
  Result := FNextFrame;
end;

procedure TParser.MoveNext;
begin
  FNextFrame := FNextFrame.Next;
end;

function TParser.ParseToken(ATokenType: TTokenType): TToken;
var
  ASingleTokenTokenSet: TSingleTokenTokenSet;
begin
  ASingleTokenTokenSet := TSingleTokenTokenSet.Create(ATokenType);
  try
    Result := ParseToken(ASingleTokenTokenSet);
  finally
    ASingleTokenTokenSet.Free;
  end;
end;

function TParser.ParseDelimitedList(AItemRule: TRuleType;
  ADelimiterType: TTokenType): TListNode;
var
  AItems: TObjectList<TASTNode>;
  AItem: TASTNode;
  ADelimiter: TToken;
begin
  AItems := TObjectList<TASTNode>.Create(False);
  AItem := nil;
  ADelimiter := nil; Result := nil;
  try
    try
      repeat
        AItem := ParseRuleInternal(AItemRule);
        if CanParseToken(ADelimiterType) then
          ADelimiter := ParseToken(ADelimiterType);

        AItems.Add(TDelimitedItemNode.Create(AItem, ADelimiter));
        ADelimiter := nil; AItem := nil;
      until (not CanParseRule(AItemRule));

      Result := TListNode.Create(AItems);
    except
      FreeAndNil(ADelimiter);
      FreeAndNil(AItem);
      AItems.OwnsObjects := True;
      raise;
    end;
  finally
    AItems.Free;
  end;
end;

function TParser.ParseOptionalRuleList(ARuleType: TRuleType): TListNode;
var
  AItems: TObjectList<TASTNode>;
  AItem: TASTNode;
begin
  Result := nil;
  AItems := TObjectList<TASTNode>.Create(False);
  try
    try
      while CanParseRule(ARuleType) do
        begin
          AItem := ParseRuleInternal(ARuleType);
          AItems.Add(AItem);
        end;
      if AItems.Count>0 then
        Result := TListNode.Create(AItems);
    except
      AItems.OwnsObjects := True;
      raise;
    end;
  finally
    AItems.Free;
  end;
end;

function TParser.ParseOptionalStatementList: TListNode;
begin
  if CanParseRule(RTStatementList) then
    Result := ParseRuleInternal(RTStatementList) as TListNode
  else
    Result := nil; //CreateEmptyListNode;
end;

function TParser.ParseRequiredRuleList(ARuleType: TRuleType): TListNode;
var
  AItems: TObjectList<TASTNode>;
  AItem: TASTNode;
begin
  Result := nil;
  AItems := TObjectList<TASTNode>.Create(False);
  try
    try
      repeat
        AItem := ParseRuleInternal(ARuleType);
        AItems.Add(AItem);
      until (not CanParseRule(ARuleType));
      Result := TListNode.Create(AItems);
    except
      AItems.OwnsObjects := True;
      raise;
    end;
  finally
    AItems.Free;
  end;
end;

function TParser.ParseRule(ARuleType: TRuleType): TASTNode;
begin
  Result := ParseRuleInternal(ARuleType);
  Result.BuildParentReferences(nil);
end;

function TParser.ParseRuleInternal(ARuleType: TRuleType): TASTNode;
begin
  Result := FRules[ARuleType].Execute;
end;

function TParser.ParseToken(ATokenSet: ITokenSet): TToken;
begin
  Result := FNextFrame.ParseToken(ATokenSet);
  MoveNext;
end;

function TParser.ParseTokenList(ATokenSet: ITokenSet): TListNode;
var
  AList: TObjectList<TASTNode>;
  AToken: TToken;
begin
  AList := TObjectList<TASTNode>.Create(False);

  while CanParseToken(ATokenSet) do
    begin
      AToken := ParseToken(ATokenSet);
      AList.Add(AToken);
    end;

  if AList.Count>0 then
    Result := TListNode.Create(AList) else
    Result := nil;

  AList.Free;
end;

function TParser.Peek(AOffset: Integer): TTokenType;
var
  AFrame: IFrame;
begin
  AFrame := FNextFrame;
  while AOffset > 0 do
  begin
    AFrame := AFrame.Next;
    Dec(AOffset);
  end;
  Result := AFrame.TokenType;

  if (AFrame <> FNextFrame) and (AFrame.IsEOF) then
    AFrame.Free;
end;

procedure TParser.SetNextFrame(const Value: IFrame);
begin
  FNextFrame := Value;
end;

function TParser.TryParseToken(ATokenType: TTokenType): TToken;
begin
  if CanParseToken(ATokenType) then
    Result := ParseToken(ATokenType)
  else
    Result := nil;
end;

end.

