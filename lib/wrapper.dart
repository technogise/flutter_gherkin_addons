import 'dart:io';
import 'package:flutter_gherkin_addons/stubber.dart';
import 'package:gherkin/gherkin.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:glob/glob.dart';
import 'package:flutter_driver/flutter_driver.dart';
import "package:path/path.dart" show dirname;
import 'dart:io' show Platform;

class Bootstrapper {
  static Stubber stubber;
  static Future<void> start(Iterable<StepDefinitionBase> steps) async {
    String path = dirname(Platform.script.toString());
    int index = path.indexOf("test_driver");
    String dir = path.substring(index);
    stubber = Stubber();
    var config = FlutterTestConfiguration()
      ..features = [Glob("$dir/features/**.feature")]
      ..reporters = [
        ProgressReporter(),
        TestRunSummaryReporter(),
        JsonReporter(path: testOutputsDirectory + '/report.json')
      ]
      ..stepDefinitions = steps
      ..restartAppBetweenScenarios = true
      ..targetAppPath = "$dir/app.dart"
      ..exitAfterTestRun = true;
    await stubber.start();
    await GherkinRunner().execute(config);
    return stubber.stop();
  }
}
