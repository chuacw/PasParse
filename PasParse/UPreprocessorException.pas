unit UPreprocessorException;
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}
{$WEAKLINKRTTI ON}
interface

uses
  UBaseException;

type
  /// A special type of exception that is raised by the preprocessor
  EPreprocessorException = class(EBaseException)
  end;

implementation

end.
