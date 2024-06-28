unit Solutions.IsValidPalindrone;

interface

function IsPalindrome(s: string): boolean;

implementation

uses
  System.SysUtils,
  System.Character;

{----------------------------------------------------------------------------------------------------------------------}
function IsPalindrome(s: string): boolean;
begin
  if Length(s) = 0 then Exit(true);

  // prepare the text for comparison

  var text := '';

  for var i := Low(s) to High(s) do begin
    var ch := s[i];

    if ch.IsLetterOrDigit then
      text := text + ch.ToLower;
  end;

  // eliminate easy cases

  if Length(text) < 2 then Exit(true);
  if Length(text) = 2 then Exit(text.Chars[0] = text.Chars[1]);

  // compare from outwards towards center, left with right

  var leftIndex := 0;
  var rightIndex := High(text) - 1;

  while leftIndex < rightIndex do begin
    if text.Chars[leftIndex] <> text.chars[rightIndex] then Exit(false);

    Inc(leftIndex);
    Dec(rightIndex);
  end;

  Result := true;
end;

end.
