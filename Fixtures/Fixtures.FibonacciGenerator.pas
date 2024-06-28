unit Fixtures.FibonacciGenerator;

interface

uses
  DUnitX.TestFramework, Utils.TestBase;

type
  [TestFixture]
  TFibonacciGeneratorFixture = class(TTestBase)
  public
    [Test]
    procedure TestFirstFiveNumbers;

    [Test]
    procedure TestForNumberFifty;
  end;

implementation

uses
   System.SysUtils, Solutions.FibonacciGenerator;


{ TFibonacciGeneratorFixture }

{------------------------------------------------------------------------------------------------------------}

procedure TFibonacciGeneratorFixture.TestFirstFiveNumbers;
begin
  var generator := TFibonacciGenerator.Create;

  try
    Assert.AreEqual<Int64>(generator.Next.Value, 0);
    Assert.AreEqual<Int64>(generator.Next.Value, 1);
    Assert.AreEqual<Int64>(generator.Next.Value, 1);
    Assert.AreEqual<Int64>(generator.Next.Value, 2);
    Assert.AreEqual<Int64>(generator.Next.Value, 3);
  finally
    generator.Free;
  end;
end;
{------------------------------------------------------------------------------------------------------------}

procedure TFibonacciGeneratorFixture.TestForNumberFifty;
const
  TestSequence : array[1..51] of Int64 =
  (
      0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181,
      6765, 10946, 17711, 28657, 46368, 75025, 121393, 196418, 317811, 514229, 832040,
      1346269, 2178309, 3524578, 5702887, 9227465, 14930352, 24157817, 39088169,
      63245986, 102334155, 165580141, 267914296, 433494437, 701408733, 1134903170,
      1836311903, 2971215073, 4807526976, 7778742049, 12586269025
  );
begin
  var generator := TFibonacciGenerator.Create;

  try
    for var i := Low(TestSequence) to High(TestSequence) do
      Assert.AreEqual(generator.Next.Value, TestSequence[i], 'error at index: ' + IntToStr(i));
  finally
    generator.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TFibonacciGeneratorFixture);

end.
