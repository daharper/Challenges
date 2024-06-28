unit Fixtures.TwoSum;

interface

uses
  DUnitX.TestFramework, Utils.TestBase, Utils.Language;

type
  [TestFixture]
  TTwoSumFixture = class(TTestBase)
  private
    procedure RunTest(target, firstIndex, secondIndex: integer; numbers: TIntArray);

  public
    [Test]
    procedure FirstTest;

    [Test]
    procedure SecondTest;

    [Test]
    procedure ThirdTest;

    [Test]
    procedure NotFoundTest;
  end;

implementation

uses
  System.SysUtils, Solutions.TwoSum;

{------------------------------------------------------------------------------------------------------------}
procedure TTwoSumFixture.FirstTest;
begin
  RunTest(9, 0, 1, [2, 7, 11, 15]);
end;

{------------------------------------------------------------------------------------------------------------}
procedure TTwoSumFixture.SecondTest;
begin
  RunTest(6, 1, 2, [3, 2, 4]);
end;

{------------------------------------------------------------------------------------------------------------}
procedure TTwoSumFixture.ThirdTest;
begin
  RunTest(6, 0, 1, [3, 3]);
end;

{------------------------------------------------------------------------------------------------------------}
procedure TTwoSumFixture.NotFoundTest;
begin
  RunTest(6, -1, -1, [3, 4]);
end;

{------------------------------------------------------------------------------------------------------------}
procedure TTwoSumFixture.RunTest(target, firstIndex, secondIndex: integer; numbers: TIntArray);
begin
  var indexes := TwoSum(target, numbers);

  Assert.AreEqual(Length(indexes), 2);

  Assert.AreEqual(indexes[0], firstIndex);
  Assert.AreEqual(indexes[1], secondIndex);
end;

initialization
  TDUnitX.RegisterTestFixture(TTwoSumFixture);

end.
