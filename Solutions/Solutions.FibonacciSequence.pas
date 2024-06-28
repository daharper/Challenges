unit Solutions.FibonacciSequence;

interface

uses
  System.Generics.Collections, System.SysUtils, Utils.Language;

function GenerateFibonacciSequence(n: integer): TInt64List;

implementation

{----------------------------------------------------------------------------------------------------------------------}
function GenerateFibonacciSequence(n: integer): TInt64List;
begin
  Result := TInt64List.Create;

  Result.Add(0);

  if n > 0 then
    Result.Add(1);

  var last : Int64 := 0;
  var next : Int64 := 1;
  var temp : Int64 := 0;

  var count := n - 1;

  for var i in [1..count] do begin
    temp := next;
    next := last + next;
    last := temp;
    Result.Add(next);
  end;
end;

end.
