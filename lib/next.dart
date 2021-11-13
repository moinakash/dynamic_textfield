import 'package:flutter/material.dart';

class Next extends StatefulWidget {
  const Next({Key? key}) : super(key: key);

  @override
  _NextState createState() => _NextState();
}

class _NextState extends State<Next> {
  
  List TagListLength = [];
  //var nameTECs = <TextEditingController>[];

  List<TextEditingController> controllers = [];

  TextEditingController nameController = TextEditingController();
  int i = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //TagListLength.add(0);
  }

  @override
  void dispose() {
    controllers.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("this is title"),
      ),
      body: SingleChildScrollView(
        child: Column(

          children: [
            Buttons(),

            MyList()



          ],


        ),
      ),
    );
  }
  
  Widget MyList(){
    return Container(
     height: 400,
      width: 320,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: TagListLength.length,
          itemBuilder: (context,index){
        return Row(
          children: [
            Container(
              height: 30,
              width: 280,
              child: TextField(
                controller: nameController,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  hintText: TagListLength[index].toString(),

                ),

              ),
            ),
            Container(
              height: 30,
              width: 20,
              child: IconButton(onPressed: (){
                print("close");
                setState(() {
                  TagListLength.removeAt(index);
                  print("t--${TagListLength}");
                });


              }, icon: Icon(Icons.close)),
            )


          ],


        );

      }),

    );
    
  }

  Widget Buttons(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: (){

            if(i<11){

              setState(() {
                TagListLength.add(i);
                controllers.add(nameController);
                i++;

              });

            }





            print("add");
          },
          child: Text("Add", style: TextStyle(fontSize: 20),),
        ),
        SizedBox(
          width: 50,
        ),
        InkWell(
          onTap: (){
            print("all--${controllers}");
          },
          child: Text("Show All", style: TextStyle(fontSize: 20)),
        )

      ],

    );

  }
}
