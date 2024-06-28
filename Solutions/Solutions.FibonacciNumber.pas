unit Solutions.FibonacciNumber;

interface

function FibonacciNumber(n: integer): Int64;

implementation

{------------------------------------------------------------------------------------------------------------}
function FibonacciNumber(n: integer): Int64;
begin
  if n = 0 then Exit(n);

  var last : Int64 := 0;
  var next : Int64 := 1;
  var temp : Int64;

  var count := n - 1;

  for var i in [1..count] do begin
    temp := next;
    next := last + next;
    last := temp;
  end;

  Result := next;
end;

end.
