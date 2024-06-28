{***********************************************************************************************}
{                                                                                               }
{ The Fibonacci numbers, commonly denoted F(n) form a sequence, called the Fibonacci sequence,  }
{ such that each number is the sum of the two preceding ones, starting from 0 and 1. That is:   }
{                                                                                               }
{ - F(0) = 0, F(1) = 1                                                                          }
{ - F(n) = F(n - 1) + F(n - 2), for n > 1                                                       }
{                                                                                               }
{  Given n, calculate F(n)                                                                      }
{                                                                                               }
{ For more details, see: https://leetcode.com/problems/fibonacci-number/description/            }
{                                                                                               }
{***********************************************************************************************}

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
