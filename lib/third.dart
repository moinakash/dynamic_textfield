import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  List<DynamicWidget> listDynamic = [];
  List<String> data = [];

  Icon floatingIcon = Icon(Icons.add);

  addDynamic() {
    if (data.isNotEmpty) {
      floatingIcon = Icon(Icons.add);

      data = [];
      listDynamic = [];
      print('if');
    }
    setState(() {});
    if (listDynamic.length >= 5) {
      return;
    }
    listDynamic.add(DynamicWidget());
  }



  submitData() {
    floatingIcon =  Icon(Icons.arrow_back);
    data = [];
    listDynamic.forEach((widget) => data.add(widget.controller.text));
    setState(() {});
    print(data.length);
    print(data.toString());
  }

  @override
  Widget build(BuildContext context) {
    Widget result =  Flexible(
        flex: 1,
        child:  Card(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (_, index) {
              return  Padding(
                padding:  EdgeInsets.all(10.0),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                     Container(
                      margin:  EdgeInsets.only(left: 10.0),
                      child:  Text("${index + 1} : ${data[index]}"),
                    ),
                     Divider()
                  ],
                ),
              );
            },
          ),
        ));

    Widget dynamicTextField =  Flexible(
      flex: 2,
      child:  ListView.builder(
        itemCount: listDynamic.length,
        itemBuilder: (_, index) => listDynamic[index],
      ),
    );

    Widget submitButton =  Container(
      child:  RaisedButton(
        onPressed: submitData,
        child:  const Padding(
          padding:  EdgeInsets.all(16.0),
          child:  Text('Submit Data'),
        ),
      ),
    );

    return  MaterialApp(
      home:  Scaffold(
        appBar:  AppBar(
          title:  Text('Dynamic App'),
        ),
        body:  Container(
          margin:  EdgeInsets.all(10.0),
          child:  Column(
            children: <Widget>[
              data.length == 0 ? dynamicTextField : result,
              data.length == 0 ? submitButton :  Container(),
            ],
          ),
        ),
        floatingActionButton:  FloatingActionButton(
          onPressed: addDynamic,
          child: floatingIcon,
        ),
      ),
    );
  }
}

class DynamicWidget extends StatelessWidget {
  TextEditingController controller =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.all(8.0),
      child:  Container(
        height: 50,
        width: double.infinity,
        child: Row(

          children: [

            Container(
              height: 30,
              width: 300,
              child: TextField(
                controller: controller,
                decoration:  InputDecoration(hintText: 'Enter Data '),
              ),
            ),

            Container(
              height: 30,
              width: 20,
              child: IconButton(onPressed: (){


              }, icon: Icon(Icons.close)),
            )

          ],


        ),
      ),
    );
  }
}
