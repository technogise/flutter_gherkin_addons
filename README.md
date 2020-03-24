# flutter_gherkin_addons

Addons for flutter Gherkin Development

## Getting Started
### Creating Project
Creating a flutter gherkin project is as simple as adding few dependencies in you projects listed below
```
flutter_gherkin: ^1.0.4
flutter_gherkin_addons: ^0.1.2
flutter_driver:
    sdk: flutter
```
### Assumptions
You have config.yaml file at root of <test dir> that looks typically like below
```
reporting: true <This Turns on or of json reporting>
stubbing: true <This turns on or off mocking server launched on port 8081>
```
You have app.dart file which has necessary steps to launch application in the same directory where app_test.dart located.

Typical app.dart looks like below 
```
import 'package:<your_package>/<your root file where app is located>.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_driver/driver_extension.dart';
void main() {
  enableFlutterDriverExtension();
  runApp(YourApp());
}
```
Typical app_test.dart looks like below 
```
import 'dart:async';
import 'package:flutter_gherkin_addons/wrapper.dart';
import 'steps/mocking_steps.dart';
Future<void> main() async {
  return Bootstrapper.start(
      [
        ... your step definition functions
      ]
  );
}
```


## Writing Step Definitions
You can write step definition with simple wrapper functions (in future probably will be moved to main package) as below
```
GenericWhen1 whenITapOnPersonOnHomePage(){
  return when1("I tap on {string}", (context,String within) async {
    final locator = find.byValueKey(within);
    FlutterDriverUtils.tap(context.world.driver, locator,timeout: context.timeout);
  });
}
```

## Mocking api requests
You can mock api requests in a step or anywhere as below
```
import 'dart:convert';
import 'package:flutter_gherkin_addons/given.dart';
import 'package:flutter_gherkin_addons/stubber.dart';
import 'package:flutter_gherkin_addons/wrapper.dart';
import 'package:gherkin/gherkin.dart';
import 'package:persona/models/Person.dart';
GenericGiven1 givenFollowingUserExists(){
  return given1("Below Persona exists",(context,Table dataTable) async  {
    var persons=[];

    for (var row in dataTable.rows) {
      persons.add(Person(
        name: row.columns.elementAt(0),
        hair_color: row.columns.elementAt(1),
        skin_color: row.columns.elementAt(2),
        eye_color: row.columns.elementAt(3),
      ));
    }
    Bootstrapper.stubber.stub(Stub("GET","/people",Response(200,json.encode({
      "results":persons
    }),headers: {"Content-Type":"application/json"})));
  });
}
```

The above step mocks /people get call on http://localhost:8081 (on iOS) http://10.0.2.2:8081 (on Android) you can inject this urls into your app while launching app as demonstrated in [example](https://github.com/technogise/flutter_gherkin_addons/tree/master/example)
Obove step can be invoked like 
```
Given Below Persona exists
  |name   |hair_color |skin_color |eye_color  |
  |Atmaram|Blonde     |Dark       |Hazel      |
  |Keshav |Black      |Fair       |Balck      |
  |Prasad |Black      |Fair       |Black      |
```
