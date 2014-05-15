unit URuleType;
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}
{$WEAKLINKRTTI ON}
interface

type
  /// Enum of all available rule types
  TRuleType = (
    RTAddOp,
    RTAnonymousMethodDecl,
    RTAnonymousMethodType,
    RTArrayType,
    RTAssemblerStatement,
    RTAssemblyAttribute,
    RTAttributes,
    RTAttributesBlock,
    RTAtom,
    RTBareInherited,
    RTBlock,
    RTCaseSelector,
    RTCaseStatement,
    RTClassHelperType,
    RTClassOfType,
    RTClassType,
    RTConstantDecl,
    RTConstraint,
    RTConstSection,
    RTConstSectionInClass,
    RTDirective,
    RTEnumeratedType,
    RTEnumeratedTypeElement,
    RTExceptionItem,
    RTExportsItem,
    RTExportsSpecifier,
    RTExportsStatement,
    RTExpression,
    RTExpressionList,
    RTExpressionOrAssignment,
    RTExpressionOrRange,
    RTExpressionOrRangeList,
    RTExtendedIdent,
    RTExternalSpecifier,
    RTFactor,
    RTFancyBlock,
    RTFieldDecl,
    RTFieldSection,
    RTFileType,
    RTForStatement,
    ///<summary>Goal -> ( Program | Package  | Library  | Unit )</summary>
    RTGoal,
    RTGotoStatement,
    RTIdent,
    RTIdentAttr,
    RTIdentAttrList,
    RTIdentList,
    RTIfStatement,
    RTImplementationDecl,
    RTImplementationSection,
    RTInitSection,
    RTInterfaceDecl,
    RTInterfaceSection,
    RTInterfaceType,
    RTLabelDeclSection,
    RTLabelId,
    RTMethodHeading,
    RTMethodImplementation,
    RTMethodOrProperty,
    RTMethodReturnType,
    RTMulOp,
    RTOpenArray,
    RTOpenArrayConstructor,
    RTPackage,
    RTPackedType,
    RTParameter,
    RTParameterExpression,
    RTParameterType,
    RTParenthesizedExpression,
    RTParticle,
    RTPointerType,
    RTPortabilityDirective,
    RTProcedureType,
    ///<summary>Handles program or library clause</summary>
    RTProgram,
    RTProperty,
    RTPropertyDirective,
    RTQualifiedIdent,
    RTQualifiedIdentTypeParams,
    RTRaiseStatement,
    RTRecordFieldConstant,
    RTRecordHelperType,
    RTRecordType,
    RTRelOp,
    RTRepeatStatement,
    RTRequiresClause,
    RTSetLiteral,
    RTSetType,
    RTSimpleExpression,
    RTSimpleParameterType,
    RTSimpleStatement,
    RTStatement,
    RTStatementList,
    RTStringType,
    RTTerm,
    RTTryStatement,
    RTType,
    RTTypedConstant,
    RTTypeDecl,
    RTTypeDeclInClass,
    RTTypeParam,
    RTTypeParamDecl,
    RTTypeParams,
    RTTypeParamsUsage,
    RTTypeRecordDirectives,
    RTTypeSection,
    RTTypeSectionInClass,
    RTUnaryOperator,
    RTUnit,
    RTUsedUnit,
    ///<summary>Handles uses clause</summary>
    RTUsesClause,
    RTVarDecl,
    RTVariantGroup,
    RTVariantSection,
    RTVarSection,
    RTVisibility,
    RTVisibilitySection,
    RTVisibilitySectionContent,
    RTWhileStatement,
    RTWithStatement
  );

implementation

end.
