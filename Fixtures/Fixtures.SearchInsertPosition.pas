unit Fixtures.SearchInsertPosition;

interface

uses
  DUnitX.TestFramework, Utils.TestBase, Utils.Language;

type
  [TestFixture]
  TSearchInsertPositionFixture = class(TTestBase)
  private
    procedure RunTest(target, expected: integer; nums: TIntArray);
  public
    [Test]
    procedure FirstTest;

    [Test]
    procedure SecondTest;
  end;

implementation

uses
  Solutions.SearchInsertPosition;

{ TSearchInsertPositionFixture }

{------------------------------------------------------------------------------------------------------------}
procedure TSearchInsertPositionFixture.RunTest(target, expected: integer; nums: TIntArray);
begin
  var actual := SearchInsertPosition(target, nums);

  Assert.AreEqual(actual, expected);
end;

{------------------------------------------------------------------------------------------------------------}
procedure TSearchInsertPositionFixture.FirstTest;
begin
  RunTest(5, 2, [1, 3, 5, 6]);
end;

{------------------------------------------------------------------------------------------------------------}
procedure TSearchInsertPositionFixture.SecondTest;
begin
  RunTest(2, 1, [1, 3, 5, 6]);
end;

initialization
  TDUnitX.RegisterTestFixture(TSearchInsertPositionFixture);

end.
