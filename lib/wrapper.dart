import 'dart:io';
import 'package:flutter_gherkin_addons/stubber.dart';
import 'package:gherkin/gherkin.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:glob/glob.dart';
import 'package:flutter_driver/flutter_driver.dart';
import "package:path/path.dart" show dirname;
import 'dart:io' show Platform;

import 'package:yaml/yaml.dart';

class TestRuntime {
  static Stubber _stubber;
  static addStub(Stub stub){
    _stubber.stub(stub);
  }
  static Future<void> start(Iterable<StepDefinitionBase> steps) async {
    String path = dirname(Platform.script.toString());
    int index = path.indexOf("test_driver");
    String dir = path.substring(index);
    Map mapConfig = loadYaml(new File("$dir/config.yaml").readAsStringSync());
    var reporters=mapConfig['reporting']?[
      ProgressReporter(),
      TestRunSummaryReporter(),
      JsonReporter(path: testOutputsDirectory + '/report.json')
    ]:[
      ProgressReporter(),
      TestRunSummaryReporter()
    ];
    _stubber = Stubber();
    var config = FlutterTestConfiguration()
      ..features = [Glob("$dir/features/**.feature")]
      ..reporters = reporters
      ..stepDefinitions = steps
      ..restartAppBetweenScenarios = true
      ..targetAppPath = "$dir/app.dart"
      ..exitAfterTestRun = true;
    if(mapConfig['stubbing']) {
      await _stubber.start();
      await GherkinRunner().execute(config);
      return await _stubber.stop();
    } else {
      return await GherkinRunner().execute(config);
    }
  }
}
