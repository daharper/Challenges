unit Solutions.TwoSum;

interface

uses
  Utils.Language;

function TwoSum(target: integer; const numbers: TIntArray): TIntArray;

implementation

{------------------------------------------------------------------------------------------------------------}
function TwoSum(target: integer; const numbers: TIntArray): TIntArray;
begin
  var cache := TIntMap.Create;

  try
    for var index := Low(numbers) to High(numbers) do begin
      var number := numbers[index];
      var diff   := target - number;

      if cache.ContainsKey(diff) then begin
        Result := [cache[diff], index];
        Exit;
      end;

      cache.Add(number, index);
    end;

    Result := [-1, -1];

  finally
    cache.Free;
  end;

end;

end.
