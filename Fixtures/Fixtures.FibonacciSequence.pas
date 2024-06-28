unit Fixtures.FibonacciSequence;

interface

uses
  DUnitX.TestFramework, Utils.TestBase;

type
  [TestFixture]
  TFibonacciSequenceFixture = class(TTestBase)
  private
    procedure TestSequence(n: integer; const expected: array of Int64);
  public
    [Test]
    procedure TestSequenceForTwo;

    [Test]
    procedure TestSequenceForThree;

    [Test]
    procedure TestSequenceForFour;

    [Test]
    procedure TestSequenceForFive;

    [Test]
    procedure TestSequenceForFifty;
  end;

implementation

uses
   System.SysUtils, Solutions.FibonacciSequence;

{------------------------------------------------------------------------------------------------------------}
procedure TFibonacciSequenceFixture.TestSequence(n: integer; const expected: array of Int64);
begin
  var results := GenerateFibonacciSequence(n);

  try
    Assert.AreEqual(results.Count, Length(expected), Format('expected %d items got %d', [Length(expected), results.Count]));

    for var i := Low(expected) to High(expected) do
      Assert.AreEqual(results[i], expected[i], 'n = ' + IntToStr(n));
  finally
    results.Free;
  end;
end;

{------------------------------------------------------------------------------------------------------------}
procedure TFibonacciSequenceFixture.TestSequenceForTwo;
begin
  TestSequence(2, [0, 1, 1]);
end;

{------------------------------------------------------------------------------------------------------------}
procedure TFibonacciSequenceFixture.TestSequenceForThree;
begin
  TestSequence(3, [0, 1, 1, 2]);
end;

{------------------------------------------------------------------------------------------------------------}
procedure TFibonacciSequenceFixture.TestSequenceForFour;
begin
  TestSequence(4, [0, 1, 1, 2, 3]);
end;

{------------------------------------------------------------------------------------------------------------}
procedure TFibonacciSequenceFixture.TestSequenceForFive;
begin
  TestSequence(5, [0, 1, 1, 2, 3, 5]);
end;

{------------------------------------------------------------------------------------------------------------}
procedure TFibonacciSequenceFixture.TestSequenceForFifty;
begin
  TestSequence(50,
    [
      0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181,
      6765, 10946, 17711, 28657, 46368, 75025, 121393, 196418, 317811, 514229, 832040,
      1346269, 2178309, 3524578, 5702887, 9227465, 14930352, 24157817, 39088169,
      63245986, 102334155, 165580141, 267914296, 433494437, 701408733, 1134903170,
      1836311903, 2971215073, 4807526976, 7778742049, 12586269025
    ]);
end;

initialization
  TDUnitX.RegisterTestFixture(TFibonacciSequenceFixture);

end.

