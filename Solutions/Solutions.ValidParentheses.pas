{***********************************************************************************************}
{                                                                                               }
{ Given a string s containing just the characters '(', ')', '[' and ']', and braces, determine  }
{ if the input string is valid.                                                                 }
{                                                                                               }
{ - Input:  s = "()"                                                                            }
{   Output: true                                                                                }
{                                                                                               }
{ - Input:  s = "(]"                                                                            }
{   Output: false                                                                               }
{                                                                                               }
{ For more details, see: https://leetcode.com/problems/valid-parentheses/description/           }
{                                                                                               }
{***********************************************************************************************}

unit Solutions.ValidParentheses;

interface

function IsValidParentheses(s: string): boolean;

implementation

uses
  System.Generics.Collections;

function IsValidParentheses(s: string): boolean;
begin
  if Length(s) mod 2 <> 0 then Exit(false);

  var stack := TStack<Char>.Create;

  try
    for var ch in s do begin
      if ch in ['(', '[', '{'] then begin
        stack.Push(ch);
        continue;
      end;

      if stack.IsEmpty then Exit(false);

      case (stack.Pop()) of
        '(': if ch <> ')' then Exit(false);
        '[': if ch <> ']' then Exit(false);
        '{': if ch <> '}' then Exit(false);
      end;
    end;

    Result := stack.IsEmpty;
  finally
    stack.Free;
  end;
end;

end.
