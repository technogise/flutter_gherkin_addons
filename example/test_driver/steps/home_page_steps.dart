import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_gherkin_addons/given.dart';
import 'package:flutter_gherkin_addons/then.dart';
import 'package:flutter_gherkin_addons/when.dart';
import 'package:gherkin/gherkin.dart';
import 'package:flutter_driver/flutter_driver.dart';

GenericGiven start(){
  return given("I am on Application", (context) async {
  });
}
GenericWhen whenINavigateToPersonaList(){
  return when("I navigate to Persona List", (context) async {
    final locator = find.byValueKey("persona");
    FlutterDriverUtils.tap(context.world.driver, locator,timeout: context.timeout);
  });
}
GenericWhen1 whenITapOnPersonOnHomePage(){
  return when1("I tap on {string}", (context,String within) async {
    final locator = find.byValueKey(within);
    FlutterDriverUtils.tap(context.world.driver, locator,timeout: context.timeout);
  });
}
GenericThen1 thenISeeFollowing(){
  return then1("I See following Personas",(context,Table dataTable) async  {
    int index=0;
    for (var row in dataTable.rows) {
      final locator = find.byValueKey("card-"+index.toString());
      index = index+1;
      context.expectMatch(await FlutterDriverUtils.getText(context.world.driver, locator,timeout: context.timeout), row.columns.elementAt(0));
    }
  });
}