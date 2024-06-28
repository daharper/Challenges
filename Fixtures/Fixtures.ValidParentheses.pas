unit Fixtures.ValidParentheses;

interface

uses
  DUnitX.TestFramework, Utils.TestBase;

type
  [TestFixture]
  TValidParenthesesFixture = class(TTestBase)
  public
    [Test]
    [TestCase('Given "()" expect True', '(),True')]
    [TestCase('Given "()[]{}" expect True', '()[]{},True')]
    [TestCase('Given "(]" expect False', '(],False')]
    procedure Test(s: string; expected: boolean);
  end;

implementation

uses
  Solutions.ValidParentheses;

{ TValidParenthesesFixture }

procedure TValidParenthesesFixture.Test(s: string; expected: boolean);
begin
  var actual := IsValidParentheses(s);

  Assert.AreEqual(actual, expected);
end;

initialization
  TDUnitX.RegisterTestFixture(TValidParenthesesFixture);
end.
