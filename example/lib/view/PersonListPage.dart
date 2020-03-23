import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:persona/main.dart';
import 'package:persona/models/Person.dart';
import 'package:persona/services/PersonService.dart';
import 'package:persona/view/PersonPage.dart';

class PersonListPage extends StatefulWidget {
  PersonListPage({Key key, this.title}) : super(key: key){
  }

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _PersonListPageState createState() => _PersonListPageState(PersonService());
}

class _PersonListPageState extends State<PersonListPage> {
  PersonService personService;

  _PersonListPageState(this.personService);

  List<Person> data;

  Future<String> getJSONData() async {
    var ret = await this.personService.getAllPersonas();

    // To modify the state of the app, use this method
    setState(() {
      // Extract the required part and assign it to the global variable named data
      data = ret;
    });

    return "Successfull";
  }

  @override
  void initState() {
    super.initState();
    this.getJSONData();

    // Call the getJSONData() method when the app initializes
  }
  clicked(int pos){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>PersonPage(data[pos],"Details of "+data[pos].name)));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("See all Persons"),
      ),
      // Create a Listview and load the data when available
      body: ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Center(
                  child: Column(
                    // Stretch the cards in horizontal axis
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Card(
                          child:InkWell(
                            onTap: ()=>clicked(index),
                            child: Container(
                              child: Text(
                                // Read the name field value and set it in the Text widget
                                data[index].name,
                                key: ValueKey("card-"+index.toString()),
                                // set some style to text
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.lightBlueAccent),
                              ),
                              // added padding
                              padding: const EdgeInsets.all(15.0),
                            ),
                          )

                      )
                    ],
                  )),
            );
          }),
    );
  }
}