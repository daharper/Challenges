{***********************************************************************************************}
{                                                                                               }
{ Return true if a number reads the same backwards, false otherwise.                            }
{                                                                                               }
{ - Given 121 return true                                                                       }
{ - Given 10 return false                                                                       }
{ - Given -121 return false, because 121- is not the same as -121                               }
{                                                                                               }
{ For more details, see: https://leetcode.com/problems/palindrome-number/description/           }
{                                                                                               }
{***********************************************************************************************}

unit Solutions.IsPalindrome;

interface

function IsPalindrome(x: integer): boolean;

implementation

function IsPalindrome(x: integer): boolean;
begin
  if x = 0 then Exit(true);

  if (x < 0) or (x mod 10 = 0) then Exit(false);

  var y := 0;

  while x > y do begin
    y := y * 10 + x mod 10;
    x := x div 10;
  end;

  Result := (x = y) or (x = y div 10);
end;

end.
