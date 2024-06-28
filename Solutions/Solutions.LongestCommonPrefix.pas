{***********************************************************************************************}
{                                                                                               }
{ Write a function to find the longest common prefix string amongst an array of strings.        }
{ If there is no common prefix, return an empty string "".                                      }
{                                                                                               }
{ You must write an algorithm with O(log n) runtime complexity.                                 }
{                                                                                               }
{ - Input:  strs = ["flower","flow","flight"]                                                   }
{   Output: "fl"                                                                                }
{                                                                                               }
{ - Input:  strs = ["dog","racecar","car"]                                                      }
{   Output: ""                                                                                  }
{                                                                                               }
{ For more details, see: https://leetcode.com/problems/longest-common-prefix/description/       }
{                                                                                               }
{***********************************************************************************************}

unit Solutions.LongestCommonPrefix;

interface

uses
  System.SysUtils, Utils.Language, Vcl.Dialogs;

function LongestCommonPrefix(strs: TStrArray): string;

implementation

function LongestCommonPrefix(strs: TStrArray): string;
begin
  var len := Length(strs);

  if len = 0 then Exit('');
  if len = 1 then Exit(strs[0]);

  var candidate := strs[0];
  var last := len - 1;

  { find the smallest candidate }

  for var i := 1 to last do begin
    if Length(strs[i]) < Length(candidate) then
      candidate := strs[i];
  end;

  { find the common prefix in candidate }

  var index := Low(candidate);

  while index <= High(candidate) do begin

    for var i := 0 to last do
      if strs[i][index] <> candidate[index] then
        Exit(Dx.Iff(index > 0, candidate.SubString(0, index - 1),  ''));

    Inc(index);
  end;

  Result := candidate;
end;

end.