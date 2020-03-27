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
    TestRuntime.addStub(StubFor.staticHttpGet("/people",Response(200,json.encode({
      "results":persons
    }),headers: {"Content-Type":"application/json"})));
  });
}