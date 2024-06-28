unit Fixtures.FibonacciNumber;

interface

uses
  DUnitX.TestFramework, Utils.TestBase;

type
  [TestFixture]
  TFibonacciNumberFixture = class(TTestBase)
  public
    [Test]
    [TestCase('f(2) = 1', '2,1')]
    [TestCase('f(3) = 2', '3,2')]
    [TestCase('f(4) = 3', '4,3')]
    [TestCase('f(50) = 12586269025', '50,12586269025')]
    procedure Test(const number : integer; const expected : Int64);
  end;

implementation

uses
   System.SysUtils, Solutions.FibonacciNumber;

{------------------------------------------------------------------------------------------------------------}
procedure TFibonacciNumberFixture.Test(const number : integer; const expected : Int64);
begin
  Assert.AreEqual(FibonacciNumber(number), expected);
end;

initialization
  TDUnitX.RegisterTestFixture(TFibonacciNumberFixture);

end.
