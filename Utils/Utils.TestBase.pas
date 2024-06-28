unit Utils.TestBase;

interface

type
  TTestBase = class
  protected
    function AsStr(const numbers: array of Int64): string; overload;
    function AsStr(const numbers: array of integer): string; overload;
  end;

implementation

uses
  System.SysUtils;

{ TTestBase }

{------------------------------------------------------------------------------------------------------------}
function TTestBase.AsStr(const numbers: array of Int64): string;
begin
  if Length(numbers) = 0 then Exit('[]');
  if Length(numbers) = 1 then Exit('[' + IntToStr(numbers[0]) + ']');

  Result := '[';

  for var n in numbers do
    Result := Result + IntToStr(n) + ', ';

  SetLength(Result, Result.Length - 2);

  Result := Result + ']';
end;

{------------------------------------------------------------------------------------------------------------}
function TTestBase.AsStr(const numbers: array of integer): string;
begin
  if Length(numbers) = 0 then Exit('[]');
  if Length(numbers) = 1 then Exit('[' + IntToStr(numbers[0]) + ']');

  Result := '[';

  for var n in numbers do
    Result := Result + IntToStr(n) + ', ';

  SetLength(Result, Result.Length - 2);

  Result := Result + ']';
end;

end.
