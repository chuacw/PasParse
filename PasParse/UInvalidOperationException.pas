unit UInvalidOperationException;
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}
{$WEAKLINKRTTI ON}
interface

uses
  System.SysUtils;

type
  /// A special type of exception
  EInvalidOperationException = class(Exception)
  end;

implementation

end.
