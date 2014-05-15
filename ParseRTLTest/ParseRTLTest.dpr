program ParseRTLTest;

{$R *.res}
{$APPTYPE GUI}
uses
  DUnitTestRunner,
  System.SysUtils,
  UTest in 'UTest.pas',
  UAlternator in '..\PasParse\UAlternator.pas',
  UASTNode in '..\PasParse\UASTNode.pas',
  UBaseException in '..\PasParse\UBaseException.pas',
  UCompilerDefines in '..\PasParse\UCompilerDefines.pas',
  UDelimitedItemNode in '..\PasParse\UDelimitedItemNode.pas',
  UEOFFrame in '..\PasParse\UEOFFrame.pas',
  UFileLoader in '..\PasParse\UFileLoader.pas',
  UFrame in '..\PasParse\UFrame.pas',
  UGeneratedNodes in '..\PasParse\UGeneratedNodes.pas',
  UIFileLoader in '..\PasParse\UIFileLoader.pas',
  UIFrame in '..\PasParse\UIFrame.pas',
  UInvalidOperationException in '..\PasParse\UInvalidOperationException.pas',
  UIOException in '..\PasParse\UIOException.pas',
  UIParser in '..\PasParse\UIParser.pas',
  UITokenSet in '..\PasParse\UITokenSet.pas',
  ULexException in '..\PasParse\ULexException.pas',
  ULexScanner in '..\PasParse\ULexScanner.pas',
  UListNode in '..\PasParse\UListNode.pas',
  ULocation in '..\PasParse\ULocation.pas',
  UMemoryFileLoader in '..\PasParse\UMemoryFileLoader.pas',
  UNonTerminalNode in '..\PasParse\UNonTerminalNode.pas',
  UParseException in '..\PasParse\UParseException.pas',
  UParser in '..\PasParse\UParser.pas',
  UPreprocessorException in '..\PasParse\UPreprocessorException.pas',
  URule in '..\PasParse\URule.pas',
  URules in '..\PasParse\URules.pas',
  URuleType in '..\PasParse\URuleType.pas',
  USingleTokenTokenSet in '..\PasParse\USingleTokenTokenSet.pas',
  UToken in '..\PasParse\UToken.pas',
  UTokenFilter in '..\PasParse\UTokenFilter.pas',
  UTokenRule in '..\PasParse\UTokenRule.pas',
  UTokenSet in '..\PasParse\UTokenSet.pas',
  UTokenSets in '..\PasParse\UTokenSets.pas',
  UTokenType in '..\PasParse\UTokenType.pas',
  UVisitor in '..\PasParse\UVisitor.pas',
  TestFramework in '..\PasParseTest\TestFramework.pas',
  GUITestRunner in 'GUITestRunner.pas' {GUITestRunner},
  UTestAndroidapi_AppGlue in 'UTestAndroidapi_AppGlue.pas',
  UTestAndroidapi_AssetManager in 'UTestAndroidapi_AssetManager.pas',
  UTestAndroidapi_AssetManagerJni in 'UTestAndroidapi_AssetManagerJni.pas',
  UTestAndroidapi_Bitmap in 'UTestAndroidapi_Bitmap.pas',
  UTestAndroidapi_Configuration in 'UTestAndroidapi_Configuration.pas',
  UTestAndroidapi_Consts in 'UTestAndroidapi_Consts.pas',
  UTestAndroidapi_Egl in 'UTestAndroidapi_Egl.pas',
  UTestAndroidapi_Eglext in 'UTestAndroidapi_Eglext.pas',
  UTestAndroidapi_EglPlatform in 'UTestAndroidapi_EglPlatform.pas',
  UTestAndroidapi_Gles in 'UTestAndroidapi_Gles.pas',
  UTestAndroidapi_Gles2 in 'UTestAndroidapi_Gles2.pas',
  UTestAndroidapi_Gles2ext in 'UTestAndroidapi_Gles2ext.pas',
  UTestAndroidapi_Glesext in 'UTestAndroidapi_Glesext.pas',
  UTestAndroidapi_Helpers in 'UTestAndroidapi_Helpers.pas',
  UTestAndroidapi_Input in 'UTestAndroidapi_Input.pas',
  UTestAndroidapi_IOUtils in 'UTestAndroidapi_IOUtils.pas',
  UTestAndroidapi_Jni in 'UTestAndroidapi_Jni.pas',
  UTestAndroidapi_JNI_AdMob in 'UTestAndroidapi_JNI_AdMob.pas',
  UTestAndroidapi_JNI_Analytics in 'UTestAndroidapi_JNI_Analytics.pas',
  UTestAndroidapi_JNI_ApkExpansion in 'UTestAndroidapi_JNI_ApkExpansion.pas',
  UTestAndroidapi_JNI_App in 'UTestAndroidapi_JNI_App.pas',
  UTestAndroidapi_JNI_Dalvik in 'UTestAndroidapi_JNI_Dalvik.pas',
  UTestAndroidapi_JNI_Embarcadero in 'UTestAndroidapi_JNI_Embarcadero.pas',
  UTestAndroidapi_JNI_GraphicsContentViewText in 'UTestAndroidapi_JNI_GraphicsContentViewText.pas',
  UTestAndroidapi_JNI_Hardware in 'UTestAndroidapi_JNI_Hardware.pas',
  UTestAndroidapi_JNI_InAppBilling in 'UTestAndroidapi_JNI_InAppBilling.pas',
  UTestAndroidapi_JNI_InputMethodService in 'UTestAndroidapi_JNI_InputMethodService.pas',
  UTestAndroidapi_JNI_Java_Security in 'UTestAndroidapi_JNI_Java_Security.pas',
  UTestAndroidapi_JNI_JavaTypes in 'UTestAndroidapi_JNI_JavaTypes.pas',
  UTestAndroidapi_JNI_Licensing in 'UTestAndroidapi_JNI_Licensing.pas',
  UTestAndroidapi_JNI_Location in 'UTestAndroidapi_JNI_Location.pas',
  UTestAndroidapi_JNI_Media in 'UTestAndroidapi_JNI_Media.pas',
  UTestAndroidapi_JNI_Net in 'UTestAndroidapi_JNI_Net.pas',
  UTestAndroidapi_JNI_OpenGL in 'UTestAndroidapi_JNI_OpenGL.pas',
  UTestAndroidapi_JNI_Os in 'UTestAndroidapi_JNI_Os.pas',
  UTestAndroidapi_JNI_PlayServices in 'UTestAndroidapi_JNI_PlayServices.pas',
  UTestAndroidapi_JNI_PlayServices_GCM in 'UTestAndroidapi_JNI_PlayServices_GCM.pas',
  UTestAndroidapi_JNI_Provider in 'UTestAndroidapi_JNI_Provider.pas',
  UTestAndroidapi_JNI_Support in 'UTestAndroidapi_JNI_Support.pas',
  UTestAndroidapi_JNI_Telephony in 'UTestAndroidapi_JNI_Telephony.pas',
  UTestAndroidapi_JNI_Util in 'UTestAndroidapi_JNI_Util.pas',
  UTestAndroidapi_JNI_VideoView in 'UTestAndroidapi_JNI_VideoView.pas',
  UTestAndroidapi_JNI_Webkit in 'UTestAndroidapi_JNI_Webkit.pas',
  UTestAndroidapi_JNI_Widget in 'UTestAndroidapi_JNI_Widget.pas',
  UTestAndroidapi_JNIBridge in 'UTestAndroidapi_JNIBridge.pas',
  UTestAndroidapi_JNIMarshal in 'UTestAndroidapi_JNIMarshal.pas',
  UTestAndroidapi_KeyCodes in 'UTestAndroidapi_KeyCodes.pas',
  UTestAndroidapi_KhrPlatform in 'UTestAndroidapi_KhrPlatform.pas',
  UTestAndroidapi_Log in 'UTestAndroidapi_Log.pas',
  UTestAndroidapi_Looper in 'UTestAndroidapi_Looper.pas',
  UTestAndroidapi_NativeActivity in 'UTestAndroidapi_NativeActivity.pas',
  UTestAndroidapi_NativeWindow in 'UTestAndroidapi_NativeWindow.pas',
  UTestAndroidapi_NativeWindowJni in 'UTestAndroidapi_NativeWindowJni.pas',
  UTestAndroidapi_Obb in 'UTestAndroidapi_Obb.pas',
  UTestAndroidapi_OpenSles in 'UTestAndroidapi_OpenSles.pas',
  UTestAndroidapi_Rect in 'UTestAndroidapi_Rect.pas',
  UTestAndroidapi_Sensor in 'UTestAndroidapi_Sensor.pas',
  UTestAndroidapi_StorageManager in 'UTestAndroidapi_StorageManager.pas',
  UTestAndroidapi_Timer in 'UTestAndroidapi_Timer.pas',
  UTestiOSapi_AssetsLibrary in 'UTestiOSapi_AssetsLibrary.pas',
  UTestiOSapi_AVFoundation in 'UTestiOSapi_AVFoundation.pas',
  UTestiOSapi_CocoaTypes in 'UTestiOSapi_CocoaTypes.pas',
  UTestiOSapi_CoreAudio in 'UTestiOSapi_CoreAudio.pas',
  UTestiOSapi_CoreData in 'UTestiOSapi_CoreData.pas',
  UTestiOSapi_CoreGraphics in 'UTestiOSapi_CoreGraphics.pas',
  UTestiOSapi_CoreImage in 'UTestiOSapi_CoreImage.pas',
  UTestiOSapi_CoreLocation in 'UTestiOSapi_CoreLocation.pas',
  UTestiOSapi_CoreMedia in 'UTestiOSapi_CoreMedia.pas',
  UTestiOSapi_CoreMotion in 'UTestiOSapi_CoreMotion.pas',
  UTestiOSapi_CoreTelephony in 'UTestiOSapi_CoreTelephony.pas',
  UTestiOSapi_CoreText in 'UTestiOSapi_CoreText.pas',
  UTestiOSapi_CoreVideo in 'UTestiOSapi_CoreVideo.pas',
  UTestiOSapi_Foundation in 'UTestiOSapi_Foundation.pas',
  UTestiOSapi_GLKit in 'UTestiOSapi_GLKit.pas',
  UTestiOSapi_iAd in 'UTestiOSapi_iAd.pas',
  UTestiOSapi_MediaPlayer in 'UTestiOSapi_MediaPlayer.pas',
  UTestiOSapi_OpenGLES in 'UTestiOSapi_OpenGLES.pas',
  UTestiOSapi_QuartzCore in 'UTestiOSapi_QuartzCore.pas',
  UTestiOSapi_StoreKit in 'UTestiOSapi_StoreKit.pas',
  UTestiOSapi_UIKit in 'UTestiOSapi_UIKit.pas',
  UTestMacapi_AppKit in 'UTestMacapi_AppKit.pas',
  UTestMacapi_AVFoundation in 'UTestMacapi_AVFoundation.pas',
  UTestMacapi_CocoaTypes in 'UTestMacapi_CocoaTypes.pas',
  UTestMacapi_Consts in 'UTestMacapi_Consts.pas',
  UTestMacapi_CoreFoundation in 'UTestMacapi_CoreFoundation.pas',
  UTestMacapi_CoreGraphics in 'UTestMacapi_CoreGraphics.pas',
  UTestMacapi_CoreLocation in 'UTestMacapi_CoreLocation.pas',
  UTestMacapi_CoreMedia in 'UTestMacapi_CoreMedia.pas',
  UTestMacapi_CoreServices in 'UTestMacapi_CoreServices.pas',
  UTestMacapi_CoreText in 'UTestMacapi_CoreText.pas',
  UTestMacapi_CoreVideo in 'UTestMacapi_CoreVideo.pas',
  UTestMacapi_Dispatch in 'UTestMacapi_Dispatch.pas',
  UTestMacapi_Foundation in 'UTestMacapi_Foundation.pas',
  UTestMacapi_Helpers in 'UTestMacapi_Helpers.pas',
  UTestMacapi_ImageIO in 'UTestMacapi_ImageIO.pas',
  UTestMacapi_KeyCodes in 'UTestMacapi_KeyCodes.pas',
  UTestMacapi_Mach in 'UTestMacapi_Mach.pas',
  UTestMacapi_ObjCRuntime in 'UTestMacapi_ObjCRuntime.pas',
  UTestMacapi_ObjectiveC in 'UTestMacapi_ObjectiveC.pas',
  UTestMacapi_OCBlocks in 'UTestMacapi_OCBlocks.pas',
  UTestMacapi_OCMarshal in 'UTestMacapi_OCMarshal.pas',
  UTestMacapi_OpenGL in 'UTestMacapi_OpenGL.pas',
  UTestMacapi_PrintCore in 'UTestMacapi_PrintCore.pas',
  UTestMacapi_QTKit in 'UTestMacapi_QTKit.pas',
  UTestMacapi_QuartzCore in 'UTestMacapi_QuartzCore.pas',
  UTestMacapi_Quicktime in 'UTestMacapi_Quicktime.pas',
  UTestMacapi_Security in 'UTestMacapi_Security.pas',
  UTestMacapi_SystemConfiguration in 'UTestMacapi_SystemConfiguration.pas',
  UTestMacapi_VecLib in 'UTestMacapi_VecLib.pas',
  UTestPosix_ArpaInet in 'UTestPosix_ArpaInet.pas',
  UTestPosix_Base in 'UTestPosix_Base.pas',
  UTestPosix_Dirent in 'UTestPosix_Dirent.pas',
  UTestPosix_Dlfcn in 'UTestPosix_Dlfcn.pas',
  UTestPosix_Errno in 'UTestPosix_Errno.pas',
  UTestPosix_Fcntl in 'UTestPosix_Fcntl.pas',
  UTestPosix_Fnmatch in 'UTestPosix_Fnmatch.pas',
  UTestPosix_Grp in 'UTestPosix_Grp.pas',
  UTestPosix_Iconv in 'UTestPosix_Iconv.pas',
  UTestPosix_Langinfo in 'UTestPosix_Langinfo.pas',
  UTestPosix_Limits in 'UTestPosix_Limits.pas',
  UTestPosix_Locale in 'UTestPosix_Locale.pas',
  UTestPosix_NetDB in 'UTestPosix_NetDB.pas',
  UTestPosix_NetIf in 'UTestPosix_NetIf.pas',
  UTestPosix_NetinetIcmp6 in 'UTestPosix_NetinetIcmp6.pas',
  UTestPosix_NetinetIn in 'UTestPosix_NetinetIn.pas',
  UTestPosix_NetinetIp6 in 'UTestPosix_NetinetIp6.pas',
  UTestPosix_NetinetTCP in 'UTestPosix_NetinetTCP.pas',
  UTestPosix_NetinetUDP in 'UTestPosix_NetinetUDP.pas',
  UTestPosix_Pthread in 'UTestPosix_Pthread.pas',
  UTestPosix_Pwd in 'UTestPosix_Pwd.pas',
  UTestPosix_Sched in 'UTestPosix_Sched.pas',
  UTestPosix_Semaphore in 'UTestPosix_Semaphore.pas',
  UTestPosix_Signal in 'UTestPosix_Signal.pas',
  UTestPosix_StdDef in 'UTestPosix_StdDef.pas',
  UTestPosix_Stdio in 'UTestPosix_Stdio.pas',
  UTestPosix_Stdlib in 'UTestPosix_Stdlib.pas',
  UTestPosix_String_ in 'UTestPosix_String_.pas',
  UTestPosix_StrOpts in 'UTestPosix_StrOpts.pas',
  UTestPosix_SysMman in 'UTestPosix_SysMman.pas',
  UTestPosix_SysSelect in 'UTestPosix_SysSelect.pas',
  UTestPosix_SysSocket in 'UTestPosix_SysSocket.pas',
  UTestPosix_SysStat in 'UTestPosix_SysStat.pas',
  UTestPosix_SysStatvfs in 'UTestPosix_SysStatvfs.pas',
  UTestPosix_SysSysctl in 'UTestPosix_SysSysctl.pas',
  UTestPosix_SysTime in 'UTestPosix_SysTime.pas',
  UTestPosix_SysTimes in 'UTestPosix_SysTimes.pas',
  UTestPosix_SysTypes in 'UTestPosix_SysTypes.pas',
  UTestPosix_SysUio in 'UTestPosix_SysUio.pas',
  UTestPosix_SysUn in 'UTestPosix_SysUn.pas',
  UTestPosix_SysWait in 'UTestPosix_SysWait.pas',
  UTestPosix_Termios in 'UTestPosix_Termios.pas',
  UTestPosix_Time in 'UTestPosix_Time.pas',
  UTestPosix_Unistd in 'UTestPosix_Unistd.pas',
  UTestPosix_Utime in 'UTestPosix_Utime.pas',
  UTestPosix_Wchar in 'UTestPosix_Wchar.pas',
  UTestPosix_Wctype in 'UTestPosix_Wctype.pas',
  UTestPosix_Wordexp in 'UTestPosix_Wordexp.pas',
  UTestSysInit in 'UTestSysInit.pas',
  UTestSystem in 'UTestSystem.pas',
  UTestSystem_Actions in 'UTestSystem_Actions.pas',
  UTestSystem_Android_Sensors in 'UTestSystem_Android_Sensors.pas',
  UTestSystem_AnsiStrings in 'UTestSystem_AnsiStrings.pas',
  UTestSystem_Character in 'UTestSystem_Character.pas',
  UTestSystem_Classes in 'UTestSystem_Classes.pas',
  UTestSystem_Contnrs in 'UTestSystem_Contnrs.pas',
  UTestSystem_ConvUtils in 'UTestSystem_ConvUtils.pas',
  UTestSystem_DateUtils in 'UTestSystem_DateUtils.pas',
  UTestSystem_Diagnostics in 'UTestSystem_Diagnostics.pas',
  UTestSystem_Generics_Collections in 'UTestSystem_Generics_Collections.pas',
  UTestSystem_Generics_Defaults in 'UTestSystem_Generics_Defaults.pas',
  UTestSystem_HelpIntfs in 'UTestSystem_HelpIntfs.pas',
  UTestSystem_IniFiles in 'UTestSystem_IniFiles.pas',
  UTestSystem_Internal_DebugUtils in 'UTestSystem_Internal_DebugUtils.pas',
  UTestSystem_Internal_ExcUtils in 'UTestSystem_Internal_ExcUtils.pas',
  UTestSystem_Internal_ICU in 'UTestSystem_Internal_ICU.pas',
  UTestSystem_Internal_MachExceptions in 'UTestSystem_Internal_MachExceptions.pas',
  UTestSystem_Internal_StrHlpr in 'UTestSystem_Internal_StrHlpr.pas',
  UTestSystem_Internal_Unwind in 'UTestSystem_Internal_Unwind.pas',
  UTestSystem_Internal_Unwinder in 'UTestSystem_Internal_Unwinder.pas',
  UTestSystem_Internal_VarHlpr in 'UTestSystem_Internal_VarHlpr.pas',
  UTestSystem_iOS_Sensors in 'UTestSystem_iOS_Sensors.pas',
  UTestSystem_IOUtils in 'UTestSystem_IOUtils.pas',
  UTestSystem_JSON in 'UTestSystem_JSON.pas',
  UTestSystem_JSONConsts in 'UTestSystem_JSONConsts.pas',
  UTestSystem_Mac_CFUtils in 'UTestSystem_Mac_CFUtils.pas',
  UTestSystem_Mac_Sensors in 'UTestSystem_Mac_Sensors.pas',
  UTestSystem_Masks in 'UTestSystem_Masks.pas',
  UTestSystem_MaskUtils in 'UTestSystem_MaskUtils.pas',
  UTestSystem_Math in 'UTestSystem_Math.pas',
  UTestSystem_Math_Vectors in 'UTestSystem_Math_Vectors.pas',
  UTestSystem_Messaging in 'UTestSystem_Messaging.pas',
  UTestSystem_ObjAuto in 'UTestSystem_ObjAuto.pas',
  UTestSystem_Odbc in 'UTestSystem_Odbc.pas',
  UTestSystem_PushNotification in 'UTestSystem_PushNotification.pas',
  UTestSystem_RegularExpressions in 'UTestSystem_RegularExpressions.pas',
  UTestSystem_RegularExpressionsAPI in 'UTestSystem_RegularExpressionsAPI.pas',
  UTestSystem_RegularExpressionsConsts in 'UTestSystem_RegularExpressionsConsts.pas',
  UTestSystem_RegularExpressionsCore in 'UTestSystem_RegularExpressionsCore.pas',
  UTestSystem_RTLConsts in 'UTestSystem_RTLConsts.pas',
  UTestSystem_Rtti in 'UTestSystem_Rtti.pas',
  UTestSystem_Sensors in 'UTestSystem_Sensors.pas',
  UTestSystem_Sensors_Components in 'UTestSystem_Sensors_Components.pas',
  UTestSystem_Sharemem in 'UTestSystem_Sharemem.pas',
  UTestSystem_SimpleShareMem in 'UTestSystem_SimpleShareMem.pas',
  UTestSystem_Sqlite in 'UTestSystem_Sqlite.pas',
  UTestSystem_StartUpCopy in 'UTestSystem_StartUpCopy.pas',
  UTestSystem_StdConvs in 'UTestSystem_StdConvs.pas',
  UTestSystem_StrUtils in 'UTestSystem_StrUtils.pas',
  UTestSystem_SyncObjs in 'UTestSystem_SyncObjs.pas',
  UTestSystem_SysConst in 'UTestSystem_SysConst.pas',
  UTestSystem_SysUtils in 'UTestSystem_SysUtils.pas',
  UTestSystem_TimeSpan in 'UTestSystem_TimeSpan.pas',
  UTestSystem_Types in 'UTestSystem_Types.pas',
  UTestSystem_TypInfo in 'UTestSystem_TypInfo.pas',
  UTestSystem_UIConsts in 'UTestSystem_UIConsts.pas',
  UTestSystem_UITypes in 'UTestSystem_UITypes.pas',
  UTestSystem_VarCmplx in 'UTestSystem_VarCmplx.pas',
  UTestSystem_VarConv in 'UTestSystem_VarConv.pas',
  UTestSystem_Variants in 'UTestSystem_Variants.pas',
  UTestSystem_VarUtils in 'UTestSystem_VarUtils.pas',
  UTestSystem_WideStrings in 'UTestSystem_WideStrings.pas',
  UTestSystem_WideStrUtils in 'UTestSystem_WideStrUtils.pas',
  UTestSystem_Win_ComConst in 'UTestSystem_Win_ComConst.pas',
  UTestSystem_Win_ComObj in 'UTestSystem_Win_ComObj.pas',
  UTestSystem_Win_ComObjWrapper in 'UTestSystem_Win_ComObjWrapper.pas',
  UTestSystem_Win_ComServ in 'UTestSystem_Win_ComServ.pas',
  UTestSystem_Win_Crtl in 'UTestSystem_Win_Crtl.pas',
  UTestSystem_Win_Mtsobj in 'UTestSystem_Win_Mtsobj.pas',
  UTestSystem_Win_ObjComAuto in 'UTestSystem_Win_ObjComAuto.pas',
  UTestSystem_Win_Registry in 'UTestSystem_Win_Registry.pas',
  UTestSystem_Win_ScktComp in 'UTestSystem_Win_ScktComp.pas',
  UTestSystem_Win_Sensors in 'UTestSystem_Win_Sensors.pas',
  UTestSystem_Win_StdVCL in 'UTestSystem_Win_StdVCL.pas',
  UTestSystem_Win_Taskbar in 'UTestSystem_Win_Taskbar.pas',
  UTestSystem_Win_TaskbarCore in 'UTestSystem_Win_TaskbarCore.pas',
  UTestSystem_Win_VCLCom in 'UTestSystem_Win_VCLCom.pas',
  UTestSystem_Zip in 'UTestSystem_Zip.pas',
  UTestSystem_ZLib in 'UTestSystem_ZLib.pas',
  UTestSystem_ZLibConst in 'UTestSystem_ZLibConst.pas',
  UTestWinapi_AccCtrl in 'UTestWinapi_AccCtrl.pas',
  UTestWinapi_AclAPI in 'UTestWinapi_AclAPI.pas',
  UTestWinapi_ActiveX in 'UTestWinapi_ActiveX.pas',
  UTestWinapi_ADOInt in 'UTestWinapi_ADOInt.pas',
  UTestWinapi_AspTlb in 'UTestWinapi_AspTlb.pas',
  UTestWinapi_COMAdmin in 'UTestWinapi_COMAdmin.pas',
  UTestWinapi_CommCtrl in 'UTestWinapi_CommCtrl.pas',
  UTestWinapi_CommDlg in 'UTestWinapi_CommDlg.pas',
  UTestWinapi_ComSvcs in 'UTestWinapi_ComSvcs.pas',
  UTestWinapi_Cor in 'UTestWinapi_Cor.pas',
  UTestWinapi_CorError in 'UTestWinapi_CorError.pas',
  UTestWinapi_CorHdr in 'UTestWinapi_CorHdr.pas',
  UTestWinapi_Cpl in 'UTestWinapi_Cpl.pas',
  UTestWinapi_D2D1 in 'UTestWinapi_D2D1.pas',
  UTestWinapi_D3D10 in 'UTestWinapi_D3D10.pas',
  UTestWinapi_D3D10_1 in 'UTestWinapi_D3D10_1.pas',
  UTestWinapi_D3D11 in 'UTestWinapi_D3D11.pas',
  UTestWinapi_D3D11sdklayers in 'UTestWinapi_D3D11sdklayers.pas',
  UTestWinapi_D3D11Shader in 'UTestWinapi_D3D11Shader.pas',
  UTestWinapi_D3DCommon in 'UTestWinapi_D3DCommon.pas',
  UTestWinapi_D3DX8 in 'UTestWinapi_D3DX8.pas',
  UTestWinapi_D3DX9 in 'UTestWinapi_D3DX9.pas',
  UTestWinapi_D3DX10 in 'UTestWinapi_D3DX10.pas',
  UTestWinapi_DDEml in 'UTestWinapi_DDEml.pas',
  UTestWinapi_Direct3D in 'UTestWinapi_Direct3D.pas',
  UTestWinapi_Direct3D8 in 'UTestWinapi_Direct3D8.pas',
  UTestWinapi_Direct3D9 in 'UTestWinapi_Direct3D9.pas',
  UTestWinapi_DirectDraw in 'UTestWinapi_DirectDraw.pas',
  UTestWinapi_DirectInput in 'UTestWinapi_DirectInput.pas',
  UTestWinapi_DirectMusic in 'UTestWinapi_DirectMusic.pas',
  UTestWinapi_DirectPlay8 in 'UTestWinapi_DirectPlay8.pas',
  UTestWinapi_DirectShow9 in 'UTestWinapi_DirectShow9.pas',
  UTestWinapi_DirectSound in 'UTestWinapi_DirectSound.pas',
  UTestWinapi_Dlgs in 'UTestWinapi_Dlgs.pas',
  UTestWinapi_DwmApi in 'UTestWinapi_DwmApi.pas',
  UTestWinapi_DX7toDX8 in 'UTestWinapi_DX7toDX8.pas',
  UTestWinapi_DxDiag in 'UTestWinapi_DxDiag.pas',
  UTestWinapi_DXFile in 'UTestWinapi_DXFile.pas',
  UTestWinapi_DXGI in 'UTestWinapi_DXGI.pas',
  UTestWinapi_DxgiFormat in 'UTestWinapi_DxgiFormat.pas',
  UTestWinapi_DxgiType in 'UTestWinapi_DxgiType.pas',
  UTestWinapi_DXTypes in 'UTestWinapi_DXTypes.pas',
  UTestWinapi_FlatSB in 'UTestWinapi_FlatSB.pas',
  UTestWinapi_Functiondiscovery in 'UTestWinapi_Functiondiscovery.pas',
  UTestWinapi_GDIPAPI in 'UTestWinapi_GDIPAPI.pas',
  UTestWinapi_GDIPOBJ in 'UTestWinapi_GDIPOBJ.pas',
  UTestWinapi_GDIPUTIL in 'UTestWinapi_GDIPUTIL.pas',
  UTestWinapi_ImageHlp in 'UTestWinapi_ImageHlp.pas',
  UTestWinapi_Imm in 'UTestWinapi_Imm.pas',
  UTestWinapi_IpExport in 'UTestWinapi_IpExport.pas',
  UTestWinapi_IpHlpApi in 'UTestWinapi_IpHlpApi.pas',
  UTestWinapi_IpRtrMib in 'UTestWinapi_IpRtrMib.pas',
  UTestWinapi_IpTypes in 'UTestWinapi_IpTypes.pas',
  UTestWinapi_Isapi in 'UTestWinapi_Isapi.pas',
  UTestWinapi_Isapi2 in 'UTestWinapi_Isapi2.pas',
  UTestWinapi_KnownFolders in 'UTestWinapi_KnownFolders.pas',
  UTestWinapi_Locationapi in 'UTestWinapi_Locationapi.pas',
  UTestWinapi_LZExpand in 'UTestWinapi_LZExpand.pas',
  UTestWinapi_Manipulations in 'UTestWinapi_Manipulations.pas',
  UTestWinapi_Mapi in 'UTestWinapi_Mapi.pas',
  UTestWinapi_Messages in 'UTestWinapi_Messages.pas',
  UTestWinapi_MMSystem in 'UTestWinapi_MMSystem.pas',
  UTestWinapi_MsInkAut in 'UTestWinapi_MsInkAut.pas',
  UTestWinapi_MsInkAut15 in 'UTestWinapi_MsInkAut15.pas',
  UTestWinapi_msxml in 'UTestWinapi_msxml.pas',
  UTestWinapi_msxmlIntf in 'UTestWinapi_msxmlIntf.pas',
  UTestWinapi_Mtx in 'UTestWinapi_Mtx.pas',
  UTestWinapi_MultiMon in 'UTestWinapi_MultiMon.pas',
  UTestWinapi_Nb30 in 'UTestWinapi_Nb30.pas',
  UTestWinapi_ObjectArray in 'UTestWinapi_ObjectArray.pas',
  UTestWinapi_Ole2 in 'UTestWinapi_Ole2.pas',
  UTestWinapi_oleacc in 'UTestWinapi_oleacc.pas',
  UTestWinapi_OleCtl in 'UTestWinapi_OleCtl.pas',
  UTestWinapi_OleDB in 'UTestWinapi_OleDB.pas',
  UTestWinapi_OleDlg in 'UTestWinapi_OleDlg.pas',
  UTestWinapi_OpenGL in 'UTestWinapi_OpenGL.pas',
  UTestWinapi_OpenGLext in 'UTestWinapi_OpenGLext.pas',
  UTestWinapi_PenInputPanel in 'UTestWinapi_PenInputPanel.pas',
  UTestWinapi_Penwin in 'UTestWinapi_Penwin.pas',
  UTestWinapi_Portabledevicetypes in 'UTestWinapi_Portabledevicetypes.pas',
  UTestWinapi_PropKey in 'UTestWinapi_PropKey.pas',
  UTestWinapi_PropSys in 'UTestWinapi_PropSys.pas',
  UTestWinapi_PsAPI in 'UTestWinapi_PsAPI.pas',
  UTestWinapi_Qos in 'UTestWinapi_Qos.pas',
  UTestWinapi_RegStr in 'UTestWinapi_RegStr.pas',
  UTestWinapi_RichEdit in 'UTestWinapi_RichEdit.pas',
  UTestWinapi_RtsCom in 'UTestWinapi_RtsCom.pas',
  UTestWinapi_Sensors in 'UTestWinapi_Sensors.pas',
  UTestWinapi_Sensorsapi in 'UTestWinapi_Sensorsapi.pas',
  UTestWinapi_ShellAPI in 'UTestWinapi_ShellAPI.pas',
  UTestWinapi_SHFolder in 'UTestWinapi_SHFolder.pas',
  UTestWinapi_ShlObj in 'UTestWinapi_ShlObj.pas',
  UTestWinapi_ShLwApi in 'UTestWinapi_ShLwApi.pas',
  UTestWinapi_StructuredQuery in 'UTestWinapi_StructuredQuery.pas',
  UTestWinapi_StructuredQueryCondition in 'UTestWinapi_StructuredQueryCondition.pas',
  UTestWinapi_TlHelp32 in 'UTestWinapi_TlHelp32.pas',
  UTestWinapi_TpcShrd in 'UTestWinapi_TpcShrd.pas',
  UTestWinapi_UrlMon in 'UTestWinapi_UrlMon.pas',
  UTestWinapi_UserEnv in 'UTestWinapi_UserEnv.pas',
  UTestWinapi_UxTheme in 'UTestWinapi_UxTheme.pas',
  UTestWinapi_Wbem in 'UTestWinapi_Wbem.pas',
  UTestWinapi_Wincodec in 'UTestWinapi_Wincodec.pas',
  UTestWinapi_Windows in 'UTestWinapi_Windows.pas',
  UTestWinapi_WinInet in 'UTestWinapi_WinInet.pas',
  UTestWinapi_Winsafer in 'UTestWinapi_Winsafer.pas',
  UTestWinapi_WinSock in 'UTestWinapi_WinSock.pas',
  UTestWinapi_Winsock2 in 'UTestWinapi_Winsock2.pas',
  UTestWinapi_WinSpool in 'UTestWinapi_WinSpool.pas',
  UTestWinapi_WinSvc in 'UTestWinapi_WinSvc.pas',
  UTestWinapi_WMF9 in 'UTestWinapi_WMF9.pas';

[assembly: weak, package: ref]
begin
  ReportMemoryLeaksOnShutdown := True;
  DUnitTestRunner.RunRegisteredTests;
end.
