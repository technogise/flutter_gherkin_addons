import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin_addons/then.dart';

GenericThen2 thenISeeSomethingAsSomethingOnDetailsPage(){
  return then2("I See {string} as {string}",(context,String text,String within) async  {
    final locator = find.byValueKey(within);
    context.expectMatch(await FlutterDriverUtils.getText(context.world.driver, locator,timeout: context.timeout), text);
  });
}