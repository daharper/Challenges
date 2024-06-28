program Challenges;

{$IFNDEF TESTINSIGHT}
{$APPTYPE CONSOLE}
{$ENDIF}
{$STRONGLINKTYPES ON}
uses
  System.SysUtils,
  {$IFDEF TESTINSIGHT}
  TestInsight.DUnitX,
  {$ELSE}
  DUnitX.Loggers.Console,
  {$ENDIF }
  DUnitX.TestFramework,
  Fixtures.IsValidPalindrome in 'Fixtures\Fixtures.IsValidPalindrome.pas',
  Solutions.IsValidPalindrone in 'Solutions\Solutions.IsValidPalindrone.pas',
  Fixtures.FibonacciNumber in 'Fixtures\Fixtures.FibonacciNumber.pas',
  Solutions.FibonacciNumber in 'Solutions\Solutions.FibonacciNumber.pas',
  Solutions.FibonacciSequence in 'Solutions\Solutions.FibonacciSequence.pas',
  Fixtures.FibonacciSequence in 'Fixtures\Fixtures.FibonacciSequence.pas',
  Utils.TestBase in 'Utils\Utils.TestBase.pas',
  Solutions.FibonacciGenerator in 'Solutions\Solutions.FibonacciGenerator.pas',
  Fixtures.FibonacciGenerator in 'Fixtures\Fixtures.FibonacciGenerator.pas',
  Solutions.TwoSum in 'Solutions\Solutions.TwoSum.pas',
  Fixtures.TwoSum in 'Fixtures\Fixtures.TwoSum.pas',
  Utils.Language in 'Utils\Utils.Language.pas',
  Solutions.SearchInsertPosition in 'Solutions\Solutions.SearchInsertPosition.pas',
  Fixtures.SearchInsertPosition in 'Fixtures\Fixtures.SearchInsertPosition.pas',
  Fixtures.IsPalindrome in 'Fixtures\Fixtures.IsPalindrome.pas',
  Solutions.IsPalindrome in 'Solutions\Solutions.IsPalindrome.pas',
  Solutions.LongestCommonPrefix in 'Solutions\Solutions.LongestCommonPrefix.pas',
  Fixtures.LongestCommonPrefix in 'Fixtures\Fixtures.LongestCommonPrefix.pas';

{ keep comment here to protect the following conditional from being removed by the IDE when adding a unit }
{$IFNDEF TESTINSIGHT}
var
  runner: ITestRunner;
  results: IRunResults;
  logger: ITestLogger;
  nunitLogger : ITestLogger;
{$ENDIF}
begin
{$IFDEF TESTINSIGHT}
  TestInsight.DUnitX.RunRegisteredTests;
{$ELSE}
  try
    //Check command line options, will exit if invalid
    TDUnitX.CheckCommandLine;
    //Create the test runner
    runner := TDUnitX.CreateRunner;
    //Tell the runner to use RTTI to find Fixtures
    runner.UseRTTI := True;
    //When true, Assertions must be made during tests;
    runner.FailsOnNoAsserts := False;

    //tell the runner how we will log things
    //Log to the console window if desired
    if TDUnitX.Options.ConsoleMode <> TDunitXConsoleMode.Off then
    begin
      logger := TDUnitXConsoleLogger.Create(TDUnitX.Options.ConsoleMode = TDunitXConsoleMode.Quiet);
      runner.AddLogger(logger);
    end;
    //Generate an NUnit compatible XML File
    nunitLogger := TDUnitXXMLNUnitFileLogger.Create(TDUnitX.Options.XMLOutputFile);
    runner.AddLogger(nunitLogger);

    //Run tests
    results := runner.Execute;
    if not results.AllPassed then
      System.ExitCode := EXIT_ERRORS;

    {$IFNDEF CI}
    //We don't want this happening when running under CI.
    if TDUnitX.Options.ExitBehavior = TDUnitXExitBehavior.Pause then
    begin
      System.Write('Done.. press <Enter> key to quit.');
      System.Readln;
    end;
    {$ENDIF}
  except
    on E: Exception do
      System.Writeln(E.ClassName, ': ', E.Message);
  end;
{$ENDIF}
end.
