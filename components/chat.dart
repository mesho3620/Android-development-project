import 'package:chat11/model/chat_details_pagee.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserList extends StatefulWidget{
  String text;
  String secText;
  String image;
  String time;
  bool isread;
  UserList({@required this.text,@required this.secText,@required this.image,@required this.time,@required this.isread});

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return ChatDetailsPage();
        }

        ));
      },
//al massage bar bta3y
      child: Container(
        padding: EdgeInsets.only(left:16.0,right:16.0,top:10.0,bottom:10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage(widget.image),
                  maxRadius: 30.0,//cicleAvatar
                ),
                SizedBox(width: 16.0,),
                Expanded(
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(widget.text),
                        SizedBox(height: 6.0,),
                        Text(widget.secText,style: TextStyle(fontSize: 20.0,color: Colors.grey.shade500),),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(widget.time,style: TextStyle(fontSize:12,color:widget.isread?Colors.blue:Colors.grey.shade500),)
        ],
      ),

      ),
    );
  }
}