unit ULexException;
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}
{$WEAKLINKRTTI ON}
interface

uses
  UBaseException;

type
  /// A special type of exception that is raised by the TLexScanner class
  ELexException = class(EBaseException)
  end;

implementation

end.
