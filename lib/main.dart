import 'package:dynamic_textfield/second.dart';
import 'package:dynamic_textfield/third.dart';
import 'package:flutter/material.dart';

import 'next.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text('Add entries'),

          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){

              ///Close Kaaj Kore But TextField Controller Kaaj kore na
             // return Next();

              ///TextField Controller Kaaj kore But CLoseButton Kaaj kore na
              return MyApp();

              ///Testing Purpose
              //return Second();


            }));

          },


          // onPressed: () async {
          //   List<PersonEntry> persons = await Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => SOF(),
          //     ),
          //   );
          //   if (persons != null) persons.forEach(print);
          // },


        ),
      ),
    );
  }
}

/*
class SOF extends StatefulWidget {
  @override
  _SOFState createState() => _SOFState();
}

class _SOFState extends State<SOF> {
  var nameTECs = <TextEditingController>[];
  var cards = <Card>[];

  Card createCard() {
    var nameController = TextEditingController();

    nameTECs.add(nameController);

    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Person ${cards.length + 1}'),
          TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Full Name')),

        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    cards.add(createCard());
  }

  _onDone() {
    List<PersonEntry> entries = [];
    for (int i = 0; i < cards.length; i++) {
      var name = nameTECs[i].text;
      entries.add(PersonEntry(name));
    }
    Navigator.pop(context, entries);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: cards.length,
              itemBuilder: (BuildContext context, int index) {
                return cards[index];
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: RaisedButton(
              child: Text('add new'),
              onPressed: () => setState(() => cards.add(createCard())),
            ),
          )
        ],
      ),
      floatingActionButton:
      FloatingActionButton(child: Icon(Icons.done), onPressed: _onDone),
    );
  }
}

class PersonEntry {
  final String name;

  PersonEntry(this.name);
  @override
  String toString() {
    return 'Person: name= $name';
  }
}*/
