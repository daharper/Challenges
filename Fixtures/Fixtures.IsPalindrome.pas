unit Fixtures.IsPalindrome;

interface

uses
  DUnitX.TestFramework, Utils.TestBase;

type
  TIsPalindromeFixture = class(TTestBase)
  public
    [Test]
    [TestCase('Given 121 return true', '121,True')]
    [TestCase('Given 10 return false', '10,False')]
    [TestCase('Given -121 return false', '-121,False')]
    procedure Test(x: integer; expected: boolean);
  end;

implementation

uses
  Solutions.IsPalindrome;

{ TIsPalindromeFixture }

procedure TIsPalindromeFixture.Test(x: integer; expected: boolean);
begin
  Assert.AreEqual(IsPalindrome(x), expected);
end;

initialization
  TDUnitX.RegisterTestFixture(TIsPalindromeFixture);

end.
