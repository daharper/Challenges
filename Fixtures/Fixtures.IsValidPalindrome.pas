unit Fixtures.IsValidPalindrome;

interface

uses
  DUnitX.TestFramework, Utils.TestBase;

type
  [TestFixture]
  TIsValidPalindromeFixture = class(TTestBase)
  public
    [Test]
    [TestCase('" " is valid',' ,True')]
    [TestCase('"a" is valid','a,True')]
    [TestCase('"aba" is valid','aba,True')]
    [TestCase('"abba" is valid','abba,True')]
    [TestCase('"abcba" is valid','abcba,True')]
    [TestCase('"race a car" is not valid','race a car,False')]
    procedure Test(const input : string; const expected : boolean);

    [Test]
    procedure TestEmptyString;

    [Test]
    procedure TestLongString;
  end;

implementation

uses
   System.SysUtils, Solutions.IsValidPalindrone;

{------------------------------------------------------------------------------------------------------------}
procedure TIsValidPalindromeFixture.Test(const input : string; const expected : boolean);
begin
  Assert.AreEqual(IsPalindrome(input), expected);
end;

{------------------------------------------------------------------------------------------------------------}
procedure TIsValidPalindromeFixture.TestEmptyString;
begin
  Assert.IsTrue(IsPalindrome(''));
end;

{------------------------------------------------------------------------------------------------------------}
procedure TIsValidPalindromeFixture.TestLongString;
begin
  Assert.IsTrue(IsPalindrome('A man, a plan, a canal: Panama'));
end;


initialization
  TDUnitX.RegisterTestFixture(TIsValidPalindromeFixture);

end.
