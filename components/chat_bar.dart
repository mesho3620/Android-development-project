import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class  ChatBar extends StatelessWidget implements PreferredSizeWidget{
  @override
  Widget build(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,//combain the 2 back icons to navigate back
    backgroundColor: Colors.blue,
    flexibleSpace: SafeArea(
      child: Container(
        padding: EdgeInsets.only(right:16.0),
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_outlined),
            ),
            SizedBox(width: 3,),
            CircleAvatar(
              backgroundImage:AssetImage("images/1.jpg") ,
              maxRadius: 20.0,
            ),
            SizedBox(width: 12.0,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Adham Hamzawy",style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: 6,),
                  Text("Online",style: TextStyle(color: Colors.lightGreenAccent,fontSize: 11.0),),


                ],
              ),
            ),
            Icon(Icons.more_vert,color:Colors.black,),
          ],
        ),
      ),
    ),
  );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight) ;
 
    
  }
