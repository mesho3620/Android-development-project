import 'package:chat11/components/chat.dart';
import 'package:chat11/model/chat_users.dart';
import 'package:flutter/material.dart';
class MainChat extends StatefulWidget{
  @override
  _MainChatState createState() => _MainChatState();
}
//feha chat wa search wl new returned userlist feha name wa text wa time wa picture

class _MainChatState extends State<MainChat> {
  List<ChatUsers> chatUsers=[
    ChatUsers(text:"Adham", secText: "project android ", image: "images/1.jpg", time: "Now"),
    ChatUsers(text:"ahmed", secText: "MIu  ", image: "images/2.jpg", time: "2 seconds later"),
    ChatUsers(text:"karim", secText: "1 two 3 ", image: "images/3.jpg", time: "hour"),
    ChatUsers(text:"tamer", secText: "kind of  ", image: "images/2.jpg", time: "hour"),
    ChatUsers(text:"john", secText: "yes ", image: "images/3.jpg", time: "2 hours"),
    ChatUsers(text:"alaa", secText: "sure ", image: "images/1.jpg", time: "3 hours"),
    ChatUsers(text:"sarah", secText: "lol :) ", image: "images/2.jpg", time: "month"),
    ChatUsers(text:"janna", secText: "no", image: "images/3.jpg", time: "23 march"),
  ];
  @override
  Widget build(BuildContext context) {
return Scaffold(

  body: SingleChildScrollView(
    physics: BouncingScrollPhysics(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SafeArea(
          child: Padding(padding: EdgeInsets.only(left: 16.0,right: 16.0,top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:<Widget>[ Text("Chat",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.deepOrange),),
              Container(
                padding: EdgeInsets.only(left: 8.0,right: 8.0,top:2.0,bottom: 2.0),
                height: 30,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                  color: Colors.pink.shade50,),

                child: Row(
                  children: <Widget>[
                    Icon(Icons.add,color: Colors.deepOrange,size: 20,),
                    SizedBox(width: 2.0,),
                    Text("New",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14.0,),),
                    Container(

                    height:30.0,


                      ),


                  ],
                ),
              )
              ],
            )
            )
            ),
        Padding(
          padding:EdgeInsets.only(left:16.0,right:16.0,top:16.0),
        child:TextField(
          decoration: InputDecoration(
            hintText: "Search..",
            hintStyle:TextStyle(color:Colors.grey.shade400,),
            prefixIcon:Icon(Icons.search_rounded,size: 20.0,color: Colors.grey.shade400,),
            filled: true,
            fillColor: Colors.grey.shade200,
            contentPadding:EdgeInsets.all(8.0),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                    color: Colors.grey.shade100
    ))
            ),
          ),
        ),
        ListView.builder(
          itemCount: chatUsers.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context,index){
            return UserList(
              text:chatUsers[index].text ,
              secText: chatUsers[index].secText,
              image: chatUsers[index].image,
              time: chatUsers[index].time,
              isread:(index == 0 || index == 3 )? true:false,
            );
          },
        )
          ]
    ),

),
        );

  }
}
