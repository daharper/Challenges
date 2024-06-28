{***********************************************************************************************}
{                                                                                               }
{ Given a sorted array of distinct integers and a target value, return the index if the target  }
{ is found. If not, return the index where it would be if it were inserted in order.            }
{                                                                                               }
{ You must write an algorithm with O(log n) runtime complexity.                                 }
{                                                                                               }
{ - Input:  nums = [1,3,5,6], target = 5                                                        }
{   Output: 2                                                                                   }
{                                                                                               }
{ - Input:  nums = [1,3,5,6], target = 2                                                        }
{   Output: 1                                                                                   }
{                                                                                               }
{ For more details, see: https://leetcode.com/problems/search-insert-position/description/      }
{                                                                                               }
{***********************************************************************************************}

unit Solutions.SearchInsertPosition;

interface

uses
  Utils.Language;

function SearchInsertPosition(target: integer; nums: TIntArray): integer;

implementation

{------------------------------------------------------------------------------------------------------------}
function SearchInsertPosition(target: integer; nums: TIntArray): integer;
begin
  var len := Length(nums);

  if len = 0 then Exit(0);

  if len = 1 then begin
    Result := Dx.Iff(nums[0] >= target, 0, 1);
    Exit;
  end;

  if Dx.Last(nums) < target then Exit(len);

  var low   := 0;
  var high  := High(nums);
  var index := 0;
  var num   := 0;

  while low <= high do begin
    index := (low + high) div 2;
    num := nums[index];

    if num = target then Exit(index);

    if num < target then
      low := index + 1
    else
      high := index - 1;
  end;

  Result := Dx.Iff(num < target, index + 1, index);
end;

end.
