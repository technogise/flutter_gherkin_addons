import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:persona/models/Person.dart';
import 'package:persona/services/PersonService.dart';
import 'package:persona/view/PersonListPage.dart';
import 'package:persona/view/PersonPage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _HomePageState();

  clicked(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>PersonListPage(title: "Known Persons")));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("See all Persons"),
      ),
      // Create a Listview and load the data when available
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
              onTap: ()=>clicked(),
              child: Container(
                child:Text(
                  'See All Persons',
                  style: TextStyle(
                      fontSize: 18.0, color: Colors.lightBlueAccent
                  ),
                  key: ValueKey("persona"),
                ),
              ),
              ),
            ],
          ),
        )
    );
  }
}