unit Utils.Language;

interface

uses
  System.Generics.Collections;

type
  TTuple<T1, T2> = record
    First: T1;
    Second: T2;

    constructor Create(AFirst:T1; ASecond:T2);

    class operator Assign(var Dest: TTuple<T1, T2>; const [ref] Src: TTuple<T1, T2>);        
    class operator Finalize(var Dest: TTuple<T1, T2>);  
  end;

  { Language extensions - for generic functions }
  Dx = class
    { if the type is a class it will be disposed of }
    class procedure Dispose<T>(value: T);

    { if the condition is true, return the true value, otherwise the false }
    class function Iff<T>(Condition: boolean; TrueValue, FalseValue: T): T;

    { assumes items is not empty }
    class function First<T>(const items: array of T): T;
    class function Last<T>(const items: array of T): T;
    class function Empty<T>(const items: array of T): boolean; overload;
    class function HasItems<T>(const items: array of T): boolean;
    class function CountOf<T>(count: integer; const items: array of T): boolean;

    class function Empty(const str: string): boolean; overload;
    class function NotEmpty(const str: string): boolean;
  end;

  TInt64List = TList<Int64>;
  TIntArray = array of integer;
  TIntMap = TDictionary<integer, integer>;
  TStrMap = TDictionary<string, string>;
  TStrArray = array of string;
  TIntPair = TTuple<Integer, Integer>;

implementation

uses
  System.SysUtils, System.Classes, RTTI;

{ TTuple<T1, T2> }

{------------------------------------------------------------------------------------------------------------}
class operator TTuple<T1, T2>.Assign(var Dest: TTuple<T1, T2>; const [ref] Src: TTuple<T1, T2>);
begin
  Dest.First := Src.First;
  Dest.Second := Src.Second;
end;

{------------------------------------------------------------------------------------------------------------}
constructor TTuple<T1, T2>.Create(AFirst: T1; ASecond: T2);
begin
  First  := AFirst;
  Second := ASecond;
end;

{------------------------------------------------------------------------------------------------------------}
class operator TTuple<T1, T2>.Finalize(var Dest: TTuple<T1, T2>);
begin  
  Dx.Dispose<T1>(Dest.First);
  Dx.Dispose<T2>(Dest.Second);
end;

{------------------------------------------------------------------------------------------------------------}
class function Dx.CountOf<T>(count: integer; const items: array of T): boolean;
begin
  Result := Length(items) = count;
end;

{ Tx }

{------------------------------------------------------------------------------------------------------------}
class procedure Dx.Dispose<T>(value: T);
begin
  if GetTypeKind(T) = tkClass then
    (PObject(@value)^).Free;
end;

{------------------------------------------------------------------------------------------------------------}
class function Dx.Empty(const str: string): boolean;
begin
  Result := Length(str) = 0;
end;

{------------------------------------------------------------------------------------------------------------}
class function Dx.Empty<T>(const items: array of T): boolean;
begin
  Result := Length(items) = 0;
end;

{------------------------------------------------------------------------------------------------------------}
class function Dx.First<T>(const items: array of T): T;
begin
  Result := items[Low(items)];
end;

{------------------------------------------------------------------------------------------------------------}
class function Dx.HasItems<T>(const items: array of T): boolean;
begin
  Result := Length(items) > 0;
end;

{------------------------------------------------------------------------------------------------------------}
class function Dx.Iff<T>(Condition: boolean; TrueValue, FalseValue: T): T;
begin
  if Condition then
    Result := TrueValue
  else
    Result := FalseValue;
end;

{------------------------------------------------------------------------------------------------------------}
class function Dx.Last<T>(const items: array of T): T;
begin
  Result := items[High(items)];
end;

{------------------------------------------------------------------------------------------------------------}
class function Dx.NotEmpty(const str: string): boolean;
begin
  Result := Length(str) > 0;
end;

end.
