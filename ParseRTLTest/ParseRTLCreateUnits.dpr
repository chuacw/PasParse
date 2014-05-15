program ParseRTLCreateUnits;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.Types, System.SysUtils, System.Classes, System.IOUtils;

procedure CreateRTLUnits;
const
  LSourceDir = 'C:\Program Files (x86)\Embarcadero\Studio\14.0\source\';
var
  LFiles: TStringDynArray;
  LFile, LUnitName, LOutputDir: string;
  F: TextFile;
  Index: Integer;
  SL: TStringList;
begin
  LOutputDir := ExtractFileDir(ParamStr(0));
  LOutputDir := TDirectory.GetParent(LOutputDir);
  LOutputDir := IncludeTrailingPathDelimiter(TDirectory.GetParent(LOutputDir));
  LFiles := TDirectory.GetFiles(LSourceDir+'rtl', '*.pas', TSearchOption.soAllDirectories);
  SL := TStringList.Create;
  for LFile in LFiles do
    begin
      SL.Clear;
      LUnitName := ExtractFileName(LFile);
      LUnitName := ChangeFileExt(LUnitName, '');
      LUnitName := StringReplace(LUnitName, '.', '_', [rfReplaceAll]);
      SL.Add(Format('unit UTest%s;', [LUnitName]));
      SL.Add('interface');
      SL.Add('uses');
      SL.Add('  System.SysUtils, TestFramework, UTest;');
      SL.Add('');
      SL.Add('type');
      SL.Add('');
      SL.Add(Format('  TTest%s = class(TTest)', [LUnitName]));
      SL.Add('  published');
      SL.Add(Format('    procedure Test%s;', [LUnitName]));
      SL.Add('  end;');
      SL.Add('');
      SL.Add('implementation');
      SL.Add('');
      SL.Add(Format('procedure TTest%s.Test%0:s;', [LUnitName]));
      SL.Add('const');
      SL.Add(Format('  CRTLFilename = ''%s'';', [LFile]));
      SL.Add('begin');
      SL.Add('  ParseFile(CRTLFilename);');
      SL.Add('end;');
      SL.Add('');
      SL.Add('initialization');
      SL.Add(Format('  RegisterTest(TTest%s.Suite);', [LUnitName]));
      SL.Add('end.');
      SL.SaveToFile(Format('%sUTest%s.pas', [LOutputDir, LUnitName]));
    end;
end;

begin
  CreateRTLUnits;
end.
