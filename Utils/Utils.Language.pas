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

  TMem = class
    class procedure Dispose<T>(value: T);
  end;

  TInt64List = TList<Int64>;
  TIntArray = array of integer;
  TIntMap = TDictionary<integer, integer>;
  TStrMap = TDictionary<string, string>;

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
  TMem.Dispose<T1>(Dest.First);
  TMem.Dispose<T2>(Dest.Second);
end;

{ TMem }

{------------------------------------------------------------------------------------------------------------}
class procedure TMem.Dispose<T>(value: T);
begin
  if GetTypeKind(T) = tkClass then  
    (PObject(@value)^).Free;
end;

end.
