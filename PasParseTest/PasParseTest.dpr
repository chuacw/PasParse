program PasParseTest;

{$IF NOT DEFINED(DUNIT)}
{$APPTYPE CONSOLE}
{$ENDIF}
{$R *.res}
uses
  DUnitTestRunner,
  System.SysUtils,
  UTestLexScanner in 'UTestLexScanner.pas',
  UTestCompilerDefines in 'UTestCompilerDefines.pas',
  UTestASTNode in 'UTestASTNode.pas',
  UTestParser in 'UTestParser.pas',
  UTestAddOp in 'UTestAddOp.pas',
  UTestAlternator in 'UTestAlternator.pas',
  UTestAnonymousMethods in 'UTestAnonymousMethods.pas',
  UTestArrayType in 'UTestArrayType.pas',
  UTestAssemblerStatement in 'UTestAssemblerStatement.pas',
  UTestAssemblyAttribute in 'UTestAssemblyAttribute.pas',
  UTestAtom in 'UTestAtom.pas',
  UTestBareInherited in 'UTestBareInherited.pas',
  UTestBlock in 'UTestBlock.pas',
  UTestCaseSelector in 'UTestCaseSelector.pas',
  UTestCaseStatement in 'UTestCaseStatement.pas',
  UTestClassHelperType in 'UTestClassHelperType.pas',
  UTestClassOf in 'UTestClassOf.pas',
  UTestClassType in 'UTestClassType.pas',
  UTestConstSection in 'UTestConstSection.pas',
  UTestConstantDecl in 'UTestConstantDecl.pas',
  UTestConstraint in 'UTestConstraint.pas',
  UTestDirective in 'UTestDirective.pas',
  UTestEnumeratedType in 'UTestEnumeratedType.pas',
  UTestEnumeratedTypeElement in 'UTestEnumeratedTypeElement.pas',
  UTestExceptionItem in 'UTestExceptionItem.pas',
  UTestExportsItem in 'UTestExportsItem.pas',
  UTestExportsSpecifier in 'UTestExportsSpecifier.pas',
  UTestExportsStatement in 'UTestExportsStatement.pas',
  UTestExpression in 'UTestExpression.pas',
  UTestExpressionList in 'UTestExpressionList.pas',
  UTestExpressionOrAssignment in 'UTestExpressionOrAssignment.pas',
  UTestExpressionOrRange in 'UTestExpressionOrRange.pas',
  UTestExpressionOrRangeList in 'UTestExpressionOrRangeList.pas',
  UTestExtendedIdent in 'UTestExtendedIdent.pas',
  UTestFactor in 'UTestFactor.pas',
  UTestFancyBlock in 'UTestFancyBlock.pas',
  UTestFieldDecl in 'UTestFieldDecl.pas',
  UTestFieldSection in 'UTestFieldSection.pas',
  UTestFileLoader in 'UTestFileLoader.pas',
  UTestFileType in 'UTestFileType.pas',
  UTestForStatement in 'UTestForStatement.pas',
  UTestGenerics in 'UTestGenerics.pas',
  UTestGoal in 'UTestGoal.pas',
  UTestGotoStatement in 'UTestGotoStatement.pas',
  UTestIdent in 'UTestIdent.pas',
  UTestIdentList in 'UTestIdentList.pas',
  UTestIfStatement in 'UTestIfStatement.pas',
  UTestImplementationDecl in 'UTestImplementationDecl.pas',
  UTestImplementationSection in 'UTestImplementationSection.pas',
  UTestInitSection in 'UTestInitSection.pas',
  UTestInterfaceDecl in 'UTestInterfaceDecl.pas',
  UTestInterfaceSection in 'UTestInterfaceSection.pas',
  UTestInterfaceType in 'UTestInterfaceType.pas',
  UTestLabelDeclSection in 'UTestLabelDeclSection.pas',
  UTestLabelId in 'UTestLabelId.pas',
  UTestMemoryFileLoader in 'UTestMemoryFileLoader.pas',
  UTestMethodHeading in 'UTestMethodHeading.pas',
  UTestMethodImplementation in 'UTestMethodImplementation.pas',
  UTestMethodOrProperty in 'UTestMethodOrProperty.pas',
  UTestMethodReturnType in 'UTestMethodReturnType.pas',
  UTestMulOp in 'UTestMulOp.pas',
  UTestOpenArray in 'UTestOpenArray.pas',
  UTestPackage in 'UTestPackage.pas',
  UTestPackedType in 'UTestPackedType.pas',
  UTestParameter in 'UTestParameter.pas',
  UTestParameterExpression in 'UTestParameterExpression.pas',
  UTestParameterType in 'UTestParameterType.pas',
  UTestParenthesizedExpression in 'UTestParenthesizedExpression.pas',
  UTestParticle in 'UTestParticle.pas',
  UTestPointerType in 'UTestPointerType.pas',
  UTestPortabilityDirective in 'UTestPortabilityDirective.pas',
  UTestProcedureType in 'UTestProcedureType.pas',
  UTestProgram in 'UTestProgram.pas',
  UTestProperty in 'UTestProperty.pas',
  UTestPropertyDirective in 'UTestPropertyDirective.pas',
  UTestQualifiedIdent in 'UTestQualifiedIdent.pas',
  UTestRaiseStatement in 'UTestRaiseStatement.pas',
  UTestRecordFieldConstant in 'UTestRecordFieldConstant.pas',
  UTestRecordHelperType in 'UTestRecordHelperType.pas',
  UTestRecordType in 'UTestRecordType.pas',
  UTestRelOp in 'UTestRelOp.pas',
  UTestRepeatStatement in 'UTestRepeatStatement.pas',
  UTestRequiresClause in 'UTestRequiresClause.pas',
  UTestSetLiteral in 'UTestSetLiteral.pas',
  UTestSetType in 'UTestSetType.pas',
  UTestSimpleExpression in 'UTestSimpleExpression.pas',
  UTestSimpleStatement in 'UTestSimpleStatement.pas',
  UTestStatement in 'UTestStatement.pas',
  UTestStatementList in 'UTestStatementList.pas',
  UTestStringType in 'UTestStringType.pas',
  UTestTerm in 'UTestTerm.pas',
  UTestTryStatement in 'UTestTryStatement.pas',
  UTestType in 'UTestType.pas',
  UTestTypeDecl in 'UTestTypeDecl.pas',
  UTestTypeParam in 'UTestTypeParam.pas',
  UTestTypeParamDecl in 'UTestTypeParamDecl.pas',
  UTestTypeParams in 'UTestTypeParams.pas',
  UTestTypeSection in 'UTestTypeSection.pas',
  UTestTypedConstant in 'UTestTypedConstant.pas',
  UTestUnaryOperator in 'UTestUnaryOperator.pas',
  UTestUnit in 'UTestUnit.pas',
  UTestUsedUnit in 'UTestUsedUnit.pas',
  UTestUsesClause in 'UTestUsesClause.pas',
  UTestVarDecl in 'UTestVarDecl.pas',
  UTestVarSection in 'UTestVarSection.pas',
  UTestVariantGroup in 'UTestVariantGroup.pas',
  UTestVariantSection in 'UTestVariantSection.pas',
  UTestVisibility in 'UTestVisibility.pas',
  UTestVisibilitySection in 'UTestVisibilitySection.pas',
  UTestVisibilitySectionContent in 'UTestVisibilitySectionContent.pas',
  UTestVisitor in 'UTestVisitor.pas',
  UTestWhileStatement in 'UTestWhileStatement.pas',
  UTestWithStatement in 'UTestWithStatement.pas',
  UTestAttributes in 'UTestAttributes.pas',
  UTest in '..\PasTest\UTest.pas',
  UVisitor in '..\PasParse\UVisitor.pas',
  UTokenType in '..\PasParse\UTokenType.pas',
  UTokenSets in '..\PasParse\UTokenSets.pas',
  UTokenSet in '..\PasParse\UTokenSet.pas',
  UTokenRule in '..\PasParse\UTokenRule.pas',
  UTokenFilter in '..\PasParse\UTokenFilter.pas',
  UToken in '..\PasParse\UToken.pas',
  USingleTokenTokenSet in '..\PasParse\USingleTokenTokenSet.pas',
  URuleType in '..\PasParse\URuleType.pas',
  URules in '..\PasParse\URules.pas',
  URule in '..\PasParse\URule.pas',
  UPreprocessorException in '..\PasParse\UPreprocessorException.pas',
  UParser in '..\PasParse\UParser.pas',
  UParseException in '..\PasParse\UParseException.pas',
  UNonTerminalNode in '..\PasParse\UNonTerminalNode.pas',
  ULocation in '..\PasParse\ULocation.pas',
  UListNode in '..\PasParse\UListNode.pas',
  ULexScanner in '..\PasParse\ULexScanner.pas',
  ULexException in '..\PasParse\ULexException.pas',
  UITokenSet in '..\PasParse\UITokenSet.pas',
  UIParser in '..\PasParse\UIParser.pas',
  UInvalidOperationException in '..\PasParse\UInvalidOperationException.pas',
  UIFrame in '..\PasParse\UIFrame.pas',
  UIFileLoader in '..\PasParse\UIFileLoader.pas',
  UGeneratedNodes in '..\PasParse\UGeneratedNodes.pas',
  UFrame in '..\PasParse\UFrame.pas',
  UFileLoader in '..\PasParse\UFileLoader.pas',
  UEOFFrame in '..\PasParse\UEOFFrame.pas',
  UDelimitedItemNode in '..\PasParse\UDelimitedItemNode.pas',
  UCompilerDefines in '..\PasParse\UCompilerDefines.pas',
  UBaseException in '..\PasParse\UBaseException.pas',
  UASTNode in '..\PasParse\UASTNode.pas',
  UAlternator in '..\PasParse\UAlternator.pas',
  UTestTokenFilter in 'UTestTokenFilter.pas',
  UMemoryFileLoader in '..\PasParse\UMemoryFileLoader.pas',
  UAttrToken in 'UAttrToken.pas',
  TestFramework in 'TestFramework.pas';

begin
  ReportMemoryLeaksOnShutdown := True;
{$IF DEFINED(DUNIT)}
  IsConsole := False;
  DUnitTestRunner.RunRegisteredTests;
{$ELSE}
  try
// TODO -ochuacw: Enable generics testing
//    TTestGenerics.Test;
    TTestInitSection.Test;

    TTestASTNode.Test;
    TTestLexScanner.Test;
    TTestCompilerDefines.Test;
    TTestTokenFilter.Test;
    TTestAlternator.Test;
    TTestMemoryFileLoader.Test;
    TTestFileLoader.Test;

    TTestAddOp.Test;
    TTestAnonymousMethod.Test;
    TTestArrayType.Test;
    TTestAssemblerStatement.Test;
    TTestAssemblyAttribute.Test;
    TTestAtom.Test;
    TTestBareInherited.Test;
    TTestBlock.Test;
    TTestCaseSelector.Test;
    TTestCaseStatement.Test;
    TTestClassType.Test;
    TTestClassHelperType.Test;
    TTestClassOf.Test;
    TTestConstantDecl.Test;
    TTestConstraint.Test;
    TTestConstSection.Test;
    TTestDirective.Test;
    TTestEnumeratedType.Test;
    TTestEnumeratedTypeElement.Test;
    TTestExceptionItem.Test;
    TTestExportsItem.Test;
    TTestExportsSpecifier.Test;
    TTestExportsStatement.Test;
    TTestExpression.Test;
    TTestExpressionList.Test;
    TTestExpressionOrAssignment.Test;
    TTestExpressionOrRange.Test;
    TTestExpressionOrRangeList.Test;
    TTestExtendedIdent.Test;
    TTestFactor.Test;
    TTestFancyBlock.Test;
    TTestFieldDecl.Test;
    TTestFieldSection.Test;
    TTestFileType.Test;
    TTestForStatement.Test;
    TTestGoal.Test;
    TTestGotoStatement.Test;
    TTestIdent.Test;
    TTestIdentList.Test;
    TTestIfStatement.Test;
    TTestImplementationDecl.Test;
    TTestImplementationSection.Test;
    TTestInitSection.Test;
    TTestInterfaceDecl.Test;
    TTestInterfaceSection.Test;
    TTestInterfaceType.Test;
    TTestLabelDeclSection.Test;
    TTestLabelId.Test;
    TTestMethodHeading.Test;
    TTestMethodImplementation.Test;
    TTestMethodOrProperty.Test;
    TTestMethodReturnType.Test;
    TTestMulOp.Test;
    TTestOpenArray.Test;
    TTestPackage.Test;
    TTestPackedType.Test;
    TTestParameterExpression.Test;
    TTestParameter.Test;
    TTestParameterType.Test;
    TTestParenthesizedExpression.Test;
    TTestParticle.Test;
    TTestPointerType.Test;
    TTestPortabilityDirective.Test;
    TTestProcedureType.Test;
    TTestProgram.Test;
    TTestProperty.Test;
    TTestPropertyDirective.Test;
    TTestQualifiedIdent.Test;
    TTestRaiseStatement.Test;
    TTestRecordFieldConstant.Test;
    TTestRecordHelperType.Test;
    TTestRecordType.Test;
    TTestRelOp.Test;
    TTestRepeatStatement.Test;
    TTestRequiresClause.Test;
    TTestSetLiteral.Test;
    TTestSetType.Test;
    TTestSimpleExpression.Test;
    TTestSimpleStatement.Test;
    TTestStatement.Test;
    TTestStatementList.Test;
    TTestStringType.Test;
    TTestTerm.Test;
    TTestTryStatement.Test;
    TTestType.Test;
    TTestTypedConstant.Test;
    TTestTypeDecl.Test;
    TTestTypeParam.Test;
    TTestTypeParamDecl.Test;
    TTestTypeParams.Test;
    TTestTypeSection.Test;
    TTestUnaryOperator.Test;
    TTestUnit.Test;
    TTestUsedUnit.Test;
    TTestUsesClause.Test;
    TTestVarDecl.Test;
    TTestVariantGroup.Test;
    TTestVariantSection.Test;
    TTestVarSection.Test;
    TTestVisibility.Test;
    TTestVisibilitySection.Test;
    TTestVisibilitySectionContent.Test;
    TTestWhileStatement.Test;
    TTestWithStatement.Test;

    TTestVisitor.Test;
  except
    on E:Exception do
    begin
      Writeln(E.Classname, ': ', E.Message);
      Readln;
    end;
  end;
{$ENDIF}
end.
