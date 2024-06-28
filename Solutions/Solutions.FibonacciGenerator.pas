{***********************************************************************************************}
{                                                                                               }
{ Write a generator function that returns a generator object which yields the fibonacci         }
{ sequence, one call at a time. For example:                                                    }
{                                                                                               }
{   const gen = fibGenerator();                                                                 }
{                                                                                               }
{   gen.next().value; // 0                                                                      }
{   gen.next().value; // 1                                                                      }
{   gen.next().value; // 1                                                                      }
{   gen.next().value; // 2                                                                      }
{   gen.next().value; // 3                                                                      }
{                                                                                               }
{ For more details, see: https://leetcode.com/problems/generate-fibonacci-sequence/description/ }
{                                                                                               }
{***********************************************************************************************}

unit Solutions.FibonacciGenerator;

interface

type
  TFibonacciGenerator = class
  private
    FLast: Int64;
    FNext: Int64;
    FCount: integer;

    function CalcValue: Int64;
    procedure Reset;
  public
    property Value: Int64 read FNext;

    function Next: TFibonacciGenerator;

    constructor Create;
  end;

implementation

{------------------------------------------------------------------------------------------------------------}
constructor TFibonacciGenerator.Create;
begin
  Reset;
end;

{------------------------------------------------------------------------------------------------------------}
function TFibonacciGenerator.CalcValue: Int64;
begin
  if FCount = 0 then Exit(0);
  if FCount = 1 then Exit(1);

  var temp : Int64 := FNext;

  Result := FLast + FNext;
  FLast := temp;
end;

{------------------------------------------------------------------------------------------------------------}
function TFibonacciGenerator.Next: TFibonacciGenerator;
begin
  Inc(FCount);

  FNext := CalcValue;

  Result := self;
end;

{------------------------------------------------------------------------------------------------------------}
procedure TFibonacciGenerator.Reset;
begin
  FCount := -1;
  FLast := 0;
  FNext := 0;
end;

end.
