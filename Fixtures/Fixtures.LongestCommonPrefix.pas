unit Fixtures.LongestCommonPrefix;

interface

uses
  DUnitX.TestFramework, Utils.TestBase, Utils.Language;

type
  TLongestCommonPrefixFixture = class(TTestBase)
  public
    [Test]
    procedure FirstTest;

    [Test]
    procedure SecondTest;
  end;

implementation

uses
  Solutions.LongestCommonPrefix;

{ TLongestCommonPrefixFixture }

{------------------------------------------------------------------------------------------------------------}
procedure TLongestCommonPrefixFixture.FirstTest;
begin
  var actual := LongestCommonPrefix(['flower', 'flow', 'flight']);

  Assert.AreEqual(actual, 'fl');
end;

{------------------------------------------------------------------------------------------------------------}
procedure TLongestCommonPrefixFixture.SecondTest;
begin
  var actual := LongestCommonPrefix(['dog','racecar','car']);

  Assert.AreEqual(actual, '');
end;

initialization
  TDUnitX.RegisterTestFixture(TLongestCommonPrefixFixture);
end.
