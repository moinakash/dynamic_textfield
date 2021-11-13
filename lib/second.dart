import 'package:flutter/material.dart';

class Second extends StatefulWidget {
  const Second({Key? key}) : super(key: key);

  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  List<Widget> _children = [];
  List<TextEditingController> controllers = [];  //the controllers list
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
        actions: <Widget>[IconButton(icon: Icon(Icons.add), onPressed: _add)],
      ),
      body: ListView(children: _children),
    );
  }

  void _add() {

    TextEditingController controller = TextEditingController();
    controllers.add(controller);      //adding the current controller to the list

    for(int i = 0; i < controllers.length; i++){
      print(controllers[i].text);     //printing the values to show that it's working
    }

    _children = List.from(_children)
      ..add(TextFormField(
        controller: controller,
        decoration: InputDecoration(hintText: "This is TextField $_count"),
      ));
    setState(() => ++_count);
  }

  @override
  void dispose() {
    controllers.clear();
    super.dispose();
  }

}