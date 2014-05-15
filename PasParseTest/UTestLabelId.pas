unit UTestLabelId;

interface

uses
  UTest;

type
  TTestLabelId = class(TTest)
  public
{$IF NOT DEFINED(DUNIT)}
    class procedure TestAll; override;
    class function GetName: string; override;
{$ELSE}
  published
    procedure TestLabelId;
{$ENDIF}
  end;

implementation

uses
  UTestParser, URuleType{$IF DEFINED(DUNIT)}, TestFramework{$ENDIF};

{ TTestLabelId }
{$IF NOT DEFINED(DUNIT)}
class function TTestLabelId.GetName: string;
begin
  Result := 'LabelId';
end;

class procedure TTestLabelId.TestAll;
begin
  OK('42', TTestParser.ParsesAs('42', 'Number |42|', RTLabelId));
  OK('Foo', TTestParser.ParsesAs('Foo', 'Identifier |Foo|', RTLabelId));
  OK('Absolute', TTestParser.ParsesAs('Absolute',
    'Identifier |Absolute|', RTLabelId));
end;
{$ELSE}

procedure TTestLabelId.TestLabelId;
begin
  OK('42', TTestParser.ParsesAs('42', 'Number |42|', RTLabelId));
  OK('Foo', TTestParser.ParsesAs('Foo', 'Identifier |Foo|', RTLabelId));
  OK('Absolute', TTestParser.ParsesAs('Absolute',
    'Identifier |Absolute|', RTLabelId));
end;

initialization
  RegisterTest(TTestLabelId.Suite);
{$ENDIF}
end.
