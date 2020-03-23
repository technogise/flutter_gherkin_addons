import 'dart:async';
import 'package:gherkin/gherkin.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:glob/glob.dart';
import 'package:flutter_driver/flutter_driver.dart';

import '../steps/details_page_steps.dart';
import '../steps/home_page_steps.dart';
Future<void> main() {

  //Gherkin Runner Code
  var config = FlutterTestConfiguration()
    ..defaultTimeout = Duration(seconds: 60)
    ..features = [Glob(r"test_driver/e2e/features/**.feature")]
    ..reporters = [
      ProgressReporter(),
      TestRunSummaryReporter(),
      JsonReporter(path: testOutputsDirectory + '/report.json')
    ] // you can include the "StdoutReporter()" without the message level parameter for verbose log information
    ..stepDefinitions = [start(),whenINavigateToPersonaList(),whenITapOnPersonOnHomePage(),thenISeeSomethingAsSomethingOnDetailsPage(),thenISeeFollowing()]
    ..restartAppBetweenScenarios = true
    ..targetAppPath = "test_driver/e2e/app.dart"
  // ..tagExpression = "@smoke" // uncomment to see an example of running scenarios based on tag expressions
    ..exitAfterTestRun = true; // set to false if debugging to exit cleanly
  return GherkinRunner().execute(config);
}