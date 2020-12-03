import 'package:flutter/material.dart';
import 'package:page2/bottom_bar.dart';

void main() {
  runApp(Myapp());
}
class Myapp extends StatelessWidget{
  final appTitle='Settings';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     title: appTitle,
      home:GeneralSettings()
    );
  }
}
class GeneralSettings extends StatelessWidget {

  @override
  // This widget is the root of your application.
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
        appBar: new AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.deepOrange,
          title: new Text("Settings",style: TextStyle(color: Colors.black),),
          leading: IconButton(
            icon: Icon(Icons.arrow_back,color: Colors.black),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
        ),
        body:SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child:  Column(crossAxisAlignment:CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10.0)),
              margin:const EdgeInsets.all(8.0),
              color: Colors.white,
              child: ListTile(
                onTap: (){
                  //for editing the profile
                },
                title: Text("Adham Hamzawy",style: TextStyle(color: Colors.black),),
                leading: CircleAvatar(
                  backgroundColor: Colors.redAccent,
                  child: Text('AH'),
                ),
                trailing: Icon(Icons.edit,color: Colors.black,),
              ),
            ),
            const SizedBox(height: 10.0),
            Card(
              margin:const EdgeInsets.symmetric(vertical: 8.0,horizontal: 8.0),
              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10.0)),
              child: Column(
                children: <Widget>[
                ListTile(
                leading:Icon(Icons.lock_outline,color: Colors.black,) ,
                  title:Text("Change Password"),
                  trailing:Icon(Icons.keyboard_arrow_down,color: Colors.black,),
                onTap: (){
                  //change password
                },
                ),
                  Container(width: double.infinity,height: 1.0,color: Colors.grey.shade400,),
                  ListTile(
                    leading:Icon(Icons.keyboard,color: Colors.black,) ,
                    title:Text("Change Language"),
                    trailing:Icon(Icons.keyboard_arrow_down,color: Colors.black,),
                    onTap: (){
                    //change language
                    },
                  ),
                  Container(width: double.infinity,height: 1.0,color: Colors.grey.shade400,),
                  ListTile(
                    leading:Icon(Icons.map,color: Colors.black,) ,
                    title:Text("Change Location"),
                    trailing:Icon(Icons.keyboard_arrow_down,color: Colors.black,),
                    onTap: (){
                      //change location
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Text("Notification Settings",style:TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color:Colors.black,),
            ),
            SwitchListTile(
              contentPadding: const EdgeInsets.all(0),
              activeColor: Colors.deepOrange,
              value: true,
              title: Text("Reciveve Notification"),
              onChanged: (val){},
            ),
            SwitchListTile(
              contentPadding: const EdgeInsets.all(0),
              activeColor: Colors.deepOrange,
              value: false,
              title: Text("Reciveve news"),
              onChanged: null,
            ),
            SwitchListTile(
              contentPadding: const EdgeInsets.all(0),
              activeColor: Colors.deepOrange,
              value: true,
              title: Text("Reciveve offers"),
              onChanged: (val){},
            ),
            SwitchListTile(
              contentPadding: const EdgeInsets.all(0),
              activeColor: Colors.deepOrange,
              value: true,
              title: Text("Reciveve updates"),
              onChanged: (val){},
            ),
          ])


        ),
        floatingActionButton: FloatingActionButton(onPressed: (){},
    backgroundColor: Colors.deepOrange,
    child: Icon(Icons.home),

    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    bottomNavigationBar: BottomBar(),
    );
  }

  Container _buildDivider() => Container();
}